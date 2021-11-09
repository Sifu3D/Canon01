using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using AForge.Imaging;
using CameraControl.Devices;
using Color = System.Windows.Media.Color;

namespace CameraControl.Core.Classes
{
  public class BitmapLoader
  {
    private bool _isworking = false;
    private BitmapFile _nextfile;
    private BitmapFile _currentfile;


    private static BitmapLoader _instance;
    public static BitmapLoader Instance
    {
      get { return _instance ?? (_instance = new BitmapLoader()); }
      set { _instance = value; }
    }

    private BitmapImage _defaultThumbnail;
    public BitmapImage DefaultThumbnail
    {
      get
      {
        if (_defaultThumbnail == null)
        {
          if (!string.IsNullOrEmpty(ServiceProvider.Branding.DefaultThumbImage) &&
              File.Exists(ServiceProvider.Branding.DefaultThumbImage))
          {
            BitmapImage bi = new BitmapImage();
            // BitmapImage.UriSource must be in a BeginInit/EndInit block.
            bi.BeginInit();
            bi.UriSource = new Uri(ServiceProvider.Branding.DefaultThumbImage);
            bi.EndInit();
            _defaultThumbnail = bi;
          }
          else
          {
            _defaultThumbnail = new BitmapImage(new Uri("pack://application:,,,/Images/logo.png"));
          }
        }
        return _defaultThumbnail;
      }
      set { _defaultThumbnail = value; }
    }


    private BitmapImage _noImageThumbnail;

    public BitmapImage NoImageThumbnail
    {
      get
      {
        if (_noImageThumbnail == null)
        {
          if (!string.IsNullOrEmpty(ServiceProvider.Branding.DefaultMissingThumbImage) &&
              File.Exists(ServiceProvider.Branding.DefaultMissingThumbImage))
          {
            BitmapImage bi = new BitmapImage();
            // BitmapImage.UriSource must be in a BeginInit/EndInit block.
            bi.BeginInit();
            bi.UriSource = new Uri(ServiceProvider.Branding.DefaultMissingThumbImage);
            bi.EndInit();
            _noImageThumbnail = bi;
          }
          else
          {
            _noImageThumbnail = new BitmapImage(new Uri("pack://application:,,,/Images/NoImage.png"));
          }
        }
        return _noImageThumbnail;
      }
      set { _noImageThumbnail = value; }
    }

    public void GetBitmap(BitmapFile bitmapFile)
    {
      if (_isworking)
      {
        _nextfile = bitmapFile;
        return;
      }
      _nextfile = null;
      _isworking = true;
      _currentfile = bitmapFile;
      _currentfile.RawCodecNeeded = false;
      if (!File.Exists(_currentfile.FileItem.FileName))
      {
        Log.Error("File not found " + _currentfile.FileItem.FileName);
        StaticHelper.Instance.SystemMessage = "File not found " + _currentfile.FileItem.FileName;
      }
      else
      {
        BitmapImage res = null;
        //Metadata.Clear();
        try
        {
          if (_currentfile.FileItem.IsRaw)
          {
            WriteableBitmap writeableBitmap = null;
            Log.Debug("Loading raw file.");
            BitmapDecoder bmpDec = BitmapDecoder.Create(new Uri(_currentfile.FileItem.FileName),
                                                        BitmapCreateOptions.None,
                                                        BitmapCacheOption.Default);
            if (bmpDec.CodecInfo != null)
              Log.Debug("Raw codec: " + bmpDec.CodecInfo.FriendlyName);
            if (bmpDec.Thumbnail != null)
            {
              WriteableBitmap bitmap = new WriteableBitmap(bmpDec.Thumbnail);
              bitmap.Freeze();
              bitmapFile.DisplayImage = bitmap;
            }

            if (ServiceProvider.Settings.LowMemoryUsage)
            {
              if (bmpDec.Thumbnail != null)
              {
                writeableBitmap = BitmapFactory.ConvertToPbgra32Format(bmpDec.Thumbnail);
              }
              else
              {
                writeableBitmap = BitmapFactory.ConvertToPbgra32Format(bmpDec.Frames[0]);
                double dw = 2000/writeableBitmap.Width;
                writeableBitmap = writeableBitmap.Resize((int) (writeableBitmap.PixelWidth*dw),
                                                         (int) (writeableBitmap.PixelHeight*dw),
                                                         WriteableBitmapExtensions.Interpolation.Bilinear);
              }
              bmpDec = null;
            }
            else
            {
              writeableBitmap = BitmapFactory.ConvertToPbgra32Format(bmpDec.Frames.Single());
            }
            GetMetadata(_currentfile, writeableBitmap);
            Log.Debug("Loading raw file done.");
          }
          else
          {
            BitmapImage bi = new BitmapImage();
            // BitmapImage.UriSource must be in a BeginInit/EndInit block.
            bi.BeginInit();

            if (ServiceProvider.Settings.LowMemoryUsage)
              bi.DecodePixelWidth = 2000;

            bi.UriSource = new Uri(_currentfile.FileItem.FileName);
            bi.EndInit();
            WriteableBitmap writeableBitmap = BitmapFactory.ConvertToPbgra32Format(bi);
            GetMetadata(_currentfile, writeableBitmap);
            Log.Debug("Loading bitmap file done.");
          }
        }
        catch (FileFormatException)
        {
          _currentfile.RawCodecNeeded = true;
          Log.Debug("Raw codec not installed or unknown file format");
          StaticHelper.Instance.SystemMessage = "Raw codec not installed or unknown file format";
        }
        catch (Exception exception)
        {
          Log.Error(exception);
        }
        if (_nextfile == null)
        {
          Thread threadPhoto = new Thread(GetAdditionalData);
          threadPhoto.Start(_currentfile);
          _currentfile.OnBitmapLoaded();
          _currentfile = null;
          _isworking = false;

        }
        else
        {
          _isworking = false;
          GetBitmap(_nextfile);
        }
      }
    }

    private void GetAdditionalData(object o)
    {
      BitmapFile file = o as BitmapFile;
      try
      {
        if (!file.FileItem.IsRaw)
        {
          using (Bitmap bmp = new Bitmap(file.FileItem.FileName))
          {
            // Luminance
            ImageStatisticsHSL hslStatistics = new ImageStatisticsHSL(bmp);
            file.LuminanceHistogramPoints = ConvertToPointCollection(hslStatistics.Luminance.Values);
            // RGB
            ImageStatistics rgbStatistics = new ImageStatistics(bmp);
            file.RedColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Red.Values);
            file.GreenColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Green.Values);
            file.BlueColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Blue.Values);
          }
        }
      }
      catch (Exception ex)
      {
        Log.Error(ex);
      }
    }

    void DrawRect(WriteableBitmap bmp, int x1, int y1, int x2, int y2,  Color color,int line)
    {
      for (int i = 0; i < line; i++)
      {
        bmp.DrawRectangle(x1-i,y1-i,x2-i,y2-i,color);
      } 
    }

    public void GetMetadata(BitmapFile file,WriteableBitmap writeableBitmap)
    {
      Exiv2Helper exiv2Helper = new Exiv2Helper();
      try
      {
        exiv2Helper.Load(file.FileItem.FileName, writeableBitmap.PixelWidth, writeableBitmap.PixelHeight);
        file.Metadata.Clear();
        foreach (var exiv2Data in exiv2Helper.Tags)
        {
          file.Metadata.Add(new DictionaryItem() { Name = exiv2Data.Value.Tag, Value = exiv2Data.Value.Value });
        }
        if (ServiceProvider.Settings.ShowFocusPoints)
        {
          writeableBitmap.Lock();
          foreach (Rect focuspoint in exiv2Helper.Focuspoints)
          {
              DrawRect(writeableBitmap, (int) focuspoint.X, (int) focuspoint.Y, (int) (focuspoint.X + focuspoint.Width),
                       (int) (focuspoint.Y + focuspoint.Height), Colors.Aqua,
                       ServiceProvider.Settings.LowMemoryUsage ? 2 : 7);
          }
          writeableBitmap.Unlock();
        }

        if (exiv2Helper.Tags.ContainsKey("Exif.Image.Orientation") && !file.FileItem.IsRaw)
        {
            if (exiv2Helper.Tags["Exif.Image.Orientation"].Value == "bottom, right")
                writeableBitmap = writeableBitmap.Rotate(180);

            if (exiv2Helper.Tags["Exif.Image.Orientation"].Value == "right, top")
                writeableBitmap = writeableBitmap.Rotate(90);

            if (exiv2Helper.Tags["Exif.Image.Orientation"].Value == "left, bottom")
                writeableBitmap = writeableBitmap.Rotate(270);
        }

          if (ServiceProvider.Settings.RotateIndex != 0)
        {
          switch (ServiceProvider.Settings.RotateIndex)
          {
            case 1:
              writeableBitmap = writeableBitmap.Rotate(90);
              break;
            case 2:
              writeableBitmap = writeableBitmap.Rotate(180);
              break;
            case 3:
              writeableBitmap = writeableBitmap.Rotate(270);
              break;
          }
        }

      }
      catch (Exception exception)
      {
        Log.Error("Error loading metadata ", exception);
      }

      writeableBitmap.Freeze();
      file.DisplayImage = writeableBitmap;
      file.InfoLabel = Path.GetFileName(file.FileItem.FileName);
      file.InfoLabel += String.Format(" | {0}x{1}",exiv2Helper.Width,exiv2Helper.Height);
      if (exiv2Helper.Tags.ContainsKey("Exif.Photo.ExposureTime"))
        file.InfoLabel += " | E " + exiv2Helper.Tags["Exif.Photo.ExposureTime"].Value;
      if (exiv2Helper.Tags.ContainsKey("Exif.Photo.FNumber"))
        file.InfoLabel += " | " + exiv2Helper.Tags["Exif.Photo.FNumber"].Value;
      if (exiv2Helper.Tags.ContainsKey("Exif.Photo.ISOSpeedRatings"))
        file.InfoLabel += " | ISO " + exiv2Helper.Tags["Exif.Photo.ISOSpeedRatings"].Value;
      if (exiv2Helper.Tags.ContainsKey("Exif.Photo.ExposureBiasValue"))
        file.InfoLabel += " | " + exiv2Helper.Tags["Exif.Photo.ExposureBiasValue"].Value;
      if (exiv2Helper.Tags.ContainsKey("Exif.Photo.FocalLength"))
        file.InfoLabel += " | " + exiv2Helper.Tags["Exif.Photo.FocalLength"].Value;

    }

    //public void AddMetadataItem(MetadataTag tag, BitmapFile bitmapFile)
    //{
    //  if (string.IsNullOrEmpty(tag.Description))
    //    return;
    //  foreach (DictionaryItem dictionaryItem in bitmapFile.Metadata)
    //  {
    //    if (dictionaryItem.Name == tag.Description.Trim())
    //    {
    //      dictionaryItem.Value = tag.ToString();
    //      return;
    //    }
    //  }
    //  bitmapFile.Metadata.Add(new DictionaryItem {Name = tag.Description.Trim(), Value = tag.ToString()});
    //}

    private PointCollection ConvertToPointCollection(int[] values)
    {
      //if (this.PerformHistogramSmoothing)
      //{
      values = SmoothHistogram(values);
      //}

      int max = values.Max();

      PointCollection points = new PointCollection();
      // first point (lower-left corner)
      points.Add(new System.Windows.Point(0, max));
      // middle points
      for (int i = 0; i < values.Length; i++)
      {
        points.Add(new System.Windows.Point(i, max - values[i]));
      }
      // last point (lower-right corner)
      points.Add(new System.Windows.Point(values.Length - 1, max));
      points.Freeze();
      return points;
    }

    private int[] SmoothHistogram(int[] originalValues)
    {
      int[] smoothedValues = new int[originalValues.Length];

      double[] mask = new double[] { 0.25, 0.5, 0.25 };

      for (int bin = 1; bin < originalValues.Length - 1; bin++)
      {
        double smoothedValue = 0;
        for (int i = 0; i < mask.Length; i++)
        {
          smoothedValue += originalValues[bin - 1 + i] * mask[i];
        }
        smoothedValues[bin] = (int)smoothedValue;
      }

      return smoothedValues;
    }

    private byte[] DecriptNikonData(byte[] data,int shutterCount, int serialNumber)
    {
      byte[] res=new byte[data.Length];
      data.CopyTo(res, 0);
      int decryptedLength = data.Length;
byte[,] xlat = new byte[2, 256] {
            { 
                0xc1,0xbf,0x6d,0x0d,0x59,0xc5,0x13,0x9d,0x83,0x61,0x6b,0x4f,0xc7,0x7f,0x3d,0x3d,
		        0x53,0x59,0xe3,0xc7,0xe9,0x2f,0x95,0xa7,0x95,0x1f,0xdf,0x7f,0x2b,0x29,0xc7,0x0d,
		        0xdf,0x07,0xef,0x71,0x89,0x3d,0x13,0x3d,0x3b,0x13,0xfb,0x0d,0x89,0xc1,0x65,0x1f,
		        0xb3,0x0d,0x6b,0x29,0xe3,0xfb,0xef,0xa3,0x6b,0x47,0x7f,0x95,0x35,0xa7,0x47,0x4f,
		        0xc7,0xf1,0x59,0x95,0x35,0x11,0x29,0x61,0xf1,0x3d,0xb3,0x2b,0x0d,0x43,0x89,0xc1,
		        0x9d,0x9d,0x89,0x65,0xf1,0xe9,0xdf,0xbf,0x3d,0x7f,0x53,0x97,0xe5,0xe9,0x95,0x17,
		        0x1d,0x3d,0x8b,0xfb,0xc7,0xe3,0x67,0xa7,0x07,0xf1,0x71,0xa7,0x53,0xb5,0x29,0x89,
		        0xe5,0x2b,0xa7,0x17,0x29,0xe9,0x4f,0xc5,0x65,0x6d,0x6b,0xef,0x0d,0x89,0x49,0x2f,
		        0xb3,0x43,0x53,0x65,0x1d,0x49,0xa3,0x13,0x89,0x59,0xef,0x6b,0xef,0x65,0x1d,0x0b,
		        0x59,0x13,0xe3,0x4f,0x9d,0xb3,0x29,0x43,0x2b,0x07,0x1d,0x95,0x59,0x59,0x47,0xfb,
		        0xe5,0xe9,0x61,0x47,0x2f,0x35,0x7f,0x17,0x7f,0xef,0x7f,0x95,0x95,0x71,0xd3,0xa3,
		        0x0b,0x71,0xa3,0xad,0x0b,0x3b,0xb5,0xfb,0xa3,0xbf,0x4f,0x83,0x1d,0xad,0xe9,0x2f,
		        0x71,0x65,0xa3,0xe5,0x07,0x35,0x3d,0x0d,0xb5,0xe9,0xe5,0x47,0x3b,0x9d,0xef,0x35,
		        0xa3,0xbf,0xb3,0xdf,0x53,0xd3,0x97,0x53,0x49,0x71,0x07,0x35,0x61,0x71,0x2f,0x43,
		        0x2f,0x11,0xdf,0x17,0x97,0xfb,0x95,0x3b,0x7f,0x6b,0xd3,0x25,0xbf,0xad,0xc7,0xc5,
		        0xc5,0xb5,0x8b,0xef,0x2f,0xd3,0x07,0x6b,0x25,0x49,0x95,0x25,0x49,0x6d,0x71,0xc7 },
		    { 
                0xa7,0xbc,0xc9,0xad,0x91,0xdf,0x85,0xe5,0xd4,0x78,0xd5,0x17,0x46,0x7c,0x29,0x4c,
		        0x4d,0x03,0xe9,0x25,0x68,0x11,0x86,0xb3,0xbd,0xf7,0x6f,0x61,0x22,0xa2,0x26,0x34,
		        0x2a,0xbe,0x1e,0x46,0x14,0x68,0x9d,0x44,0x18,0xc2,0x40,0xf4,0x7e,0x5f,0x1b,0xad,
		        0x0b,0x94,0xb6,0x67,0xb4,0x0b,0xe1,0xea,0x95,0x9c,0x66,0xdc,0xe7,0x5d,0x6c,0x05,
		        0xda,0xd5,0xdf,0x7a,0xef,0xf6,0xdb,0x1f,0x82,0x4c,0xc0,0x68,0x47,0xa1,0xbd,0xee,
		        0x39,0x50,0x56,0x4a,0xdd,0xdf,0xa5,0xf8,0xc6,0xda,0xca,0x90,0xca,0x01,0x42,0x9d,
		        0x8b,0x0c,0x73,0x43,0x75,0x05,0x94,0xde,0x24,0xb3,0x80,0x34,0xe5,0x2c,0xdc,0x9b,
		        0x3f,0xca,0x33,0x45,0xd0,0xdb,0x5f,0xf5,0x52,0xc3,0x21,0xda,0xe2,0x22,0x72,0x6b,
		        0x3e,0xd0,0x5b,0xa8,0x87,0x8c,0x06,0x5d,0x0f,0xdd,0x09,0x19,0x93,0xd0,0xb9,0xfc,
		        0x8b,0x0f,0x84,0x60,0x33,0x1c,0x9b,0x45,0xf1,0xf0,0xa3,0x94,0x3a,0x12,0x77,0x33,
		        0x4d,0x44,0x78,0x28,0x3c,0x9e,0xfd,0x65,0x57,0x16,0x94,0x6b,0xfb,0x59,0xd0,0xc8,
		        0x22,0x36,0xdb,0xd2,0x63,0x98,0x43,0xa1,0x04,0x87,0x86,0xf7,0xa6,0x26,0xbb,0xd6,
		        0x59,0x4d,0xbf,0x6a,0x2e,0xaa,0x2b,0xef,0xe6,0x78,0xb6,0x4e,0xe0,0x2f,0xdc,0x7c,
		        0xbe,0x57,0x19,0x32,0x7e,0x2a,0xd0,0xb8,0xba,0x29,0x00,0x3c,0x52,0x7d,0xa8,0x49,
		        0x3b,0x2d,0xeb,0x25,0x49,0xfa,0xa3,0xaa,0x39,0xa7,0xc5,0xa7,0x50,0x11,0x36,0xfb,
		        0xc6,0x67,0x4a,0xf5,0xa5,0x12,0x65,0x7e,0xb0,0xdf,0xaf,0x4e,0xb3,0x61,0x7f,0x2f } };
    
      byte key = 0;
      for (byte i = 0; i < 4; i++)
      {
        key = (byte)(key ^ ((shutterCount >> (i * 8)) & 0xff));
      }


        //  sbyte ci = (sbyte)xlat[0,Convert.ToByte(serialNumber & 0xff)];
        //  sbyte cj = (sbyte)xlat[1,(byte)key];
        //  sbyte ck = 0x60;

        //    for(int i=0;i<decryptedLength;++i)
        //    {
        //      cj=(sbyte) (cj+ (ci*ck++));
        //      sbyte ii = (sbyte) (data[i] ^ cj);
        //      res[i] = (byte)ii;
        //    }

      byte ci = xlat[0, serialNumber & 0xff];
      byte cj = xlat[1, key];
      byte ck = 0x60;
      for (int i = 0; i < res.Length; i++)
      {
        cj += (byte)(ci * ck++);
        res[i] ^= cj;
      }

      return res;
    }
        /**
     * Nikon encrypt some data
     * This function is used to decrypt them. Don't ask anything about "how does
     * it work" and "what's it doing", I just translated the C++ & Perl code
     * from Exiv2, Exiftool & Raw Photo Parser (Copyright 2004-2006 Dave Coffin)
     *
     * @param Integer $serialNumber : the camera serial number, in Integer
     *                                format (from the 0x001d tag, not the 0x00a0)
     * @param Integer $shutterCount : shutterCount value in the file
     * @param String $data : data to decrypt
     * @param Integer $decryptedLength : number of byte to decrypt
     * @return String : the decrypted data
     */
    //private function decryptData($serialNumber, $shutterCount, $data, $decryptedLength=0)
    //{
    //  $xlat = Array(
    //            Array(0xc1,0xbf,0x6d,0x0d,0x59,0xc5,0x13,0x9d,0x83,0x61,0x6b,0x4f,0xc7,0x7f,0x3d,0x3d,
    //                  0x53,0x59,0xe3,0xc7,0xe9,0x2f,0x95,0xa7,0x95,0x1f,0xdf,0x7f,0x2b,0x29,0xc7,0x0d,
    //                  0xdf,0x07,0xef,0x71,0x89,0x3d,0x13,0x3d,0x3b,0x13,0xfb,0x0d,0x89,0xc1,0x65,0x1f,
    //                  0xb3,0x0d,0x6b,0x29,0xe3,0xfb,0xef,0xa3,0x6b,0x47,0x7f,0x95,0x35,0xa7,0x47,0x4f,
    //                  0xc7,0xf1,0x59,0x95,0x35,0x11,0x29,0x61,0xf1,0x3d,0xb3,0x2b,0x0d,0x43,0x89,0xc1,
    //                  0x9d,0x9d,0x89,0x65,0xf1,0xe9,0xdf,0xbf,0x3d,0x7f,0x53,0x97,0xe5,0xe9,0x95,0x17,
    //                  0x1d,0x3d,0x8b,0xfb,0xc7,0xe3,0x67,0xa7,0x07,0xf1,0x71,0xa7,0x53,0xb5,0x29,0x89,
    //                  0xe5,0x2b,0xa7,0x17,0x29,0xe9,0x4f,0xc5,0x65,0x6d,0x6b,0xef,0x0d,0x89,0x49,0x2f,
    //                  0xb3,0x43,0x53,0x65,0x1d,0x49,0xa3,0x13,0x89,0x59,0xef,0x6b,0xef,0x65,0x1d,0x0b,
    //                  0x59,0x13,0xe3,0x4f,0x9d,0xb3,0x29,0x43,0x2b,0x07,0x1d,0x95,0x59,0x59,0x47,0xfb,
    //                  0xe5,0xe9,0x61,0x47,0x2f,0x35,0x7f,0x17,0x7f,0xef,0x7f,0x95,0x95,0x71,0xd3,0xa3,
    //                  0x0b,0x71,0xa3,0xad,0x0b,0x3b,0xb5,0xfb,0xa3,0xbf,0x4f,0x83,0x1d,0xad,0xe9,0x2f,
    //                  0x71,0x65,0xa3,0xe5,0x07,0x35,0x3d,0x0d,0xb5,0xe9,0xe5,0x47,0x3b,0x9d,0xef,0x35,
    //                  0xa3,0xbf,0xb3,0xdf,0x53,0xd3,0x97,0x53,0x49,0x71,0x07,0x35,0x61,0x71,0x2f,0x43,
    //                  0x2f,0x11,0xdf,0x17,0x97,0xfb,0x95,0x3b,0x7f,0x6b,0xd3,0x25,0xbf,0xad,0xc7,0xc5,
    //                  0xc5,0xb5,0x8b,0xef,0x2f,0xd3,0x07,0x6b,0x25,0x49,0x95,0x25,0x49,0x6d,0x71,0xc7),
    //            Array(0xa7,0xbc,0xc9,0xad,0x91,0xdf,0x85,0xe5,0xd4,0x78,0xd5,0x17,0x46,0x7c,0x29,0x4c,
    //                  0x4d,0x03,0xe9,0x25,0x68,0x11,0x86,0xb3,0xbd,0xf7,0x6f,0x61,0x22,0xa2,0x26,0x34,
    //                  0x2a,0xbe,0x1e,0x46,0x14,0x68,0x9d,0x44,0x18,0xc2,0x40,0xf4,0x7e,0x5f,0x1b,0xad,
    //                  0x0b,0x94,0xb6,0x67,0xb4,0x0b,0xe1,0xea,0x95,0x9c,0x66,0xdc,0xe7,0x5d,0x6c,0x05,
    //                  0xda,0xd5,0xdf,0x7a,0xef,0xf6,0xdb,0x1f,0x82,0x4c,0xc0,0x68,0x47,0xa1,0xbd,0xee,
    //                  0x39,0x50,0x56,0x4a,0xdd,0xdf,0xa5,0xf8,0xc6,0xda,0xca,0x90,0xca,0x01,0x42,0x9d,
    //                  0x8b,0x0c,0x73,0x43,0x75,0x05,0x94,0xde,0x24,0xb3,0x80,0x34,0xe5,0x2c,0xdc,0x9b,
    //                  0x3f,0xca,0x33,0x45,0xd0,0xdb,0x5f,0xf5,0x52,0xc3,0x21,0xda,0xe2,0x22,0x72,0x6b,
    //                  0x3e,0xd0,0x5b,0xa8,0x87,0x8c,0x06,0x5d,0x0f,0xdd,0x09,0x19,0x93,0xd0,0xb9,0xfc,
    //                  0x8b,0x0f,0x84,0x60,0x33,0x1c,0x9b,0x45,0xf1,0xf0,0xa3,0x94,0x3a,0x12,0x77,0x33,
    //                  0x4d,0x44,0x78,0x28,0x3c,0x9e,0xfd,0x65,0x57,0x16,0x94,0x6b,0xfb,0x59,0xd0,0xc8,
    //                  0x22,0x36,0xdb,0xd2,0x63,0x98,0x43,0xa1,0x04,0x87,0x86,0xf7,0xa6,0x26,0xbb,0xd6,
    //                  0x59,0x4d,0xbf,0x6a,0x2e,0xaa,0x2b,0xef,0xe6,0x78,0xb6,0x4e,0xe0,0x2f,0xdc,0x7c,
    //                  0xbe,0x57,0x19,0x32,0x7e,0x2a,0xd0,0xb8,0xba,0x29,0x00,0x3c,0x52,0x7d,0xa8,0x49,
    //                  0x3b,0x2d,0xeb,0x25,0x49,0xfa,0xa3,0xaa,0x39,0xa7,0xc5,0xa7,0x50,0x11,0x36,0xfb,
    //                  0xc6,0x67,0x4a,0xf5,0xa5,0x12,0x65,0x7e,0xb0,0xdf,0xaf,0x4e,0xb3,0x61,0x7f,0x2f)
    //          );
    //  $returned="";

    //  if($decryptedLength==0 or $decryptedLength>strlen($data))
    //    $decryptedLength=strlen($data);

    //  $key = 0;
    //  for($i=0; $i < 4; $i++)
    //  {
    //    $key = $key ^ (($shutterCount >> ($i*8)) & 0xff);
    //  }
    //  $ci = $xlat[0][$serialNumber & 0xff];
    //  $cj = $xlat[1][$key];
    //  $ck = 0x60;

    //  for($i=0;$i<$decryptedLength;++$i)
    //  {
    //    $cj+=$ci*$ck++;
    //    $returned.= chr(ord($data{$i}) ^ $cj);
    //  }
    //  return($returned);
    //}

  }
}
