using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using CameraControl.Core.Classes;
using CameraControl.Core.Interfaces;
using CameraControl.Devices;
using CameraControl.Devices.Classes;

namespace CameraControl.Core
{
  public class PluginManager : BaseFieldClass
  {
    private AsyncObservableCollection<IPlugin> _plugins;
    public AsyncObservableCollection<IPlugin> Plugins
    {
      get { return _plugins; }
      set
      {
        _plugins = value;
        NotifyPropertyChanged("Plugins");
      }
    }

    private AsyncObservableCollection<IExportPlugin> _exportPlugins;
    public AsyncObservableCollection<IExportPlugin> ExportPlugins
    {
      get { return _exportPlugins; }
      set
      {
        _exportPlugins = value;
        NotifyPropertyChanged("ExportPlugins");
      }
    }

    private AsyncObservableCollection<IMainWindowPlugin> _mainWindowPlugins;
    public AsyncObservableCollection<IMainWindowPlugin> MainWindowPlugins
    {
      get { return _mainWindowPlugins; }
      set
      {
        _mainWindowPlugins = value;
        NotifyPropertyChanged("MainWindowPlugins");
      }
    }

    private AsyncObservableCollection<IToolPlugin> _toolPlugins;
    public AsyncObservableCollection<IToolPlugin> ToolPlugins
    {
      get { return _toolPlugins; }
      set
      {
        _toolPlugins = value;
        NotifyPropertyChanged("ToolPlugins");
      }
    }


    public PluginManager()
    {
      Plugins = new AsyncObservableCollection<IPlugin>();
      ExportPlugins = new AsyncObservableCollection<IExportPlugin>();
      ToolPlugins = new AsyncObservableCollection<IToolPlugin>();
      MainWindowPlugins = new AsyncObservableCollection<IMainWindowPlugin>();
    }

    public void LoadPlugins(string pluginFolder)
    {
      if (!Directory.Exists(pluginFolder))
        return;
      string[] files = Directory.GetFiles(pluginFolder, "*.dll");
      foreach (var pluginFile in files)
      {
        Assembly pluginAssembly = null;
        try
        {
          Log.Debug("LoadPlugins from:" + pluginFile);
          pluginAssembly = Assembly.LoadFrom(pluginFile);
        }
        catch (BadImageFormatException)
        {
          Log.Error(string.Format(" {0} has a bad image format", pluginFile));
        }
        catch (Exception exception)
        {
          Log.Error("Error loading plugin :", exception);
        }
        if (pluginAssembly == null) continue;
        try
        {
          Type[] exportedTypes = pluginAssembly.GetExportedTypes();
          foreach (var exportedType in exportedTypes)
          {
            if (exportedType.IsAbstract)
              continue;
            object pluginObject = null;
            try
            {
              pluginObject = Activator.CreateInstance(exportedType); 
            }
            catch (Exception exception)
            {
              Log.Error("Error loading type " + exportedType.FullName, exception);
            }
            if(pluginObject!=null)
            {
              var plugin = pluginObject as IPlugin;
              try
              {
                if(plugin !=null)
                {
                  plugin.Register();
                  Plugins.Add(plugin);
                }
              }
              catch (Exception exception)
              {
                Log.Error("Error registering plugiin.", exception);
              }
            }
          }
        }
        catch (Exception exception)
        {
          Log.Error("Error loading plugin  ", exception);
        }
      }
    }
  }
}
