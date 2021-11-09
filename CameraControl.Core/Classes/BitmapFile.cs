using System.Windows.Media;
using System.Windows.Media.Imaging;
using CameraControl.Devices.Classes;

namespace CameraControl.Core.Classes
{
  public class BitmapFile:BaseFieldClass
  {
    private PointCollection luminanceHistogramPoints = null;
    private PointCollection redColorHistogramPoints = null;
    private PointCollection greenColorHistogramPoints = null;
    private PointCollection blueColorHistogramPoints = null;

    public delegate void BitmapLoadedEventHandler(object sender);

    public virtual event BitmapLoadedEventHandler BitmapLoaded;
    
    private FileItem _fileItem;
    public FileItem FileItem
    {
      get { return _fileItem; }
      set
      {
        _fileItem = value;
        NotifyPropertyChanged("FileItem");
      }
    }

    private bool _isLoaded;
    public bool IsLoaded
    {
      get { return _isLoaded; }
      set
      {
        _isLoaded = value;
        NotifyPropertyChanged("IsLoaded");
      }
    }

    private WriteableBitmap _displayImage;
    public WriteableBitmap DisplayImage
    {
      get { return _displayImage; }
      set
      {
        //if(_displayImage==null && FileItem!=null)
        //{
        //  _displayImage = FileItem.Thumbnail;
        //}
        _displayImage = value;
        NotifyPropertyChanged("DisplayImage");
      }
    }

    public PointCollection LuminanceHistogramPoints
    {
      get
      {
        return this.luminanceHistogramPoints;
      }
      set
      {
        if (this.luminanceHistogramPoints != value)
        {
          this.luminanceHistogramPoints = value;
          NotifyPropertyChanged("LuminanceHistogramPoints");
        }
      }
    }

    public PointCollection RedColorHistogramPoints
    {
      get
      {
        return this.redColorHistogramPoints;
      }
      set
      {
        if (this.redColorHistogramPoints != value)
        {
          this.redColorHistogramPoints = value;
          NotifyPropertyChanged("RedColorHistogramPoints");
        }
      }
    }

    public PointCollection GreenColorHistogramPoints
    {
      get
      {
        return this.greenColorHistogramPoints;
      }
      set
      {
        if (this.greenColorHistogramPoints != value)
        {
          this.greenColorHistogramPoints = value;
          NotifyPropertyChanged("GreenColorHistogramPoints");
        }
      }
    }

    public PointCollection BlueColorHistogramPoints
    {
      get
      {
        return this.blueColorHistogramPoints;
      }
      set
      {
        if (this.blueColorHistogramPoints != value)
        {
          this.blueColorHistogramPoints = value;
          NotifyPropertyChanged("BlueColorHistogramPoints");
        }
      }
    }

    private bool _rawCodecNeeded;
    public bool RawCodecNeeded
    {
      get { return _rawCodecNeeded; }
      set
      {
        _rawCodecNeeded = value;
        NotifyPropertyChanged("RawCodecNeeded");
      }
    }

    private string _infoLabel;
    public string InfoLabel
    {
      get { return _infoLabel; }
      set
      {
        _infoLabel = value;
        NotifyPropertyChanged("InfoLabel");
      }
    }

    public AsyncObservableCollection<DictionaryItem> Metadata { get; set; }

    //public BitmapImage GetBitmap()
    //{
    //  if(!File.Exists(FileItem.FileName))
    //  {
    //    Log.Error("File not found " + FileItem.FileName);
    //    StaticHelper.Instance.SystemMessage = "File not found " + FileItem.FileName;
    //  }
    //  BitmapImage res = null;
    //  //Metadata.Clear();
    //  try
    //  {
    //    if (FileItem.IsRaw)
    //    {
    //      BitmapDecoder bmpDec = BitmapDecoder.Create(new Uri(FileItem.FileName), BitmapCreateOptions.None, BitmapCacheOption.OnLoad);

    //      DisplayImage = new WriteableBitmap(bmpDec.Frames.Single()); 
    //    }
    //    else
    //    {
    //      Bitmap image = (Bitmap) Image.FromFile(FileItem.FileName);
    //      var exif = new EXIFextractor(ref image, "n");
    //      if (exif["Orientation"] != null)
    //      {
    //        RotateFlipType flip = EXIFextractorEnumerator.OrientationToFlipType(exif["Orientation"].ToString());

    //        if (flip != RotateFlipType.RotateNoneFlipNone)  // don't flip of orientation is correct
    //        {
    //          image.RotateFlip(flip);
    //        }
    //        if (ServiceProvider.Settings.Rotate != RotateFlipType.RotateNoneFlipNone)
    //        {
    //          image.RotateFlip(ServiceProvider.Settings.Rotate);
    //        }
    //      }
    //      DisplayImage = BitmapSourceConvert.CreateWriteableBitmapFromBitmap(image);
    //      image.Dispose();
    //      Thread threadPhoto = new Thread(GetAdditionalData);
    //      threadPhoto.Start();
    //    }
    //  }
    //  catch (Exception exception)
    //  {
    //    Log.Error(exception);
    //  }
    //  if (BitmapLoaded != null)
    //    BitmapLoaded(this);
    //  return res;
    //}

    //private void GetAdditionalData()
    //{
    //  try
    //  {
    //    using (Bitmap bmp = new Bitmap(FileItem.FileName))
    //    {
    //      // Luminance
    //      ImageStatisticsHSL hslStatistics = new ImageStatisticsHSL(bmp);
    //      this.LuminanceHistogramPoints = ConvertToPointCollection(hslStatistics.Luminance.Values);
    //      // RGB
    //      ImageStatistics rgbStatistics = new ImageStatistics(bmp);
    //      this.RedColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Red.Values);
    //      this.GreenColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Green.Values);
    //      this.BlueColorHistogramPoints = ConvertToPointCollection(rgbStatistics.Blue.Values);
    //    }
    //    GetMetadata();
    //  }
    //  catch (Exception ex)
    //  {
    //    Log.Error(ex);
    //  }
    //}

    //public void GetMetadata()
    //{
    //  //Exiv2Net.Image image = new Exiv2Net.Image(FileItem.FileName);
    //  //foreach (KeyValuePair<string, Exiv2Net.Value> i in image)
    //  //{
    //  //  Console.WriteLine(i);
    //  //}
    //  using (FreeImageBitmap bitmap = new FreeImageBitmap(FileItem.FileName))
    //  {
    //    foreach (MetadataModel metadataModel in bitmap.Metadata)
    //    {
    //      foreach (MetadataTag metadataTag in metadataModel)
    //      {
    //        AddMetadataItem(metadataTag);
    //        if(metadataTag.Key=="AFInfo2")
    //        {
    //          byte[] b=metadataTag.Value as byte[];
    //          string hex =BitConverter.ToString(b);
    //          //b = b.Reverse().ToArray();

    //          ushort i6=BitConverter.ToUInt16(b, 6);
    //        }
    //        //i += metadataTag.Length;
    //        //if (!string.IsNullOrEmpty(metadataTag.Description))
    //        //  Metadata.Add(new DictionaryItem { Name = metadataTag.Description, Value = metadataTag.ToString() });
    //      }
    //    }
    //    //Enumerable.OrderBy(Metadata, dict => dict.Name);
    //  }
    //}

//*

//    public void AddMetadataItem(MetadataTag tag )
//    {
//      if (string.IsNullOrEmpty(tag.Description))
//        return;
//      foreach (DictionaryItem dictionaryItem in Metadata)
//      {
//        if (dictionaryItem.Name == tag.Description.Trim())
//        {
//          dictionaryItem.Value = tag.ToString();
//          return;
//        }
//      }
//      Metadata.Add(new DictionaryItem { Name = tag.Description.Trim(), Value = tag.ToString()});
//    }

    public void OnBitmapLoaded()
    {
      if (BitmapLoaded != null)
        BitmapLoaded(this);
    }


    public void SetFileItem(FileItem item)
    {
      FileItem = item;
      IsLoaded = false;
      if (DisplayImage == null)
        DisplayImage = new WriteableBitmap(FileItem.Thumbnail);
    }

    //private PointCollection ConvertToPointCollection(int[] values)
    //{
    //  //if (this.PerformHistogramSmoothing)
    //  //{
    //  values = SmoothHistogram(values);
    //  //}

    //  int max = values.Max();

    //  PointCollection points = new PointCollection();
    //  // first point (lower-left corner)
    //  points.Add(new System.Windows.Point(0, max));
    //  // middle points
    //  for (int i = 0; i < values.Length; i++)
    //  {
    //    points.Add(new System.Windows.Point(i, max - values[i]));
    //  }
    //  // last point (lower-right corner)
    //  points.Add(new System.Windows.Point(values.Length - 1, max));
    //  points.Freeze();
    //  return points;
    //}

    //private int[] SmoothHistogram(int[] originalValues)
    //{
    //  int[] smoothedValues = new int[originalValues.Length];

    //  double[] mask = new double[] { 0.25, 0.5, 0.25 };

    //  for (int bin = 1; bin < originalValues.Length - 1; bin++)
    //  {
    //    double smoothedValue = 0;
    //    for (int i = 0; i < mask.Length; i++)
    //    {
    //      smoothedValue += originalValues[bin - 1 + i] * mask[i];
    //    }
    //    smoothedValues[bin] = (int)smoothedValue;
    //  }

    //  return smoothedValues;
    //}

    public BitmapFile()
    {
      IsLoaded = false;
      RawCodecNeeded = false;
      Metadata = new AsyncObservableCollection<DictionaryItem>();
      Metadata.Add(new DictionaryItem() {Name = "Exposure mode"});
      Metadata.Add(new DictionaryItem() {Name = "Exposure program"});
      Metadata.Add(new DictionaryItem() {Name = "Exposure time"});
      Metadata.Add(new DictionaryItem() {Name = "F number"});
      Metadata.Add(new DictionaryItem() {Name = "Lens focal length"});
      Metadata.Add(new DictionaryItem() {Name = "ISO speed rating"});
      Metadata.Add(new DictionaryItem() {Name = "Metering mode"});
      Metadata.Add(new DictionaryItem() {Name = "White balance"});
      Metadata.Add(new DictionaryItem() {Name = "Exposure bias"});
    }
  }
}
