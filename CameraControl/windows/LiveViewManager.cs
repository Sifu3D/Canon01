using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using CameraControl.Classes;
using CameraControl.Core;
using CameraControl.Core.Classes;
using CameraControl.Core.Interfaces;
using CameraControl.Devices;
using CameraControl.Devices.Classes;

namespace CameraControl.windows
{
  public class LiveViewManager : IWindow
  {
    private static object _locker = new object();

    #region Implementation of IWindow

    private Dictionary<object, LiveViewWnd> _register;

    public LiveViewManager()
    {
      _register = new Dictionary<object, LiveViewWnd>();
    }

    public void ExecuteCommand(string cmd, object param)
    {
      if (param == null)
        param = ServiceProvider.DeviceManager.SelectedCameraDevice;
      switch (cmd)
      {
        case WindowsCmdConsts.LiveViewWnd_Show:
          if (!_register.ContainsKey(param))
          {
            Application.Current.Dispatcher.Invoke(new Action(delegate
                                                               {
                                                                 LiveViewWnd wnd = new LiveViewWnd();
                                                                 ServiceProvider.Settings.ApplyTheme(wnd);
                                                                 _register.Add(param, wnd);
                                                               }));
          }
          _register[param].ExecuteCommand(cmd, param);
          break;
        case WindowsCmdConsts.LiveViewWnd_Hide:
          if (_register.ContainsKey(param))
            _register[param].ExecuteCommand(cmd, param);
          break;
        case CmdConsts.All_Close:
          foreach (var liveViewWnd in _register)
          {
            liveViewWnd.Value.ExecuteCommand(cmd, param);
          }
          break;
          default:
          foreach (var liveViewWnd in _register)
          {
            if (cmd.StartsWith("LiveView"))
            liveViewWnd.Value.ExecuteCommand(cmd, param);
          }
          break;
     }

    }

    public bool IsVisible { get; private set; }

    #endregion

    public static void StartLiveView(ICameraDevice device)
    {
      lock (_locker)
      {
        device.StartLiveView();
      }
    }

    public static void StopLiveView(ICameraDevice device)
    {
      lock (_locker)
      {
        device.StopLiveView();
      }
    }

    public static LiveViewData GetLiveViewImage(ICameraDevice device)
    {
      lock (_locker)
      {
        return device.GetLiveViewImage();
      }
    }

  }
}
