using System;
using System.Drawing;
using System.IO;
using System.Windows.Media.Imaging;
using System.Xml.Serialization;
using CameraControl.Core.Classes.Queue;
using CameraControl.Core.Exif.EXIF;
using CameraControl.Devices;
using CameraControl.Devices.Classes;
using FreeImageAPI;

namespace CameraControl.Core.Classes
{

  public enum FileItemType
  {
    File,
    CameraObject,
    Missing

  }

  public class FileItem:BaseFieldClass
  {

    private string _fileName;
    public string FileName
    {
      get { return _fileName; }
      set
      {
        _fileName = value;
        if (File.Exists(_fileName))
        {
          FileDate = File.GetLastWriteTime(_fileName);
        }
        NotifyPropertyChanged("FileName");
      }
    }

    public bool IsRaw
    {
      get { return !string.IsNullOrEmpty(FileName) && Path.GetExtension(FileName).ToLower() == ".nef"; }
    }

    public DateTime FileDate { get; set; }

    public string Name { get; set; }

    [XmlIgnore]
    public string ToolTip
    {
      get { return string.Format("File name: {0}\nFile date :{1}",FileName,FileDate.ToString()); }
    }

    private bool _isChecked;
    public bool IsChecked
    {
      get { return _isChecked; }
      set
      {
        _isChecked = value;
        NotifyPropertyChanged("IsChecked");
      }
    }

    private BitmapImage _bitmapImage;
    [XmlIgnore]
    public BitmapImage BitmapImage
    {
      get
      {
        return _bitmapImage;
      }
      set
      {
        if(value==null)
        {
          
        }
        _bitmapImage = value;
        NotifyPropertyChanged("BitmapImage");
      }
    }

    private DeviceObject _deviceObject;
    [XmlIgnore]
    public DeviceObject DeviceObject
    {
      get { return _deviceObject; }
      set
      {
        _deviceObject = value;
        NotifyPropertyChanged("DeviceObject");
      }
    }

    private ICameraDevice _device;
    [XmlIgnore]
    public ICameraDevice Device
    {
      get { return _device; }
      set
      {
        _device = value;
        NotifyPropertyChanged("Device");
      }
    }

    private FileItemType _itemType;
    [XmlIgnore]
    public FileItemType ItemType
    {
      get { return _itemType; }
      set
      {
        _itemType = value;
        NotifyPropertyChanged("ItemType");
      }
    }

    public FileItem()
    {
      
    }

    public FileItem(DeviceObject deviceObject, ICameraDevice device)
    {
      Device = device;
      DeviceObject = deviceObject;
      ItemType = FileItemType.CameraObject;
      FileName = deviceObject.FileName;
      FileDate = deviceObject.FileDate;
      IsChecked = true;
      if (deviceObject.ThumbData != null && deviceObject.ThumbData.Length > 4)
      {
        try
        {
          MemoryStream stream = new MemoryStream(deviceObject.ThumbData, 0, deviceObject.ThumbData.Length);

          using (var bmp = new Bitmap(stream))
          {
            Thumbnail = BitmapSourceConvert.ToBitmapSource(bmp);
          }
          stream.Close();
        }
        catch (Exception exception)
        {
          Log.Debug("Error loading device thumb ", exception);
        }
      }
    }


    public FileItem(string file)
    {
      FileName = file;
      Name = Path.GetFileName(file);
      ItemType = FileItemType.File;
    }

    public FileItem(ICameraDevice device,DateTime time)
    {
      Device = device;
      ItemType = FileItemType.CameraObject;
      IsChecked = true;
      ItemType = FileItemType.Missing;
      FileName = "Missing";
      FileDate = time;
    }

    private BitmapSource _thumbnail;
    [XmlIgnore]
    public BitmapSource Thumbnail
    {
      get
      {
        if (_thumbnail == null)
        {
          _thumbnail = ItemType == FileItemType.Missing ? BitmapLoader.Instance.NoImageThumbnail : BitmapLoader.Instance.DefaultThumbnail;
          if (!ServiceProvider.Settings.DontLoadThumbnails)
            ServiceProvider.QueueManager.Add(new QueueItemFileItem {FileItem = this});
        }
        return _thumbnail;
      }
      set
      {
        _thumbnail = value;
        NotifyPropertyChanged("Thumbnail");
      }
    }

    public void GetExtendedThumb()
    {
      if (ItemType != FileItemType.File)
        return;
      try
      {
        //FIBITMAP dib = new FIBITMAP();
        if (IsRaw)
        {
          try
          {
            BitmapDecoder bmpDec = BitmapDecoder.Create(new Uri(FileName),
                                                        BitmapCreateOptions.None,
                                                        BitmapCacheOption.Default);
            if (bmpDec.Thumbnail != null)
            {
              WriteableBitmap bitmap = new WriteableBitmap(bmpDec.Thumbnail);
              bitmap.Freeze();
              Thumbnail = bitmap;
            }
          }
          catch (Exception)
          {

          }

        }
        else
        {
          Image.GetThumbnailImageAbort myCallback = ThumbnailCallback;
          Stream fs = new FileStream(FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite); // or any stream
          Image tempImage = Image.FromStream(fs, true, false);

          //var exif = new EXIFextractor(ref tempImage, "n");
          //if (exif["Orientation"] != null)
          //{
          //  RotateFlipType flip = EXIFextractorEnumerator.OrientationToFlipType(exif["Orientation"].ToString());

          //  if (flip != RotateFlipType.RotateNoneFlipNone) // don't flip of orientation is correct
          //  {
          //    tempImage.RotateFlip(flip);
          //  }
          //}
          //Thumbnail =
          //  BitmapSourceConvert.ToBitmapSource((Bitmap) tempImage.GetThumbnailImage(160, 120, myCallback, IntPtr.Zero));
          Thumbnail =
            BitmapSourceConvert.ToBitmapSource(
              (Bitmap) tempImage.GetThumbnailImage(160, 120, myCallback, IntPtr.Zero));
          tempImage.Dispose();
          fs.Close();
        }
      }
      catch (Exception exception)
      {
        Log.Debug("Unable load thumbnail: "+FileName,exception);
      }
    }

    private bool ThumbnailCallback()
    {
      return false;
    }
  }
}
