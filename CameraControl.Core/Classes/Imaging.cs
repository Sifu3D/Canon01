using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Windows;

using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace CameraControl.Core.Classes
{
  public static class Imaging
  {
    public static BitmapSource CreateBitmapSourceFromBitmap(Bitmap bitmap)
    {
      if (bitmap == null)
        throw new ArgumentNullException("bitmap");

      if (Application.Current.Dispatcher == null)
        return null; // Is it possible?

      try
      {
        using (MemoryStream memoryStream = new MemoryStream())
        {
          // You need to specify the image format to fill the stream. 
          // I'm assuming it is PNG
          bitmap.Save(memoryStream, ImageFormat.MemoryBmp);
          memoryStream.Seek(0, SeekOrigin.Begin);

          // Make sure to create the bitmap in the UI thread
          if (InvokeRequired)
            return (BitmapSource)Application.Current.Dispatcher.Invoke(
                new Func<Stream, BitmapSource>(CreateBitmapSourceFromBitmap),
                DispatcherPriority.Normal,
                memoryStream);

          return CreateBitmapSourceFromBitmap(memoryStream);
        }
      }
      catch (Exception)
      {
        return null;
      }
    }

    private static bool InvokeRequired
    {
      get { return Dispatcher.CurrentDispatcher != Application.Current.Dispatcher; }
    }

    private static BitmapSource CreateBitmapSourceFromBitmap(Stream stream)
    {
      BitmapDecoder bitmapDecoder = BitmapDecoder.Create(
          stream,
          BitmapCreateOptions.PreservePixelFormat,
          BitmapCacheOption.OnLoad);

      // This will disconnect the stream from the image completely...
      WriteableBitmap writable = new WriteableBitmap(bitmapDecoder.Frames.Single());
      writable.Freeze();

      return writable;
      //return bitmapDecoder.Frames.Single();
    }
  } 
}
