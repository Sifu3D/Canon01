using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using CameraControl.Devices.Classes;
using Canon.Eos.Framework;
using Canon.Eos.Framework.Eventing;
using Canon.Eos.Framework.Internal.SDK;
using PortableDeviceLib;
using PortableDeviceLib.Model;

namespace CameraControl.Devices.Canon
{
    public class CanonSDKBase : BaseMTPCamera
    {
        
        //public const int CONST_CMD_CANON_EOS_RemoteRelease = 0x910F;
        //public const int CONST_CMD_CANON_EOS_BulbStart = 0x9125;
        //public const int CONST_CMD_CANON_EOS_BulbEnd = 0x9126;
        //public const int CONST_CMD_CANON_EOS_SetEventMode = 0x9115;
        //public const int CONST_CMD_CANON_EOS_SetRemoteMode = 0x9114;
        //public const int CONST_CMD_CANON_EOS_GetEvent = 0x9116;
        //public const int CONST_CMD_CANON_EOS_DoAf = 0x9154;
        //public const int CONST_CMD_CANON_EOS_GetViewFinderData = 0x9153;
        //public const int CONST_CMD_CANON_EOS_GetObjectInfo = 0x9103;

        //public const int CONST_CMD_CANON_EOS_SetDevicePropValueEx = 0x9110;
        //public const int CONST_CMD_CANON_EOS_RequestDevicePropValue = 0x9109;

        //public const int CONST_PROP_EOS_ShutterSpeed = 0xD102;
        //public const int CONST_PROP_EOS_LiveView = 0xD1B0;

        //public const int CONST_Event_CANON_EOS_PropValueChanged = 0xc189 ;
        //public const int CONST_Event_CANON_EOS_ObjectAddedEx = 0xc181;

        private bool _eventIsbusy = false;

        private EosLiveImageEventArgs _liveViewImageData = null;

        public EosCamera Camera = null;

        protected Dictionary<uint, string> _shutterTable = new Dictionary<uint, string>
                                                         {
                                                           {0x0C, "Bulb"},
                                                           {0x10, "30"},
                                                           {0x13, "25"},
                                                           {0x14, "20"},
                                                           {0x15, "20 (1/3)"},
                                                           {0x18, "15"},
                                                           {0x1B, "13"},
                                                           {0x1C, "10"},
                                                           {0x1D, "20  (1/3)"},
                                                           {0x20, "8"},
                                                           {0x23, "6 (1/3)"},
                                                           {0x24, "6"},
                                                           {0x25, "5"},
                                                           {0x28, "4"},
                                                           {0x2B, "3.2"},
                                                           {0x2C, "3"},
                                                           {0x2D, "2.5"},
                                                           {0x30, "2"},
                                                           {0x33, "1.6"},
                                                           {0x34, "1.5"},
                                                           {0x35, "1.3"},
                                                           {0x38, "1"},
                                                           {0x3B, "0.8"},
                                                           {0x3C, "0.7"},
                                                           {0x3D, "0.6"},
                                                           {0x40, "0.5"},
                                                           {0x43, "0.4"},
                                                           {0x44, "0.3"},
                                                           {0x45, "0.3 (1/3)"},
                                                           {0x48, "1/4"},
                                                           {0x4B, "1/5"},
                                                           {0x4C, "1/6"},
                                                           {0x4D, "1/56 (1/3)"},
                                                           {0x50, "1/8"},
                                                           {0x53, "1/10 (1/3)"},
                                                           {0x54, "1/10"},
                                                           {0x55, "1/13"},
                                                           {0x58 ,"1/15"},
                                                           {0x5B ,"1/20 (1/3)"},
                                                           {0x5C ,"1/20"},
                                                           {0x5D ,"1/25"},
                                                           {0x60 ,"1/30"},
                                                           {0x63 ,"1/40"},
                                                           {0x64 ,"1/45"},
                                                           {0x65 ,"1/50"},
                                                           {0x68 ,"1/60"},
                                                           {0x6B ,"1/80"},
                                                           {0x6C ,"1/90"},
                                                           {0x6D ,"1/100"},
                                                           {0x70 ,"1/125"},
                                                           {0x73 ,"1/160"},
                                                           {0x74 ,"1/180"},
                                                           {0x75 ,"1/200"},
                                                           {0x78 ,"1/250"},
                                                           {0x7B ,"1/320"},
                                                           {0x7C ,"1/350"},
                                                           {0x7D ,"1/400"},
                                                           {0x80 ,"1/500"},
                                                           {0x83 ,"1/640"},
                                                           {0x84 ,"1/750"},
                                                           {0x85 ,"1/800"},
                                                           {0x88 ,"1/1000"},
                                                           {0x8B ,"1/1250"},
                                                           {0x8C ,"1/1500"},
                                                           {0x8D ,"1/1600"},
                                                           {0x90 ,"1/2000"},
                                                           {0x93 ,"1/2500"},
                                                           {0x94 ,"1/3000"},
                                                           {0x95 ,"1/3200"},
                                                           {0x98 ,"1/4000"},
                                                           {0x9B ,"1/5000"},
                                                           {0x9C ,"1/6000"},
                                                           {0x9D ,"1/6400"},
                                                           {0xA0 ,"1/8000"},
                                                         };

        protected Dictionary<int, string> _apertureTable = new Dictionary<int, string>
                                                               {
                                                                   {0x08, "1"},
                                                                   {0x0B, "1.1"},
                                                                   {0x0C, "1.2"},
                                                                   {0x0D, "1 (1/3)"},
                                                                   {0x10, "1.4"},
                                                                   {0x13, "1.6"},
                                                                   {0x14, "1.8"},
                                                                   {0x15, "1.8 (1/3)"},
                                                                   {0x18, "2"},
                                                                   {0x1B, "2.2"},
                                                                   {0x1C, "2.5"},
                                                                   {0x1D, "2.5 (1/3)"},
                                                                   {0x20, "2.8"},
                                                                   {0x23, "3.2"},
                                                                   {0x24, "3.5"},
                                                                   {0x25, "3.5 (1/3)"},
                                                                   {0x28, "4"},
                                                                   {0x2B, "4.5"},
                                                                   {0x2C, "4.5"},
                                                                   {0x2D, "5"},
                                                                   {0x30, "5.6"},
                                                                   {0x33, "6.3"},
                                                                   {0x34, "6.7"},
                                                                   {0x35, "7.1"},
                                                                   {0x38, "8"},
                                                                   {0x3B, "9"},
                                                                   {0x3C, "9.5"},
                                                                   {0x3D, "10"},
                                                                   {0x40, "11"},
                                                                   {0x43, "13 (1/3)"},
                                                                   {0x44, "13"},
                                                                   {0x45, "14"},
                                                                   {0x48, "16"},
                                                                   {0x4B, "18"},
                                                                   {0x4C, "19"},
                                                                   {0x4D, "20"},
                                                                   {0x50, "22"},
                                                                   {0x53, "25"},
                                                                   {0x54, "27"},
                                                                   {0x55, "29"},
                                                                   {0x58, "32"},
                                                                   {0x5B, "36"},
                                                                   {0x5C, "38"},
                                                                   {0x5D, "40"},
                                                                   {0x60, "45"},
                                                                   {0x63, "51"},
                                                                   {0x64, "54"},
                                                                   {0x65, "57"},
                                                                   {0x68, "64"},
                                                                   {0x6B, "72"},
                                                                   {0x6C, "76"},
                                                                   {0x6D, "80"},
                                                                   {0x70, "91"},
                                                               };

        protected Dictionary<uint, string> _exposureModeTable = new Dictionary<uint, string>()
                            {
                              {0, "P"},
                              {1, "Tv"},
                              {2, "Av"},
                              {3, "M"},
                              {4, "Bulb"},
                              {5, "A-DEP"},
                              {6, "DEP"},
                              {7, "Camera settings registered"},
                              {8, "Lock"},
                              {9, "Auto"},
                              {10, "Night scene Portrait"},
                              {11, "Sport"},
                              {12, "Portrait"},
                              {13, "Landscape"},
                              {14, "Close-Up"},
                              {15, "Flash Off"},
                              {19, "Creative Auto"},
                              {21, "Photo in Movie"},
                            };

        protected Dictionary<uint, string> _isoTable = new Dictionary<uint, string>()
                                                  {
                                                    {0x00000028, "6"},
                                                    {0x00000030, "12"},
                                                    {0x00000038, "25"},
                                                    {0x00000040, "50"},
                                                    {0x00000048, "100"},
                                                    {0x0000004B, "125"},
                                                    {0x0000004D, "160"},
                                                    {0x00000050, "200"},
                                                    {0x00000053, "250"},
                                                    {0x00000055, "320"},
                                                    {0x00000058, "400"},
                                                    {0x0000005B, "500"},
                                                    {0x0000005D, "640"},
                                                    {0x00000060, "800"},
                                                    {0x00000063, "1000"},
                                                    {0x00000065, "1250"},
                                                    {0x00000068, "1600"},
                                                    {0x00000070, "3200"},
                                                    {0x00000078, "6400"},
                                                    {0x00000080, "12800"},
                                                    {0x00000088, "25600"},
                                                    {0x00000090, "51200"},
                                                    {0x00000098, "102400"},
                                                  };

        protected Dictionary<uint, string> _ec = new Dictionary<uint, string>()
                                                     {
                                                         {0x18,"+3"},
                                                         {0x15,"+2 2/3"},
                                                         {0x14,"+2 1/2"},
                                                         {0x13,"+2 1/3"},
                                                         {0x10,"+2"},
                                                         {0x0D,"+1 2/3"},
                                                         {0x0C,"+1 1/2"},
                                                         {0x0B,"+1 1/3"},
                                                         {0x08,"+1"},
                                                         {0x05,"+2/3"},
                                                         {0x04,"+1/2"},
                                                         {0x03,"+1/3"},
                                                         {0x00,"0"},
                                                         {0xFD,"-1/3"},
                                                         {0xFC,"-1/2"},
                                                         {0xFB,"-2/3"},
                                                         {0xF8,"-1"},
                                                         {0xF5,"-1 1/3"},
                                                         {0xF4,"-1 1/3"},
                                                         {0xF3,"-1 2/3"},
                                                         {0xF0,"-2"},
                                                         {0xED,"-2 1/3"},
                                                         {0xEC,"-2 1/2"},
                                                         {0xEB,"-3 2/3"},
                                                         {0xE8,"-3"},
                                                     };

        public CanonSDKBase()
        {

        }

        public override bool CaptureInSdRam
        {
            get { return base.CaptureInSdRam; }
            set
            {
                base.CaptureInSdRam = value;
                try
                {
                    if (base.CaptureInSdRam)
                    {
                        Camera.SavePicturesToCamera();
                    }
                    else
                    {
                        Camera.SavePicturesToHost(Path.GetTempPath());
                    }
                }
                catch (Exception exception)
                {
                    Log.Error("Error set CaptureInSdram", exception);
                }
            }
        }


        public bool Init(EosCamera camera)
        {
            try
            {
                Camera = camera;
                Camera.IsErrorTolerantMode = true;
                DeviceName = Camera.DeviceDescription;
                Manufacturer = "Canon Inc.";
                SerialNumber = Camera.SerialNumber;
                Camera.Error += _camera_Error;
                Camera.Shutdown += _camera_Shutdown;
                Camera.LiveViewPaused += Camera_LiveViewPaused;
                Camera.LiveViewUpdate += Camera_LiveViewUpdate;
                Camera.PictureTaken += Camera_PictureTaken;
                Camera.PropertyChanged += Camera_PropertyChanged;
                Capabilities.Add(CapabilityEnum.Bulb);
                Capabilities.Add(CapabilityEnum.LiveView);
                Capabilities.Add(CapabilityEnum.CaptureInRam);
                CaptureInSdRam = true;
                InitMode();
                InitShutterSpeed();
                InitFNumber();
                InitIso();
                InitEc();
                InitOther();
                Battery = (int)Camera.BatteryLevel;
                IsConnected = true;
                return true; 
            }
            catch (Exception exception)
            {
                Log.Error("Error initialize EOS camera object ", exception);
                return false;
            }
        }


        private void InitOther()
        {
            LiveViewImageZoomRatio = new PropertyValue<int> { Name = "LiveViewImageZoomRatio" };
            LiveViewImageZoomRatio.AddValues("All", 0);
            LiveViewImageZoomRatio.AddValues("25%", 1);
            LiveViewImageZoomRatio.AddValues("33%", 2);
            LiveViewImageZoomRatio.AddValues("50%", 3);
            LiveViewImageZoomRatio.AddValues("66%", 4);
            LiveViewImageZoomRatio.AddValues("100%", 5);
            LiveViewImageZoomRatio.AddValues("200%", 6);
            LiveViewImageZoomRatio.SetValue("All");
            LiveViewImageZoomRatio.ValueChanged += LiveViewImageZoomRatio_ValueChanged;
        }

        void LiveViewImageZoomRatio_ValueChanged(object sender, string key, int val)
        {
            
        }


        void Camera_PropertyChanged(object sender, EosPropertyEventArgs e)
        {
            try
            {
                //Log.Debug("Property changed " + e.PropertyId.ToString("X"));
                switch (e.PropertyId)
                {
                    case Edsdk.PropID_ExposureCompensation:
                        ExposureCompensation.SetValue((int)Camera.GetProperty(Edsdk.PropID_ExposureCompensation), false);
                        break;
                    case Edsdk.PropID_AEMode:
                        Mode.SetValue((uint)Camera.GetProperty(Edsdk.PropID_AEMode), false);
                        break;
                    case Edsdk.PropID_Tv:
                        ReInitShutterSpeed();
                        break;
                    case Edsdk.PropID_Av:
                        ReInitFNumber(true);
                        break;
                    case Edsdk.PropID_BatteryLevel:
                        Battery = (int) Camera.BatteryLevel;
                        break;
                }
            }
            catch (Exception exception)
            {
                Log.Error("Error set property " + e.PropertyId.ToString("X"), exception);
            }
        }

        void Camera_PictureTaken(object sender, EosImageEventArgs e)
        {
            try
            {
                Log.Debug("Picture taken event received type" + e.GetType().ToString());
                PhotoCapturedEventArgs args = new PhotoCapturedEventArgs
                                                  {
                                                      WiaImageItem = null,
                                                      //EventArgs =
                                                      //  new PortableDeviceEventArgs(new PortableDeviceEventType()
                                                      //  {
                                                      //      ObjectHandle =
                                                      //        (uint)longeventParam
                                                      //  }),
                                                      CameraDevice = this,
                                                      FileName = "IMG0000.jpg",
                                                      Handle = e
                                                  };

                EosFileImageEventArgs file = e as EosFileImageEventArgs;
                if (file != null)
                {
                    args.FileName = Path.GetFileName(file.ImageFilePath);
                }
                EosMemoryImageEventArgs memory = e as EosMemoryImageEventArgs;
                if (memory != null)
                {
                    if (!string.IsNullOrEmpty(memory.FileName))
                        args.FileName = Path.GetFileName(memory.FileName);
                }
                OnPhotoCapture(this, args);
            }
            catch (Exception exception)
            {
                Log.Error("EOS Picture taken event error", exception);
            }

        }

        void Camera_LiveViewUpdate(object sender, EosLiveImageEventArgs e)
        {
            LiveViewData viewData = new LiveViewData();
            if (Monitor.TryEnter(Locker, 1))
            {
                try
                {
                    _liveViewImageData = e;
                }
                catch (Exception exception)
                {
                    Log.Error("Error get live view image event", exception);
                }
                finally
                {
                    Monitor.Exit(Locker);
                }
            }

        }

        void Camera_LiveViewPaused(object sender, EventArgs e)
        {
            try
            {
                Camera.ResetShutterButton();
                Camera.TakePictureNoAf();
                Camera.ResetShutterButton();
                //Camera.ResumeLiveview();
            }
            catch (Exception exception)
            {
                IsBusy = false;
                Log.Debug("Live view pause error", exception);
            }
        }

        void _camera_Shutdown(object sender, EventArgs e)
        {
            IsConnected = false;
            OnCameraDisconnected(this, new DisconnectCameraEventArgs { StillImageDevice = null });
        }

        void _camera_Error(object sender, EosExceptionEventArgs e)
        {
            try
            {
                Log.Error("Canon error", e.Exception);
            }
            catch (Exception exception)
            {
                Log.Error("Error get camera error", exception);
            }
        }

        public override bool Init(DeviceDescriptor deviceDescriptor)
        {
            //StillImageDevice = new StillImageDevice(deviceDescriptor.WpdId);
            //StillImageDevice.ConnectToDevice(AppName, AppMajorVersionNumber, AppMinorVersionNumber);
            //StillImageDevice.DeviceEvent += _stillImageDevice_DeviceEvent;
            Capabilities.Add(CapabilityEnum.Bulb);
            Capabilities.Add(CapabilityEnum.LiveView);
            
            IsConnected = true;
            return true;
        }


        private void InitShutterSpeed()
        {
            ShutterSpeed = new PropertyValue<long>();
            ShutterSpeed.Name = "ShutterSpeed";
            ShutterSpeed.ValueChanged += ShutterSpeed_ValueChanged;
            ReInitShutterSpeed();
        }

        private void ReInitShutterSpeed()
        {
            lock (Locker)
            {
                try
                {
                    ShutterSpeed.Clear();
                    var data = Camera.GetPropertyDescription(Edsdk.PropID_Tv);
                    foreach (KeyValuePair<uint, string> keyValuePair in _shutterTable)
                    {
                        if (data.NumElements > 0)
                        {
                            if (ArrayContainValue(data.PropDesc, keyValuePair.Key))
                                ShutterSpeed.AddValues(keyValuePair.Value, keyValuePair.Key);
                        }
                        else
                        {
                            ShutterSpeed.AddValues(keyValuePair.Value, keyValuePair.Key);
                        }
                    }
                    
                    long value = Camera.GetProperty(Edsdk.PropID_Tv);
                    if (value == 0)
                    {
                        ShutterSpeed.IsEnabled = false;
                    }
                    else
                    {
                        ShutterSpeed.IsEnabled = true;
                        ShutterSpeed.SetValue(Camera.GetProperty(Edsdk.PropID_Tv), false);
                    }
                }
                catch (Exception ex)
                {
                    Log.Debug("EOS Shutter speed init", ex);
                }
            }
        }

        void ShutterSpeed_ValueChanged(object sender, string key, long val)
        {
            try
            {
                Camera.SetProperty(Edsdk.PropID_Tv, val);
            }
            catch (Exception exception)
            {
                Log.Error("Error set property sP", exception);
            }
        }
#region F number
        private void InitFNumber()
        {
            FNumber = new PropertyValue<int> { IsEnabled = true, Name = "FNumber" };
            FNumber.ValueChanged += FNumber_ValueChanged;
            ReInitFNumber(true);
        }

        void FNumber_ValueChanged(object sender, string key, int val)
        {
            try
            {
                Camera.SetProperty(Edsdk.PropID_Av, val);
            }
            catch (Exception exception)
            {
                Log.Error("Error set property AV", exception);
            }
        }

        private void ReInitFNumber(bool trigervaluchange)
        {
            try
            {
                var data = Camera.GetPropertyDescription(Edsdk.PropID_Av);
                long value = Camera.GetProperty(Edsdk.PropID_Av);
                bool shouldinit = FNumber.Values.Count == 0;
                
                if (data.NumElements > 0)
                    FNumber.Clear();

                if (shouldinit && data.NumElements == 0)
                {
                    foreach (KeyValuePair<int, string> keyValuePair in _apertureTable)
                    {
                        FNumber.AddValues(keyValuePair.Value, keyValuePair.Key);
                    }
                }
                else
                {
                    foreach (KeyValuePair<int, string> keyValuePair in _apertureTable.Where(keyValuePair => data.NumElements > 0).Where(keyValuePair => ArrayContainValue(data.PropDesc, keyValuePair.Key)))
                    {
                        FNumber.AddValues(keyValuePair.Value, keyValuePair.Key);
                    }
                }

                if(value==0)
                {
                    FNumber.IsEnabled = false;
                }
                else
                {
                    FNumber.SetValue((int)value, false);
                    FNumber.IsEnabled = true;
                }
            }
            catch (Exception ex)
            {
                Log.Debug("Error set aperture ", ex);
            }
        }
#endregion

        private void InitIso()
        {
            IsoNumber = new PropertyValue<int>();
            IsoNumber.ValueChanged += IsoNumber_ValueChanged;
            ReInitIso();
        }

        void IsoNumber_ValueChanged(object sender, string key, int val)
        {
            try
            {
                Camera.SetProperty(Edsdk.PropID_ISOSpeed, val);
            }
            catch (Exception exception)
            {
                Log.Debug("Error set ISO to camera", exception);
            }
        }

        private void ReInitIso()
        {
            try
            {
                var data = Camera.GetPropertyDescription(Edsdk.PropID_ISOSpeed);
                long value = Camera.GetProperty(Edsdk.PropID_ISOSpeed);
                bool shouldinit = IsoNumber.Values.Count == 0;

                if (data.NumElements > 0)
                    IsoNumber.Clear();

                if (shouldinit && data.NumElements == 0)
                {
                    foreach (KeyValuePair<uint, string> keyValuePair in _isoTable)
                    {
                        IsoNumber.AddValues(keyValuePair.Value, (int) keyValuePair.Key);
                    }
                }
                else
                {
                    foreach (KeyValuePair<uint, string> keyValuePair in _isoTable.Where(keyValuePair => data.NumElements > 0).Where(keyValuePair => ArrayContainValue(data.PropDesc, keyValuePair.Key)))
                    {
                        IsoNumber.AddValues(keyValuePair.Value, (int) keyValuePair.Key);
                    }
                }

                if (value == 0)
                {
                    IsoNumber.IsEnabled = false;
                }
                else
                {
                    IsoNumber.SetValue((int)value, false);
                    IsoNumber.IsEnabled = true;
                }
            }
            catch (Exception ex)
            {
                Log.Debug("Error set iso ", ex);
            }   
        }

        private void InitMode()
        {
            Mode = new PropertyValue<uint>();
            try
            {
                foreach (KeyValuePair<uint, string> keyValuePair in _exposureModeTable)
                {
                    Mode.AddValues(keyValuePair.Value, keyValuePair.Key);
                }

                Mode.SetValue((uint)Camera.GetProperty(Edsdk.PropID_AEMode), false);
                Mode.IsEnabled = false;

            }
            catch (Exception ex)
            {
                Log.Debug("Error set aperture ", ex);
            }

        }

        private void InitEc()
        {
            ExposureCompensation = new PropertyValue<int>();
            ExposureCompensation.ValueChanged += ExposureCompensation_ValueChanged;
            try
            {
                foreach (KeyValuePair<uint, string> keyValuePair in _ec)
                {
                    ExposureCompensation.AddValues(keyValuePair.Value, (int) keyValuePair.Key);
                }
                ExposureCompensation.IsEnabled = true;
                ExposureCompensation.SetValue((int)Camera.GetProperty(Edsdk.PropID_ExposureCompensation), false);
            }
            catch (Exception exception)
            {
                Log.Debug("Error get EC", exception);
            }
        }

        void ExposureCompensation_ValueChanged(object sender, string key, int val)
        {
            try
            {
                Camera.SetProperty(Edsdk.PropID_ExposureCompensation, val);
            }
            catch (Exception exception)
            {
                Log.Debug("Error set EC to camera", exception);
            }
        }

        public override void CapturePhoto()
        {
            Log.Debug("EOS capture start");
            Monitor.Enter(Locker);
            try
            {
                IsBusy = true;
                if (Camera.IsInHostLiveViewMode)
                {
                    Camera.TakePictureInLiveview();
                }
                else
                {
                    Camera.TakePicture();                    
                }

            }
            catch (COMException comException)
            {
                IsBusy = false;
                ErrorCodes.GetException(comException);
            }
            catch
            {
                IsBusy = false;
                throw;
            }
            finally
            {
                Monitor.Exit(Locker);
            }
            Log.Debug("EOS capture end");
        }

        public override void CapturePhotoNoAf()
        {
            Log.Debug("EOS capture start");
            Monitor.Enter(Locker);
            try
            {
                IsBusy = true;
                if (Camera.IsInHostLiveViewMode)
                {
                    Camera.TakePictureInLiveview();
                }
                else
                {
                    Camera.TakePicture();
                }
            }
            catch (COMException comException)
            {
                IsBusy = false;
                ErrorCodes.GetException(comException);
            }
            catch
            {
                IsBusy = false;
                throw;
            }
            finally
            {
                Monitor.Exit(Locker);
            }
            Log.Debug("EOS capture end");

        }

        public override void StartBulbMode()
        {
            Camera.BulbStart();
        }

        public override void EndBulbMode()
        {
            Camera.BulbEnd();
        }

        public override LiveViewData GetLiveViewImage()
        {
            LiveViewData viewData = new LiveViewData();
            if (Monitor.TryEnter(Locker, 1))
            {
                try
                {
                    //DeviceReady();
                    viewData.HaveFocusData = false;
                    viewData.ImagePosition = 0;
                    viewData.ImageData = _liveViewImageData.ImageData;
                    viewData.ImageHeight = 100;
                    viewData.ImageWidth = 100;
                    viewData.LiveViewImageHeight = 100;
                    viewData.LiveViewImageWidth = 100;
                    viewData.FocusX = _liveViewImageData.ZommBounds.X;
                    viewData.FocusY = _liveViewImageData.ZommBounds.Y;
                    viewData.FocusFrameXSize = _liveViewImageData.ZommBounds.Width;
                    viewData.FocusFrameYSize = _liveViewImageData.ZommBounds.Height;
                }
                catch (Exception e)
                {
                    //Log.Error("Error get live view image ", e);
                }
                finally
                {
                    Monitor.Exit(Locker);
                }
            }
            return viewData;
        }

        public override void StartLiveView()
        {
            Camera.ResetShutterButton();
            //if (!Camera.IsInLiveViewMode) 
                Camera.StartLiveView();
        }

        public override void StopLiveView()
        {
            Camera.ResetShutterButton();
            //if (Camera.IsInLiveViewMode)
                Camera.StopLiveView();
        }

        public override void AutoFocus()
        {
            Camera.ResetShutterButton();
            Camera.AutoFocus();
        }

        public override void Focus(int step)
        {
            Camera.ResetShutterButton();
            if(step<0)
            {
                step = -step;
                if (step < 50)
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Near1);
                else if (step >= 50 && step< 200)
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Near2);
                else
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Near3);
            }
            else
            {
                if (step < 50)
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Far1);
                else if (step >= 50 && step < 200)
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Far2);
                else
                    Camera.FocusInLiveView(Edsdk.EvfDriveLens_Far3);
            }
        }

        public override void TransferFile(object o, string filename)
        {
            EosFileImageEventArgs file = o as EosFileImageEventArgs;
            if (file != null)
            {
                Log.Debug("File transfer started");
                try
                {
                    if(File.Exists(file.ImageFilePath))
                    {
                        File.Copy(file.ImageFilePath, filename, true);
                        File.Delete(file.ImageFilePath);
                    }
                    else
                    {
                        Log.Error("Base file not found " + file.ImageFilePath);
                    }
                }
                catch (Exception exception)
                {
                    Log.Error("Transfer error ", exception);
                }
            }
            EosMemoryImageEventArgs memory = o as EosMemoryImageEventArgs;
            if(memory!=null)
            {
                Log.Debug("Memory file transfer started");
                try
                {
                    using (FileStream fileStream = File.Create(filename, (int)memory.ImageData.Length))
                    {
                        fileStream.Write(memory.ImageData, 0, memory.ImageData.Length);
                    }
                }
                catch (Exception exception)
                {
                    Log.Error("Error transfer memory file", exception);
                }
            }
        }

        public override string GetProhibitionCondition(OperationEnum operationEnum)
        {
            return "";
        }

        private bool ArrayContainValue(IEnumerable<int> data, uint value)
        {
            return ArrayContainValue(data, (int) value);
        }

        private bool ArrayContainValue(IEnumerable<int> data, int value)
        {
            return data.Any(i => i == (int)value);
        }
    }
}
