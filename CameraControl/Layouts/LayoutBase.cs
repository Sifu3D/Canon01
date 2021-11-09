using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Windows;
using CameraControl.Classes;
using CameraControl.Core;
using CameraControl.Core.Classes;
using CameraControl.Devices;
using Microsoft.VisualBasic.FileIO;
using System.Windows.Controls;
using Clipboard = System.Windows.Clipboard;
using ListBox = System.Windows.Controls.ListBox;
using MessageBox = System.Windows.MessageBox;
using UserControl = System.Windows.Controls.UserControl;

namespace CameraControl.Layouts
{
  public class LayoutBase : UserControl
  {
    public ListBox ImageLIst { get; set; }
    private readonly BackgroundWorker _worker = new BackgroundWorker();


    public LayoutBase()
    {
      SelectAllCommand = new RelayCommand<object>(delegate { ServiceProvider.Settings.DefaultSession.SelectAll(); });
      SelectNoneCommand = new RelayCommand<object>(delegate { ServiceProvider.Settings.DefaultSession.SelectNone(); });
      CopyNameClipboardCommand = new RelayCommand<object>(delegate { Clipboard.SetText(ServiceProvider.Settings.SelectedBitmap.FileItem.FileName); });
      OpenExplorerCommand = new RelayCommand<object>(OpenInExplorer);
      OpenViewerCommand = new RelayCommand<object>(OpenViewer);
      DeleteItemCommand = new RelayCommand<object>(DeleteItem);
      ImageDoubleClickCommand = new RelayCommand<object>(delegate { ServiceProvider.WindowsManager.ExecuteCommand(WindowsCmdConsts.FullScreenWnd_Show); });
      _worker.DoWork += worker_DoWork;
    }

    public RelayCommand<object> SelectAllCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> SelectNoneCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> CopyNameClipboardCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> OpenExplorerCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> OpenViewerCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> DeleteItemCommand
    {
      get;
      private set;
    }

    public RelayCommand<object> ImageDoubleClickCommand
    {
      get;
      private set;
    }

    void OpenInExplorer(object o)
    {
      if (ServiceProvider.Settings.SelectedBitmap == null || ServiceProvider.Settings.SelectedBitmap.FileItem == null)
        return;
      try
      {
        ProcessStartInfo processStartInfo = new ProcessStartInfo();
        processStartInfo.FileName = "explorer";
        processStartInfo.UseShellExecute = true;
        processStartInfo.WindowStyle = ProcessWindowStyle.Normal;
        processStartInfo.Arguments =
            string.Format("/e,/select,\"{0}\"", ServiceProvider.Settings.SelectedBitmap.FileItem.FileName);
        Process.Start(processStartInfo);
      }
      catch (Exception exception)
      {
        Log.Error("Error to show file in explorer", exception);
      } 
    }

    void OpenViewer(object o)
    {
      if (ServiceProvider.Settings.SelectedBitmap == null || ServiceProvider.Settings.SelectedBitmap.FileItem == null)
        return;
      if (!string.IsNullOrWhiteSpace(ServiceProvider.Settings.ExternalViewer) && File.Exists(ServiceProvider.Settings.ExternalViewer))
      {
        Process.Start(ServiceProvider.Settings.ExternalViewer, ServiceProvider.Settings.SelectedBitmap.FileItem.FileName);
      }
      else
      {
        Process.Start(ServiceProvider.Settings.SelectedBitmap.FileItem.FileName);        
      }
    }

    void  DeleteItem(object o)
    {
      List<FileItem> filestodelete = new List<FileItem>();
      try
      {
        foreach (FileItem fileItem in ServiceProvider.Settings.DefaultSession.Files)
        {
          if (fileItem.IsChecked || !File.Exists(fileItem.FileName))
            filestodelete.Add(fileItem);
        }

        if (ServiceProvider.Settings.SelectedBitmap != null && ServiceProvider.Settings.SelectedBitmap.FileItem != null &&
            filestodelete.Count == 0)
          filestodelete.Add(ServiceProvider.Settings.SelectedBitmap.FileItem);

        if (filestodelete.Count == 0)
          return;

        if (
          MessageBox.Show("Do you really want to delete selected file(s) ?", "Delete file",MessageBoxButton.YesNo) ==
          MessageBoxResult.Yes)
        {
          foreach (FileItem fileItem in filestodelete)
          {
            if ((ServiceProvider.Settings.SelectedBitmap != null &&
                 ServiceProvider.Settings.SelectedBitmap.FileItem != null &&
                 fileItem.FileName == ServiceProvider.Settings.SelectedBitmap.FileItem.FileName))
            {
              ServiceProvider.Settings.SelectedBitmap.DisplayImage = null;
            }
            if (File.Exists(fileItem.FileName))
              FileSystem.DeleteFile(fileItem.FileName, UIOption.OnlyErrorDialogs,
                                    RecycleOption.SendToRecycleBin);
            else
            {
              ServiceProvider.Settings.DefaultSession.Files.Remove(fileItem);
            }
          }
          if (ImageLIst.Items.Count > 0)
            ImageLIst.SelectedIndex = 0;
        }
      }
      catch (Exception exception)
      {
        Log.Error("Error to delete file", exception);
      } 
    }

    public void InitServices()
    {
      ServiceProvider.Settings.PropertyChanged += Settings_PropertyChanged;
      ServiceProvider.WindowsManager.Event += Trigger_Event;
      ImageLIst.SelectionChanged += ImageLIst_SelectionChanged;
      if (ServiceProvider.Settings.DefaultSession.Files.Count > 0)
        ImageLIst.SelectedIndex = 0;
    }

    private void ImageLIst_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
      if (_worker.IsBusy)
        return;
      if (e.AddedItems.Count > 0)
      {
        FileItem item = e.AddedItems[0] as FileItem;
        if (item != null)
        {
          //image1.Source = item.Thumbnail;
          ServiceProvider.Settings.SelectedBitmap.SetFileItem(item);
          _worker.RunWorkerAsync(item);
        }
      }
    }

    private void worker_DoWork(object sender, DoWorkEventArgs e)
    {
      //Thread.Sleep(200);
      //FileItem fileItem = e.Argument as FileItem;
      //if (ServiceProvider.Settings.SelectedBitmap.FileItem.FileName != fileItem.FileName)
      //  return;
      ServiceProvider.Settings.ImageLoading = true;
      BitmapLoader.Instance.GetBitmap(ServiceProvider.Settings.SelectedBitmap);
      ServiceProvider.Settings.ImageLoading = false;
      GC.Collect();
    }


    private void Settings_PropertyChanged(object sender, PropertyChangedEventArgs e)
    {
      if (e.PropertyName == "DefaultSession")
      {
        Thread.Sleep(1000);
        Dispatcher.Invoke(new Action(delegate
                                       {
                                         ImageLIst.SelectedIndex = 0;
                                         if (ImageLIst.Items.Count == 0)
                                           ServiceProvider.Settings.SelectedBitmap.DisplayImage = null;
                                       }));
      }
    }

    void Trigger_Event(string cmd, object o)
    {
      Dispatcher.Invoke(new Action(delegate
      {
        switch (cmd)
        {
          case WindowsCmdConsts.Next_Image:
            if (ImageLIst.SelectedIndex < ImageLIst.Items.Count - 1)
            {
              ImageLIst.SelectedIndex++;
            }
            break;
          case WindowsCmdConsts.Prev_Image:
            if (ImageLIst.SelectedIndex > 0)
            {
              ImageLIst.SelectedIndex--;
            }
            break;
          case WindowsCmdConsts.Select_Image:
            FileItem fileItem = o as FileItem;
            if (fileItem != null)
              Dispatcher.Invoke(
                new Action(
                  delegate
                    {
                      ImageLIst.SelectedValue = fileItem;
                      ImageLIst.ScrollIntoView(fileItem);
                    }));
            break;
        }
      }));
    }

  }

}
