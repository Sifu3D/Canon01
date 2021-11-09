using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using CameraControl.Core.Interfaces;

namespace CameraControl.Core.Classes
{
  public class WindowsManager
  {

    public delegate void EventEventHandler(string cmd, object o);
    public virtual event EventEventHandler Event;

    private List<IWindow> WindowsList; 
    public WindowsManager()
    {
      WindowsList = new List<IWindow>();
    }

    public void Add(IWindow window)
    {
      WindowsList.Add(window);
    }

    public void ExecuteCommand(string cmd)
    {
      ExecuteCommand(cmd, null);
    }

    public void ExecuteCommand(string cmd, object o)
    {
      foreach (IWindow window in WindowsList)
      {
        window.ExecuteCommand(cmd, o);
      }
      if (Event != null)
        Event(cmd, o);
    }

    public void ApplyTheme()
    {
      foreach (IWindow window in WindowsList)
      {
        Window win = window as Window;
        if(win!=null)
        {
          ServiceProvider.Settings.ApplyTheme(win);
        }
      }
      foreach (Window window in Application.Current.Windows)
      {
        ServiceProvider.Settings.ApplyTheme(window);        
      }
    }

    public IWindow Get(Type t)
    {
      return WindowsList.FirstOrDefault(window => window.GetType() == t);
    }

    public void Remove(string type)
    {
      IWindow windowToRemove = null;
      foreach (IWindow window in WindowsList.Where(window => window.GetType().ToString() == type))
      {
        windowToRemove = window;
      }
      if (windowToRemove != null)
        WindowsList.Remove(windowToRemove);
    }


  }
}
