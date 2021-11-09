using WIA;

namespace CameraControl.Devices.Classes
{
  public class DeviceDescriptor
  {
    public string SerialNumber { get; set; }
    public string WpdId { get; set; }
    public ICameraDevice CameraDevice { get; set; }
    public string WiaId { get; set; }
    //public WIAManager WiaManager { get; set; }
    public IDeviceInfo WiaDeviceInfo { get; set; }
    public Device WiaDevice { get; set; }
  }
}
