using System;
using System.Collections.Generic;

namespace CameraControl.Devices.Classes
{
  public class PropertyValue<T> : BaseFieldClass 
  {
    public delegate void ValueChangedEventHandler(object sender, string key, T val);
    public event ValueChangedEventHandler ValueChanged;
    
    private Dictionary<string, T> _valuesDictionary;
    private AsyncObservableCollection<T> _numericValues = new AsyncObservableCollection<T>();
    private AsyncObservableCollection<string> _values = new AsyncObservableCollection<string>();
    private bool _notifyValuChange = true;

    private ushort _code;
    public UInt16 Code
    {
      get { return _code; }
      set
      {
        _code = value;
        NotifyPropertyChanged("Code");
      }
    }

    public Type SubType { get; set; }

    private string _name;
    public string Name
    {
      get { return _name; }
      set
      {
        _name = value;
        NotifyPropertyChanged("Name");
      }
    }

    private string _value;

    public string Value
    {
      get { return _value; }
      set
      {
        //if (_value != value)
        //{
          _value = value;
          if (ValueChanged != null && _notifyValuChange)
          {
            foreach (KeyValuePair<string, T> keyValuePair in _valuesDictionary)
            {
              if (keyValuePair.Key == _value)
                ValueChanged(this, _value, keyValuePair.Value);
            }
          }
        //}
        NotifyPropertyChanged("Value");
      }
    }

    private bool _isEnabled;
    public bool IsEnabled
    {
      get
      {
        //if (Values == null || Values.Count==0)
        //  return false;
        return _isEnabled;
      }
      set
      {
        _isEnabled = value;
        NotifyPropertyChanged("IsEnabled");
      }
    }

    public AsyncObservableCollection<string> Values
    {
      get { return _values; }
    }

    public AsyncObservableCollection<T> NumericValues
    {
      get { return _numericValues; }
    }

    public PropertyValue()
    {
      _valuesDictionary = new Dictionary<string, T>();
      IsEnabled = true;
    }

    public void SetValue(T o, bool notifyValuChange)
    {
      _notifyValuChange = notifyValuChange;
      SetValue(o);
      _notifyValuChange = true;
    }

    public void SetValue(T o)
    {
      foreach (KeyValuePair<string, T> keyValuePair in _valuesDictionary)
      {
        if (EqualityComparer<T>.Default.Equals(keyValuePair.Value, o)) //(keyValuePair.Value== o)
        {
          Value = keyValuePair.Key;
          return;
        }
      }
      Console.WriteLine(string.Format("Value not found for property {0}, value {1} ", Name, o));
    }

    public void SetValue()
    {
      Value = Value;
    }


    public void SetValue(string o)
    {
      foreach (KeyValuePair<string, T> keyValuePair in _valuesDictionary)
      {
        if (keyValuePair.Key == o)
        {
          _notifyValuChange = true;
          Value = keyValuePair.Key;
          return;
        }
      }
    }

    public void SetValue(byte[] ba, bool notifyValuChange)
    {
      _notifyValuChange = notifyValuChange;
      SetValue(ba);
      _notifyValuChange = true;
    }

    public void SetValue(byte[] ba)
    {
      if (ba == null || ba.Length < 1)
        return;
      if (typeof(T) == typeof(int))
      {
        int val = BitConverter.ToInt16(ba, 0);
        SetValue((T)((object)val));
      }
      if (typeof(T) == typeof(long) && ba.Length==1)
      {
        long val = ba[0];
        SetValue((T)((object)val));
        return;
      }
      if (typeof(T) == typeof(long) && ba.Length == 2 && SubType == typeof(UInt16))
      {
        long val = BitConverter.ToUInt16(ba, 0);
        SetValue((T)((object)val));
        return;
      }
      if (typeof(T) == typeof(long) && ba.Length == 2)
      {
        long val = BitConverter.ToInt16(ba, 0); 
        SetValue((T)((object)val));
        return;
      }
      if (typeof(T) == typeof(long) && ba.Length == 4)
      {
        long val = BitConverter.ToInt32(ba, 0);
        SetValue((T)((object)val));
        return;
      }
      if (typeof(T) == typeof(long))
      {
        long val = BitConverter.ToInt32(ba, 0);
        SetValue((T)((object)val));
      }
      if (typeof(T) == typeof(uint))
      {
        uint val = BitConverter.ToUInt16(ba, 0);
        SetValue((T)((object)val));
      }
    }

    public void AddValues(string key, T value)
    {
      if (!_valuesDictionary.ContainsKey(key))
        _valuesDictionary.Add(key, value);
      _values = new AsyncObservableCollection<string>(_valuesDictionary.Keys);
      _numericValues = new AsyncObservableCollection<T>(_valuesDictionary.Values);
      NotifyPropertyChanged("Values");
    }

    public void Clear()
    {
      _valuesDictionary.Clear();
    }

  }
}
