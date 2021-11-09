using System;
using System.IO;
using System.Reflection;
using CameraControl.Core.Classes;
using CameraControl.Devices;
using CameraControl.Devices.Classes;
using log4net;
using log4net.Appender;
using log4net.Config;
using log4net.Layout;

namespace CameraControl.Core
{
  public class ServiceProvider : BaseFieldClass
  {
    private static readonly ILog _log = LogManager.GetLogger("DCC");

    public static string AppName = "digiCamControl";


    public static Settings Settings { get; set; }

    public static CameraDeviceManager DeviceManager { get; set; }
    public static TriggerClass Trigger { get; set; }
    public static WindowsManager WindowsManager { get; set; }
    public static ActionManager ActionManager { get; set; }
    public static QueueManager QueueManager { get; set; }
    public static PluginManager PluginManager { get; set; }
    public static Branding Branding { get; set; }


    public static void Configure()
    {
      Configure(AppName);
      Log.LogDebug += Log_LogDebug;
      Log.LogError += Log_LogError;
      DeviceManager = new CameraDeviceManager();
      Trigger = new TriggerClass();
      ActionManager = new ActionManager();
      QueueManager = new QueueManager();
      Branding = new Branding();
      Log.Debug("--------------------------------===========================Application starting===========================--------------------------------");
      Log.Debug("Application version : " + Assembly.GetEntryAssembly().GetName().Version);
      PluginManager = new PluginManager();

    }

    static void Log_LogError(LogEventArgs e)
    {
      _log.Error(e.Message, e.Exception);
    }

    static void Log_LogDebug(LogEventArgs e)
    {
      _log.Debug(e.Message, e.Exception);
    }

    public static void Configure(string appfolder)
    {
      bool isConfigured = _log.Logger.Repository.Configured;
      if (!isConfigured)
      {
        // Setup RollingFileAppender
        var fileAppender = new RollingFileAppender
                                                              {
                                                                Layout =
                                                                  new PatternLayout(
                                                                  "%d [%t]%-5p %c [%x] - %m%n"),
                                                                MaximumFileSize = "1000KB",
                                                                MaxSizeRollBackups = 5,
                                                                RollingStyle = RollingFileAppender.RollingMode.Size,
                                                                AppendToFile = true,
                                                                File =
                                                                  Path.Combine(
                                                                    Environment.GetFolderPath(
                                                                      Environment.SpecialFolder.CommonApplicationData),
                                                                    appfolder, "Log",
                                                                    "app.log"),
                                                                Name = "XXXRollingFileAppender"
                                                              };
        fileAppender.ActivateOptions(); // IMPORTANT, creates the file
        BasicConfigurator.Configure(fileAppender);
#if DEBUG
        // Setup TraceAppender
        TraceAppender ta = new TraceAppender(
          new PatternLayout("%d [%t]%-5p %c [%x] - %m%n"));
        BasicConfigurator.Configure(ta);
#endif

      }
    }
  }
}
