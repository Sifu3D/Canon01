using System;
using System.ComponentModel;
using System.Threading;
using System.Timers;
using System.Windows;
using CameraControl.Classes;
using CameraControl.Core;
using CameraControl.Devices;
using CameraControl.Devices.Classes;
using Timer = System.Timers.Timer;

namespace CameraControl.windows
{
  /// <summary>
  /// Interaction logic for BulbWnd.xaml
  /// </summary>
  public partial class BulbWnd : INotifyPropertyChanged
  {
    private Timer _captureTimer = new Timer(1000);
    private Timer _waitTimer = new Timer(1000);
    private int _captureSecs;
    private int _waitSecs;
    private int _photoCount = 0;

    public ICameraDevice CameraDevice { get; set; }
    private bool _noAutofocus;
    public bool NoAutofocus
    {
      get { return _noAutofocus; }
      set
      {
        _noAutofocus = value;
        NotifyPropertyChanged("NoAutofocus");
      }
    }

    private int _captureTime;
    public int CaptureTime
    {
      get { return _captureTime; }
      set
      {
        _captureTime = value;
        NotifyPropertyChanged("CaptureTime");
      }
    }


    private int _numOfPhotos;
    public int NumOfPhotos
    {
      get { return _numOfPhotos; }
      set
      {
        _numOfPhotos = value;
        NotifyPropertyChanged("NumOfPhotos");
      }
    }

    private int _waitTime;
    public int WaitTime
    {
      get { return _waitTime; }
      set
      {
        _waitTime = value;
        NotifyPropertyChanged("WaitTime");
      }
    }

    private string _message;
    public string Message
    {
      get { return _message; }
      set
      {
        _message = value;
        NotifyPropertyChanged("Message");
      }
    }


    public BulbWnd()
    {
      CameraDevice = ServiceProvider.DeviceManager.SelectedCameraDevice;
      Init();
    }

    public BulbWnd(ICameraDevice device)
    {
      CameraDevice = device;
      Init();
    }


    private void Init()
    {
      //NoAutofocus = true;
      CaptureTime = 60;
      NumOfPhotos = 1;
      WaitTime = 0;
      InitializeComponent();
      _captureTimer.Elapsed += _captureTimer_Elapsed;
      _waitTimer.Elapsed += _waitTimer_Elapsed;
      ServiceProvider.Settings.ApplyTheme(this);
    }

    void _waitTimer_Elapsed(object sender, ElapsedEventArgs e)
    {
      _waitSecs++;
      Message = string.Format("Waiting for next capture {0} sec. Photo done {1}/{2}",
                              _waitSecs, _photoCount, NumOfPhotos);
      if (_waitSecs >= WaitTime)
      {
        _waitTimer.Stop();
        StartCapture();
      }
    }

    void _captureTimer_Elapsed(object sender, ElapsedEventArgs e)
    {
      _captureSecs ++;
      Message = string.Format("Capture time {0}/{1} sec. Photo done {2}/{3}", _captureSecs, CaptureTime, _photoCount,
                              NumOfPhotos);
      if (_captureSecs > CaptureTime)
      {
        _captureTimer.Stop();
        StopCapture();
        _photoCount++;
        _waitSecs = 0;
        if (_photoCount < NumOfPhotos)
        {
          _waitTimer.Start();
        }
      }
    }

    private void btn_start_Click(object sender, RoutedEventArgs e)
    {
      _photoCount = 0;
      StartCapture();
    }

    void StartCapture()
    {
      Thread thread = new Thread(StartCaptureThread);
      thread.Start();
    }

    void StartCaptureThread()
    {
      bool retry;
      do
      {
        retry = false;
        try
        {
          Log.Debug("Bulb capture started");
          CameraDevice.LockCamera();
          CameraDevice.StartBulbMode();
        }
        catch (DeviceException deviceException)
        {
          if (deviceException.ErrorCode == ErrorCodes.ERROR_BUSY)
            retry = true;
          else
          {
            StaticHelper.Instance.SystemMessage = deviceException.Message;
            Log.Error("Bulb start", deviceException);
          }
        }
        catch (Exception exception)
        {
          StaticHelper.Instance.SystemMessage = exception.Message;
          Log.Error("Bulb start", exception);
        }
      } while (retry);

      _waitSecs = 0;
      _captureSecs = 0;
      _captureTimer.Start();
    }

    #region Implementation of INotifyPropertyChanged

    public virtual event PropertyChangedEventHandler PropertyChanged;

    public virtual void NotifyPropertyChanged(String info)
    {
      if (PropertyChanged != null)
      {
        PropertyChanged(this, new PropertyChangedEventArgs(info));
      }
    }

    #endregion

    private void btn_stop_Click(object sender, RoutedEventArgs e)
    {
      StopCapture();
    }

    private void StopCapture()
    {
      Thread thread = new Thread(StopCaptureThread);
      thread.Start();
      _captureTimer.Stop();
      _waitTimer.Stop();
      StaticHelper.Instance.SystemMessage = "Capture stopped";
      Log.Debug("Bulb capture stopped");
    }


    private void StopCaptureThread()
    {
      bool retry ;
      do
      {
        retry = false;
        try
        {
          CameraDevice.EndBulbMode();
          StaticHelper.Instance.SystemMessage = "Capture done";
          Log.Debug("Bulb capture done");
        }
        catch (DeviceException deviceException)
        {
          if (deviceException.ErrorCode == ErrorCodes.ERROR_BUSY)
            retry = true;
          else
          {
            StaticHelper.Instance.SystemMessage = deviceException.Message;
            Log.Error("Bulb done", deviceException);
          }
            
        }
        catch (Exception exception)
        {
          StaticHelper.Instance.SystemMessage = exception.Message;
          Log.Error("Bulb done", exception);
        }
      } while (retry);
    }

    private void Window_Closed(object sender, EventArgs e)
    {
      if (_captureTimer.Enabled)
      {
        StopCaptureThread();
        CameraDevice.UnLockCamera();
      }
      _captureTimer.Stop();
      _waitTimer.Stop();
    }

    private void btn_help_Click(object sender, RoutedEventArgs e)
    {
      HelpProvider.Run(HelpSections.Bulb);
    }

  }
}
