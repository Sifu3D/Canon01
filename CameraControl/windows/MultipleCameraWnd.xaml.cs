using System;
using System.Linq;
using System.Threading;
using System.Timers;
using System.Windows;
using System.Windows.Media;
using CameraControl.Classes;
using CameraControl.Core;
using CameraControl.Core.Classes;
using CameraControl.Core.Interfaces;
using CameraControl.Devices;
using CameraControl.Devices.Classes;

namespace CameraControl.windows
{
  /// <summary>
  /// Interaction logic for MultipleCameraWnd.xaml
  /// </summary>
  public partial class MultipleCameraWnd : IWindow
  {
    public bool DisbleAutofocus { get; set; }
    public int DelaySec { get; set; }
    public int WaitSec { get; set; }
    public int NumOfPhotos { get; set; }

    private System.Timers.Timer _timer = new System.Timers.Timer(1000);
    private int _secounter = 0;
    private int _photocounter = 0;

    private MediaPlayer _player = new MediaPlayer();

    public MultipleCameraWnd()
    {
      NumOfPhotos = 1;
      _player.Open(new Uri("Resources/tit.wav", UriKind.Relative));
      _player.MediaEnded += _player_MediaEnded;

      InitializeComponent();
      _timer.Elapsed += new ElapsedEventHandler(_timer_Elapsed);
    }
    /// <summary>
    /// After 3 x tit, wait for WaitSec seconds, then capture photos from connected camera
    /// </summary>
    void _player_MediaEnded(object sender, EventArgs e)
    {
      if (WaitSec > 0)
      {
        _timer.Start();
      } else
      {
        InitCapture();
      }
    }

    private void InitCapture()
    {
      WaitSec = 0;
      CapturePhotos();
    }

    void _timer_Elapsed(object sender, ElapsedEventArgs e)
    {
      _secounter++;
      if(_secounter>WaitSec)
      {
        _timer.Stop();
        InitCapture();
      }
      else
      {
        StaticHelper.Instance.SystemMessage = string.Format("Waiting {0})", _secounter);        
      }
    }

    #region Implementation of IWindow

    public void ExecuteCommand(string cmd, object param)
    {
      switch (cmd)
      {
        case WindowsCmdConsts.MultipleCameraWnd_Show:
          Dispatcher.Invoke(new Action(delegate
          {
            Show();
            Activate();
            //Topmost = true;
            //Topmost = false;
            Focus();
          }));
          break;
        case WindowsCmdConsts.MultipleCameraWnd_Hide:
          Hide();
          break;
        case CmdConsts.All_Close:
          Dispatcher.Invoke(new Action(delegate
          {
            Hide();
            Close();
          }));
          break;
      }
    }

    #endregion

    private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
    {
      if (IsVisible)
      {
        e.Cancel = true;
        ServiceProvider.WindowsManager.ExecuteCommand(WindowsCmdConsts.MultipleCameraWnd_Hide);
      }
    }

    private void btn_shot_Click(object sender, RoutedEventArgs e)
    {
      _secounter = 0;
      _photocounter = 0;
      _player.Position = TimeSpan.Zero;
      _player.Play();
      //_timer.Start();
    }

    private void CapturePhotos()
    {
      _photocounter++;
     StaticHelper.Instance.SystemMessage = string.Format("Capture started multiple cameras {0}", _photocounter);
      Thread thread = new Thread(new ThreadStart(delegate
      {
        while (CamerasAreBusy())
        {

        }
        try
        {
          foreach (ICameraDevice connectedDevice in ServiceProvider.DeviceManager.ConnectedDevices.Where(connectedDevice => connectedDevice.IsConnected && connectedDevice.IsChecked))
          {
            Thread.Sleep(DelaySec);
            ICameraDevice device = connectedDevice;
            Thread threadcamera = new Thread(new ThreadStart(delegate
                                                               {
                                                                 try
                                                                 {
                                                                   if (DisbleAutofocus &&
                                                                       device.GetCapability(CapabilityEnum.CaptureNoAf))
                                                                   {
                                                                     device.CapturePhotoNoAf();
                                                                   }
                                                                   else
                                                                   {
                                                                     device.CapturePhoto();
                                                                   }
                                                                 }
                                                                 catch (Exception exception)
                                                                 {
                                                                   Log.Error(exception);
                                                                   StaticHelper.Instance.SystemMessage =
                                                                     exception.Message;
                                                                 }
                                                               }));
            threadcamera.Start();
          }
        }
        catch (Exception exception)
        {
          Log.Error(exception);
        }

        Thread.Sleep(DelaySec);

      }));
      thread.Start();
      if (_photocounter < NumOfPhotos)
      {
        _player.Position = TimeSpan.Zero;
        _player.Play();
        //_timer.Start();
      }
      else
      {
        StopCapture();
      }
    }


    private bool CamerasAreBusy()
    {
      return ServiceProvider.DeviceManager.ConnectedDevices.Aggregate(false, (current, connectedDevice) => connectedDevice.IsBusy || current);
    }

    private void btn_stop_Click(object sender, RoutedEventArgs e)
    {
      _timer.Stop();
      _photocounter = NumOfPhotos;
      StopCapture();
    }

    private void StopCapture()
    {
     StaticHelper.Instance.SystemMessage = "All captures done !";
    }

    private void MenuItem_Click(object sender, RoutedEventArgs e)
    {
      if(listBox1.SelectedItem!=null)
        ServiceProvider.WindowsManager.ExecuteCommand(WindowsCmdConsts.CameraPropertyWnd_Show,
                                                    listBox1.SelectedItem);
    }

    private void MenuItem_Click_1(object sender, RoutedEventArgs e)
    {
      if(listBox1.SelectedItem!=null)
      {
        CameraPreset preset=new CameraPreset();
        preset.Get((ICameraDevice)listBox1.SelectedItem);
        foreach (ICameraDevice connectedDevice in ServiceProvider.DeviceManager.ConnectedDevices)
        {
          if (connectedDevice.IsConnected && connectedDevice.IsChecked)
            preset.Set(connectedDevice); 
        }
      }
    }

    private void btn_help_Click(object sender, RoutedEventArgs e)
    {
      HelpProvider.Run(HelpSections.MultipleCamera);
    }

    private void btn_resetCounters_Click(object sender, RoutedEventArgs e)
    {
      foreach (ICameraDevice connectedDevice in ServiceProvider.DeviceManager.ConnectedDevices)
      {
        CameraProperty property = ServiceProvider.Settings.CameraProperties.Get(connectedDevice);
        property.Counter = 0;
      }
    }

  }
}
