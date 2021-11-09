using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Xml.Serialization;
using CameraControl.Devices;
using CameraControl.Devices.Classes;
using MahApps.Metro;

namespace CameraControl.Core.Classes
{
  public class Settings: BaseFieldClass
  {
    private string AppName = "digiCamControl";
    private string ConfigFile = "";
   
    //[XmlIgnore]
    //public WIAManager Manager { get; set; }

    private PhotoSession _defaultSession;

    [XmlIgnore]
    public PhotoSession DefaultSession
    {
      get { return _defaultSession; }
      set
      {
        if (value != null)
        {
          PhotoSession oldvalue = _defaultSession;
          _defaultSession = value;
          DefaultSessionName = _defaultSession.Name;
          var thread = new Thread(new ThreadStart(delegate
                                                       {
                                                         if (SessionSelected != null)
                                                           SessionSelected(oldvalue, value);
                                                         LoadData(_defaultSession);
                                                         NotifyPropertyChanged("DefaultSession");
                                                       }));
          thread.Start();
        }
      }
    }

    [XmlIgnore]
    public ObservableCollection<PhotoSession> PhotoSessions { get; set; }

    private BitmapFile _selectedBitmap;

    [XmlIgnore]
    public BitmapFile SelectedBitmap
    {
      get { return _selectedBitmap; }
      set
      {
        _selectedBitmap = value;
        NotifyPropertyChanged("DefaultSession");
      }
    }
   
    [XmlIgnore]
    public ObservableCollection<VideoType> VideoTypes { get; set; }

    private bool _imageLoading;
    [XmlIgnore]
    public bool ImageLoading
    {
      get { return _imageLoading; }
      set
      {
        _imageLoading = value;
        NotifyPropertyChanged("ImageLoading");
      }
    }

    private string _selectedLanguage;
    public string SelectedLanguage
    {
      get { return _selectedLanguage; }
      set
      {
        _selectedLanguage = value;
        NotifyPropertyChanged("SelectedLanguage");
      }
    }

    private bool _disableNativeDrivers;
    public bool DisableNativeDrivers
    {
      get { return _disableNativeDrivers; }
      set
      {
        _disableNativeDrivers = value;
        NotifyPropertyChanged("DisableNativeDrivers");
      }
    }

    private int _currentThemeIndex;
    public int CurrentThemeIndex
    {
      get { return _currentThemeIndex; }
      set
      {
        _currentThemeIndex = value;
        NotifyPropertyChanged("CurrentThemeIndex");
        if (ServiceProvider.WindowsManager != null)
          ServiceProvider.WindowsManager.ApplyTheme();
      }
    }

    private int _liveViewFreezeTimeOut;
    public int LiveViewFreezeTimeOut
    {
      get { return _liveViewFreezeTimeOut; }
      set
      {
        _liveViewFreezeTimeOut = value;
        NotifyPropertyChanged("LiveViewFreezeTimeOut");
      }
    }

    private bool _previewLiveViewImage;
    public bool PreviewLiveViewImage
    {
      get { return _previewLiveViewImage; }
      set
      {
        _previewLiveViewImage = value;
        NotifyPropertyChanged("PreviewLiveViewImage");
      }
    }

    public DateTime LastUpdateCheckDate { get; set; }

    private bool _triggerKeyAlt;
    public bool TriggerKeyAlt
    {
      get { return _triggerKeyAlt; }
      set
      {
        _triggerKeyAlt = value;
        NotifyPropertyChanged("TriggerKeyAlt");
      }
    }

    private bool _triggerKeyCtrl;

    public bool TriggerKeyCtrl
    {
      get { return _triggerKeyCtrl; }
      set
      {
        _triggerKeyCtrl = value;
        NotifyPropertyChanged("TriggerKeyCtrl");
      }
    }

    private bool _triggerKeyShift;
    public bool TriggerKeyShift
    {
      get { return _triggerKeyShift; }
      set
      {
        _triggerKeyShift = value;
        NotifyPropertyChanged("TriggerKeyShift");
      }
    }

    private Key _triggerKey;
    public Key TriggerKey
    {
      get { return _triggerKey; }
      set
      {
        _triggerKey = value;
        NotifyPropertyChanged("TriggerKey");
      }
    }

    private bool _usetriggerKey;
    public bool UseTriggerKey
    {
      get { return _usetriggerKey; }
      set
      {
        _usetriggerKey = value;
        NotifyPropertyChanged("UseTriggerKey");
      }
    }

    private bool _useWebserver;
    public bool UseWebserver
    {
      get { return _useWebserver; }
      set
      {
        _useWebserver = value;
        NotifyPropertyChanged("UseWebserver");
      }
    }

    private int _webserverPort;
    public int WebserverPort
    {
      get { return _webserverPort; }
      set
      {
        _webserverPort = value;
        NotifyPropertyChanged("WebserverPort");
        NotifyPropertyChanged("Webaddress");
      }
    }

    private bool _playSound;
    public bool PlaySound
    {
      get { return _playSound; }
      set
      {
        _playSound = value;
        NotifyPropertyChanged("PlaySound");
      }
    }

    private bool _showFocusPoints;
    public bool ShowFocusPoints
    {
      get { return _showFocusPoints; }
      set
      {
        _showFocusPoints = value;
        NotifyPropertyChanged("ShowFocusPoints");
      }
    }

    private string _defaultSessionName;
    public string DefaultSessionName
    {
      get { return _defaultSessionName; }
      set
      {
        _defaultSessionName = value;
        NotifyPropertyChanged("DefaultSessionName");
      }
    }

    public string Webaddress
    {
      get
      {
        try
        {
          var hostEntry = Dns.GetHostEntry(Dns.GetHostName());
          var ip = (
                     from addr in hostEntry.AddressList
                     where addr.AddressFamily.ToString() == "InterNetwork"
                     select addr.ToString()
                   ).FirstOrDefault();
          return string.Format("http://{0}:{1}", ip, WebserverPort);
        }
        catch (Exception exception)
        {
          Log.Error("Error get web address ",exception);
        }
        return "";
      }
    }

    private bool _preview;
    /// <summary>
    /// preview in full screen
    /// </summary>
    public bool Preview
    {
      get { return _preview; }
      set
      {
        _preview = value;
        NotifyPropertyChanged("Preview");
      }
    }

    private System.Windows.Media.Color _fullScreenColor;
    public System.Windows.Media.Color FullScreenColor
    {
      get { return _fullScreenColor; }
      set
      {
        _fullScreenColor = value;
        NotifyPropertyChanged("FullScreenColor");
      }
    }

    private int _previewSeconds;
    public int PreviewSeconds
    {
      get { return _previewSeconds; }
      set
      {
        _previewSeconds = value;
        NotifyPropertyChanged("PreviewSeconds");
      }
    }

    private bool _autoPreview;
    public bool AutoPreview
    {
      get { return _autoPreview; }
      set
      {
        _autoPreview = value;
        NotifyPropertyChanged("AutoPreview");
      }
    }

    private int _rotateIndex;
    public int RotateIndex
    {
      get { return _rotateIndex; }
      set
      {
        _rotateIndex = value;
        NotifyPropertyChanged("RotateIndex");
      }
    }

    private int _smalFocusStep;
    public int SmalFocusStep
    {
      get { return _smalFocusStep; }
      set
      {
        _smalFocusStep = value;
        NotifyPropertyChanged("SmalFocusStep");
      }
    }

    private int _mediumFocusStep;
    public int MediumFocusStep
    {
      get { return _mediumFocusStep; }
      set
      {
        _mediumFocusStep = value;
        NotifyPropertyChanged("MediumFocusStep");
      }
    }

    private int _largeFocusStep;
    public int LargeFocusStep
    {
      get { return _largeFocusStep; }
      set
      {
        _largeFocusStep = value;
        NotifyPropertyChanged("LargeFocusStep");
      }
    }

    private int _focusMoveStep;
    public int FocusMoveStep
    {
      get { return _focusMoveStep; }
      set
      {
        _focusMoveStep = value;
        NotifyPropertyChanged("FocusMoveStep");
      }
    }

    private bool _dontLoadThumbnails;
    public bool DontLoadThumbnails
    {
      get { return _dontLoadThumbnails; }
      set
      {
        _dontLoadThumbnails = value;
        NotifyPropertyChanged("DontLoadThumbnails");
      }
    }

    private string _externalViewer;
    public string ExternalViewer
    {
      get { return _externalViewer; }
      set
      {
        _externalViewer = value;
        NotifyPropertyChanged("ExternalViewer");
      }
    }

    private int _motionBlockSize;
    public int MotionBlockSize
    {
      get { return _motionBlockSize; }
      set
      {
        _motionBlockSize = value;
        NotifyPropertyChanged("MotionBlockSize");
      }
    }

    private int _detectionType;
    public int DetectionType
    {
      get { return _detectionType; }
      set
      {
        _detectionType = value;
        NotifyPropertyChanged("DetectionType");
      }
    }

    private bool _useExternalViewer;
    public bool UseExternalViewer
    {
      get { return _useExternalViewer; }
      set
      {
        _useExternalViewer = value;
        NotifyPropertyChanged("UseExternalViewer");
      }
    }

    private string _externalViewerPath;
    public string ExternalViewerPath
    {
      get { return _externalViewerPath; }
      set
      {
        _externalViewerPath = value;
        NotifyPropertyChanged("ExternalViewerPath");
      }
    }

    private string _externalViewerArgs;
    public string ExternalViewerArgs
    {
      get { return _externalViewerArgs; }
      set
      {
        _externalViewerArgs = value;
        NotifyPropertyChanged("ExternalViewerArgs");
      }
    }

    private string _selectedMainForm;
    public string SelectedMainForm
    {
      get { return _selectedMainForm; }
      set
      {
        _selectedMainForm = value;
        NotifyPropertyChanged("SelectedMainForm");
      }
    }

    private bool _lowMemoryUsage;
    public bool LowMemoryUsage
    {
      get { return _lowMemoryUsage; }
      set
      {
        _lowMemoryUsage = value;
        NotifyPropertyChanged("LowMemoryUsage");
      }
    }

    private bool _useParallelTransfer;
    public bool UseParallelTransfer
    {
      get { return _useParallelTransfer; }
      set
      {
        _useParallelTransfer = value;
        NotifyPropertyChanged("UseParallelTransfer");
      }
    }

    private bool _showUntranslatedLabelId;
    public bool ShowUntranslatedLabelId
    {
      get { return _showUntranslatedLabelId; }
      set
      {
        _showUntranslatedLabelId = value;
        NotifyPropertyChanged("ShowUntranslatedLabelId");
      }
    }


    public CameraPropertyEnumerator CameraProperties { get; set; }
    public string SelectedLayout { get; set; }
    public AsyncObservableCollection<CameraPreset> CameraPresets { get; set; }

    public Settings()
    {
      ConfigFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), AppName,
                                "settings.xml");
      CameraPresets = new AsyncObservableCollection<CameraPreset>();
      DefaultSession = new PhotoSession();
      PhotoSessions = new ObservableCollection<PhotoSession>();
      SelectedBitmap = new BitmapFile();
      ImageLoading = false;
      VideoTypes = new ObservableCollection<VideoType>
                     {
                       new VideoType("HD 1080 16:9", 1920, 1080),
                       new VideoType("UXGA 4:3", 1600, 1200),
                       new VideoType("HD 720 16:9", 1280, 720),
                       new VideoType("Super VGA 4:3", 800, 600),
                     };
      CameraProperties = new CameraPropertyEnumerator();
      ResetSettings();
    }


    public void ResetSettings()
    {
      DisableNativeDrivers = false;
      AutoPreview = true;
      CurrentThemeIndex = 0;
      LastUpdateCheckDate = DateTime.MinValue;
      UseTriggerKey = false;
      UseWebserver = false;
      WebserverPort = 5513;
      Preview = false;
      PreviewSeconds = 3;
      LiveViewFreezeTimeOut = 3;
      PreviewLiveViewImage = true;
      SmalFocusStep = 10;
      MediumFocusStep = 100;
      LargeFocusStep = 500;
      RotateIndex = 0;
      FullScreenColor = Colors.Black;
      SelectedLanguage = Thread.CurrentThread.CurrentCulture.Name;
      FocusMoveStep = 50;
      MotionBlockSize = 40;
      UseExternalViewer = false;
      ExternalViewerArgs = string.Empty;
      ShowFocusPoints = true;
      LowMemoryUsage = true;
      UseParallelTransfer = false;
      ShowUntranslatedLabelId = false;
    }

    public void Add(PhotoSession session)
    {
      Save(session);
      PhotoSessions.Add(session);
    }

    /// <summary>
    /// Load files attached to a session
    /// </summary>
    /// <param name="session"></param>
    public void LoadData(PhotoSession session)
    {
      if (session == null)
        return;
      FileItem[] fileItems = new FileItem[session.Files.Count];
      session.Files.CopyTo(fileItems, 0);
      //session.Files.Clear();
      if(!Directory.Exists(session.Folder))
      {
        Directory.CreateDirectory(session.Folder);
      }
      string[] files = Directory.GetFiles(session.Folder);
      foreach (string file in files)
      {
       if(session.SupportedExtensions.Contains(Path.GetExtension(file).ToLower()))
       {
         if (!session.ContainFile(file))
           session.AddFile(file);
       }
      }
      // remove files which was deleted or not exist
      List<FileItem> removedItems = session.Files.Where(fileItem => !File.Exists(fileItem.FileName)).ToList();
      foreach (FileItem removedItem in removedItems)
      {
        session.Files.Remove(removedItem);
      }
      //session.Files = new AsyncObservableCollection<FileItem>(session.Files.OrderBy(x => x.FileDate));
    }

    public void Save(PhotoSession session)
    {
      if (session == null)
        return;
      try
      {
        string filename = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), AppName,
                                       "Sessions", session.Name + ".xml");
        XmlSerializer serializer = new XmlSerializer(typeof(PhotoSession));
        // Create a FileStream to write with.

        Stream writer = new FileStream(filename, FileMode.Create);
        // Serialize the object, and close the TextWriter
        serializer.Serialize(writer, session);
        writer.Close();
      }
      catch (Exception exception)
      {
        Log.Error("Unable to save session " + session.Name, exception);
      }
    }

    public void Save(Branding branding)
    {
      if (branding == null)
        return;
      try
      {
        string filename = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), AppName,"Branding.xml");
        XmlSerializer serializer = new XmlSerializer(typeof(Branding));
        // Create a FileStream to write with.

        Stream writer = new FileStream(filename, FileMode.Create);
        // Serialize the object, and close the TextWriter
        serializer.Serialize(writer, branding);
        writer.Close();
      }
      catch (Exception)
      {
        Log.Error("Unable to save session branding file" );
      }
    }

    public PhotoSession Load(string filename)
    {
      PhotoSession photoSession = new PhotoSession();
      try
      {
        if (File.Exists(filename))
        {
          XmlSerializer mySerializer =
            new XmlSerializer(typeof(PhotoSession));
          FileStream myFileStream = new FileStream(filename, FileMode.Open);
          photoSession = (PhotoSession)mySerializer.Deserialize(myFileStream);
          myFileStream.Close();
          photoSession.ConfigFile = filename;
        }
      }
      catch (Exception e)
      {
        Log.Error(e);
      }
      return photoSession;
    }

    public Branding LoadBranding()
    {
      Branding branding = new Branding();
      string filename = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location), "Branding.xml");
      try
      {
        if (File.Exists(filename))
        {
          XmlSerializer mySerializer =
            new XmlSerializer(typeof(Branding));
          FileStream myFileStream = new FileStream(filename, FileMode.Open);
          branding = (Branding)mySerializer.Deserialize(myFileStream);
          myFileStream.Close();
        }
      }
      catch (Exception e)
      {
        Log.Error(e);
      }
      return branding;
    }

    public Settings Load()
    {
      Settings settings = new Settings();
      try
      {
        if (!Directory.Exists(Path.GetDirectoryName(ConfigFile)))
        {
          Directory.CreateDirectory(Path.GetDirectoryName(ConfigFile));
        }
        if (File.Exists(ConfigFile))
        {
          XmlSerializer mySerializer =
            new XmlSerializer(typeof(Settings));
          FileStream myFileStream = new FileStream(ConfigFile, FileMode.Open);
          settings = (Settings)mySerializer.Deserialize(myFileStream);
          myFileStream.Close();
        }
        else
        {
          settings.Save();
        }
      }
      catch (Exception exception)
      {
        Log.Error("Error loading config file ", exception);
      }
      return settings;
    }

    public PhotoSession GetSession(string name)
    {
      if (string.IsNullOrEmpty(name))
        return null;
      if (!string.IsNullOrEmpty(name))
      {
        return PhotoSessions.FirstOrDefault(photoSession => photoSession.Name == name);
      }
      return null;
    }

    public CameraPreset GetPreset(string name)
    {
      if (string.IsNullOrEmpty(name))
        return null;
      foreach (CameraPreset cameraPreset in CameraPresets)
      {
        if (cameraPreset.Name == name)
          return cameraPreset;
      }
      return null;
    }

    public void LoadSessionData()
    {
      string sesionFolder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData),
                                   AppName, "Sessions");
      if (!Directory.Exists(sesionFolder))
      {
        Directory.CreateDirectory(sesionFolder);
      }

      string[] sesions = Directory.GetFiles(sesionFolder, "*.xml");
      foreach (string sesion in sesions)
      {
        try
        {
          Add(Load(sesion));
        }
        catch (Exception e)
        {
          Log.Error("Error loading session :" + sesion, e);
        }
      }
      if (PhotoSessions.Count > 0)
      {
        DefaultSession = GetSession(DefaultSessionName) ?? PhotoSessions[0];
      }
      if (PhotoSessions.Count == 0)
      {
        Add(DefaultSession);
      }
    }

    public void Save()
    {
      XmlSerializer serializer = new XmlSerializer(typeof(Settings));
      // Create a FileStream to write with.

      Stream writer = new FileStream(ConfigFile, FileMode.Create);
      // Serialize the object, and close the TextWriter
      serializer.Serialize(writer, this);
      writer.Close();
    }

    public void ApplyTheme(Window window)
    {
      switch (CurrentThemeIndex)
      {
        case 0:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Blue"), Theme.Dark);
          break;
        case 1:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Green"), Theme.Dark);
          break;
        case 2:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Orange"), Theme.Dark);
          break;
        case 3:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Purple"), Theme.Dark);
          break;
        case 4:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Red"), Theme.Dark);
          break;
        case 5:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Blue"), Theme.Light);
          break;
        case 6:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Green"), Theme.Light);
          break;
        case 7:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Orange"), Theme.Light);
          break;
        case 8:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Purple"), Theme.Light);
          break;
        case 9:
          ThemeManager.ChangeTheme(window, ThemeManager.DefaultAccents.First(a => a.Name == "Red"), Theme.Light);
          break;

      }
      
    }

    public delegate void SessionSelectedEventHandler(PhotoSession oldvalu, PhotoSession newvalue);
    public event SessionSelectedEventHandler SessionSelected;
  }
}
