using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CameraControl.Core;
using CameraControl.Core.Classes;
using CameraControl.Devices;
using CameraControl.Devices.Classes;

namespace CameraControl.Classes
{
  static class WpfCommands
  {
    /// <summary>
    /// Gets the command for selecting a device
    /// </summary>
    public static RelayCommand<ICameraDevice> SelectDeviceCommand
    {
      get;
      private set;
    }

    /// <summary>
    /// Gets the show live view command. As command parameter ICameraDevice required
    /// </summary>
    /// <value>
    /// The show live view command.
    /// </value>
    public static RelayCommand<ICameraDevice> ShowLiveViewCommand
    {
      get;
      private set;
    }

    public static RelayCommand<ICameraDevice> DevicePropertyCommand
    {
      get;
      private set;
    }



    static WpfCommands()
    {
      SelectDeviceCommand = new RelayCommand<ICameraDevice>(SelectCamera);
      ShowLiveViewCommand = new RelayCommand<ICameraDevice>(device => ServiceProvider.WindowsManager.ExecuteCommand(WindowsCmdConsts.LiveViewWnd_Show, device), device => (device != null && device.GetCapability(CapabilityEnum.LiveView)));
      DevicePropertyCommand =new RelayCommand<ICameraDevice>(x => ServiceProvider.WindowsManager.ExecuteCommand(WindowsCmdConsts.CameraPropertyWnd_Show, x));
    }   

    public static void SelectCamera(ICameraDevice cameraDevice)
    {
      ServiceProvider.DeviceManager.SelectedCameraDevice = cameraDevice;
    }

  }
}
