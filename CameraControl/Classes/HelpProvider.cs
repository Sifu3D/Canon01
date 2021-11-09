using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CameraControl.Core.Classes;

namespace CameraControl.Classes
{
  public enum HelpSections
  {
    MainMenu,
    FocusStacking,
    Bracketig,
    Settings,
    TimeLapse,
    LiveView,
    Session,
    Bulb,
    MultipleCamera,
    DownloadPhotos
  }

  public class HelpProvider
  {
    private static Dictionary<HelpSections, string> _helpData;

    private static void Init()
    {
      _helpData = new Dictionary<HelpSections, string>
                    {
                      {HelpSections.MainMenu, "http://www.digicamcontrol.com/manual"},
                      {HelpSections.Bracketig, "http://www.digicamcontrol.com/manual/bracketing"},
                      {HelpSections.FocusStacking, "http://nccsoftware.blogspot.ro/2012/06/how-to-focus-stacking.html"},
                      {HelpSections.Settings, "http://www.digicamcontrol.com/manual/settings"},
                      {HelpSections.TimeLapse, "http://www.digicamcontrol.com/manual/time-lapse"},
                      {HelpSections.LiveView, "http://www.digicamcontrol.com/manual/live-view"},
                      {HelpSections.Session, "http://www.digicamcontrol.com/manual/session"},
                      {HelpSections.Bulb, "http://www.digicamcontrol.com/manual/bulb-mode"},
                      {HelpSections.MultipleCamera, "http://www.digicamcontrol.com/manual/multiple-cameras"},
                      {HelpSections.DownloadPhotos, "http://www.digicamcontrol.com/manual/download-photos"},
                    };
    }


    public static void Run(HelpSections sections)
    {
      if(_helpData==null)
        Init();
      PhotoUtils.Run(_helpData[sections], "");
    }
  }
}
