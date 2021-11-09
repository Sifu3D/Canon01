using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Serialization;
using CameraControl.Devices;
using CameraControl.Devices.Classes;

namespace CameraControl.Core.Classes
{
  public class PhotoSession : BaseFieldClass
  {
    private object _locker = new object();
    private string _lastFilename = null;

    [XmlIgnore] public List<string> SupportedExtensions = new List<string> {".jpg", ".nef", ".tif", ".png", ".cr2"};
    [XmlIgnore] public List<string> RawExtensions = new List<string> {".cr2", ".nef"};

    private string _name;
    public string Name
    {
      get { return _name; }
      set
      {
        _name = value;
        NotifyPropertyChanged("Name");
      }
    }

    private bool _alowFolderChange;
    public bool AlowFolderChange
    {
      get { return _alowFolderChange; }
      set
      {
        _alowFolderChange = value;
        NotifyPropertyChanged("AlowFolderChange");
      }
    }


    private string _folder;
    public string Folder
    {
      get { return _folder; }
      set
      {
        if (_folder != value)
        {
          if(!Directory.Exists(value))
          {
            try
            {
              Directory.CreateDirectory(value);
            }
            catch (Exception exception)
            {
              string folder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures), Name);
              if (value != folder)
                value = folder;
              Log.Error("Error creating session folder", exception);
            }
          }
          _systemWatcher.Path = value;
          _systemWatcher.EnableRaisingEvents = true;
          _systemWatcher.IncludeSubdirectories = true;
        }
        _folder = value;
        NotifyPropertyChanged("Folder");
      }
    }

    private string _fileNameTemplate;

    public string FileNameTemplate
    {
      get { return _fileNameTemplate; }
      set
      {
        _fileNameTemplate = value;
        NotifyPropertyChanged("FileNameTemplate");
      }
    }

    private int _counter;
    public int Counter
    {
      get { return _counter; }
      set
      {
        _counter = value;
        NotifyPropertyChanged("Counter");
      }
    }

    private bool _useOriginalFilename;
    public bool UseOriginalFilename
    {
      get { return _useOriginalFilename; }
      set
      {
        _useOriginalFilename = value;
        NotifyPropertyChanged("UseOriginalFilename");
      }
    }


    private AsyncObservableCollection<FileItem> _files;

    public AsyncObservableCollection<FileItem> Files
    {
      get { return _files; }
      set
      {
        _files = value;
        NotifyPropertyChanged("Files");
      }
    }

    private TimeLapseClass _timeLapse;
    public TimeLapseClass TimeLapse
    {
      get { return _timeLapse; }
      set
      {
        _timeLapse = value;
        NotifyPropertyChanged("TimeLapse");
      }
    }

    private BraketingClass _braketing;
    public BraketingClass Braketing
    {
      get { return _braketing; }
      set
      {
        _braketing = value;
        NotifyPropertyChanged("Braketing");
      }
    }

    private AsyncObservableCollection<TagItem> _tags;
    public AsyncObservableCollection<TagItem> Tags
    {
      get { return _tags; }
      set
      {
        _tags = value;
        NotifyPropertyChanged("Tags");
      }
    }

    private TagItem _selectedTag1;
    public TagItem SelectedTag1
    {
      get { return _selectedTag1; }
      set
      {
        _selectedTag1 = value;
        NotifyPropertyChanged("SelectedTag1");
      }
    }

    private TagItem _selectedTag2;
    public TagItem SelectedTag2
    {
      get { return _selectedTag2; }
      set
      {
        _selectedTag2 = value;
        NotifyPropertyChanged("SelectedTag2");
      }
    }

    private TagItem _selectedTag3;
    public TagItem SelectedTag3
    {
      get { return _selectedTag3; }
      set
      {
        _selectedTag3 = value;
        NotifyPropertyChanged("SelectedTag3");
      }
    }

    private TagItem _selectedTag4;
    public TagItem SelectedTag4
    {
      get { return _selectedTag4; }
      set
      {
        _selectedTag4 = value;
        NotifyPropertyChanged("SelectedTag4");
      }
    }


    private bool _useCameraCounter;
    public bool UseCameraCounter
    {
      get { return _useCameraCounter; }
      set
      {
        _useCameraCounter = value;
        NotifyPropertyChanged("UseCameraCounter");
      }
    }


    public string ConfigFile { get; set; }
    private FileSystemWatcher _systemWatcher;

    public PhotoSession()
    {
      _systemWatcher = new FileSystemWatcher();
      _systemWatcher.EnableRaisingEvents = false;
      _systemWatcher.Deleted += _systemWatcher_Deleted;
      _systemWatcher.Created += new FileSystemEventHandler(_systemWatcher_Created);

      Name = "Default";
      Braketing = new BraketingClass();
      Folder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyPictures), Name);
      Files = new AsyncObservableCollection<FileItem>();
      FileNameTemplate = "DSC_$C";
      TimeLapse = new TimeLapseClass();
      if (ServiceProvider.Settings!=null && ServiceProvider.Settings.VideoTypes.Count > 0)
        TimeLapse.VideoType = ServiceProvider.Settings.VideoTypes[0];
      TimeLapse.OutputFIleName = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyVideos),
                                              Name + ".avi");
      UseOriginalFilename = false;
      AlowFolderChange = false;
      Tags = new AsyncObservableCollection<TagItem>();
      UseCameraCounter = false;
    }

    void _systemWatcher_Created(object sender, FileSystemEventArgs e)
    {
      try
      {
        //AddFile(e.FullPath);
      }
      catch (Exception exception)
      {
        Log.Error("Add file error", exception);
      }
    }

    void _systemWatcher_Deleted(object sender, FileSystemEventArgs e)
    {
      FileItem deletedItem = null;
      lock (this)
      {
        foreach (FileItem fileItem in Files)
        {
          if (fileItem.FileName == e.FullPath)
            deletedItem = fileItem;
        }
      }
      try
      {
        if (deletedItem != null)
          Files.Remove(deletedItem);
          //Dispatcher.CurrentDispatcher.BeginInvoke(DispatcherPriority.Normal, new Action(() => Files.Remove(
          //  deletedItem)));
      }
      catch (Exception )
      {


      }
    }

    public string GetNextFileName(string ext, ICameraDevice device)
    {
      lock (_locker)
      {
        if (string.IsNullOrEmpty(ext))
          ext = ".nef";
        if (!string.IsNullOrEmpty(_lastFilename) && RawExtensions.Contains(ext.ToLower()) && !RawExtensions.Contains(Path.GetExtension(_lastFilename).ToLower()))
        {
          string rawfile = Path.Combine(Path.GetDirectoryName(_lastFilename), Path.GetFileNameWithoutExtension(_lastFilename) + (!ext.StartsWith(".") ? "." : "") + ext);
          if (!File.Exists(rawfile))
            return rawfile;
        }
        if (!UseCameraCounter)
          Counter++;
        string fileName = Path.Combine(Folder, FormatFileName(device) + (!ext.StartsWith(".") ? "." : "") + ext);
        if (File.Exists(fileName))
          return GetNextFileName(ext, device);
        _lastFilename = fileName;
        return fileName;
      }
    }

    private string FormatFileName(ICameraDevice device)
    {
      CameraProperty property = ServiceProvider.Settings.CameraProperties.Get(device);
      string res = FileNameTemplate;
      if (!res.Contains("$C"))
        res += "$C";
      if (UseCameraCounter)
      {
        res = res.Replace("$C", property.Counter.ToString("00000"));
        property.Counter = property.Counter + property.CounterInc;
      }
      else
      {
        res = res.Replace("$C", Counter.ToString("00000"));
      }
      res = res.Replace("$N", Name.Trim());
      if (device.ExposureCompensation != null)
        res = res.Replace("$E", device.ExposureCompensation.Value != "0" ? device.ExposureCompensation.Value : "");
      res = res.Replace("$D", DateTime.Now.ToString("yyyy-MM-dd"));
      res = res.Replace("$X", property.DeviceName.Replace(":", "_").Replace("?", "_").Replace("*", "_"));
      res = res.Replace("$Tag1", SelectedTag1 != null ? SelectedTag1.Value.Trim() : "");
      res = res.Replace("$Tag2", SelectedTag1 != null ? SelectedTag2.Value.Trim() : "");
      res = res.Replace("$Tag3", SelectedTag1 != null ? SelectedTag3.Value.Trim() : "");
      res = res.Replace("$Tag4", SelectedTag1 != null ? SelectedTag4.Value.Trim() : "");
      //prevent multiple \ if a tag is empty 
      while (res.Contains(@"\\"))
      {
        res = res.Replace(@"\\", @"\");
      }
      // if the file name start with \ the Path.Combine isn't work right 
      if (res.StartsWith("\\"))
        res = res.Substring(1);
      return res;
    }

    public FileItem AddFile(string fileName)
    {
      FileItem oitem = GetFile(fileName);
      if (oitem != null)
        return oitem;
      FileItem item = new FileItem(fileName);
      Files.Add(item);
      return item;
    }

    public bool ContainFile(string fileName)
    {
      foreach (FileItem fileItem in Files)
      {
        if (fileItem.FileName.ToUpper() == fileName.ToUpper())
          return true;
      }
      return false;
    }

    public FileItem GetFile(string fileName)
    {
      foreach (FileItem fileItem in Files)
      {
        if (fileItem.FileName.ToUpper() == fileName.ToUpper())
          return fileItem;
      }
      return null;
    }

    public override string ToString()
    {
      return Name;
    }

    public AsyncObservableCollection<FileItem> GetSelectedFiles()
    {
      AsyncObservableCollection<FileItem> list = new AsyncObservableCollection<FileItem>();
      foreach (FileItem fileItem in Files)
      {
        if (fileItem.IsChecked)
          list.Add(fileItem);
      }
      return list;
    }

    public void SelectAll()
    {
      foreach (FileItem fileItem in Files)
      {
        fileItem.IsChecked = true;
      }
    }

    public void SelectNone()
    {
      foreach (FileItem fileItem in Files)
      {
        fileItem.IsChecked = false;
      }
    }


  }
}
