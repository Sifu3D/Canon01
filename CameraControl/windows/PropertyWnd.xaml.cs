using System.Windows;
using System.Windows.Input;
using CameraControl.Core;

namespace CameraControl.windows
{
  /// <summary>
  /// Interaction logic for PropertyWnd.xaml
  /// </summary>
  public partial class PropertyWnd 
  {
    public PropertyWnd()
    {
      InitializeComponent();
      CommandBindings.Add(new CommandBinding(ApplicationCommands.Close,
          new ExecutedRoutedEventHandler(delegate { this.Close(); })));
      ServiceProvider.Settings.ApplyTheme(this);
    }
 
    public void DragWindow(object sender, MouseButtonEventArgs args)
    {
      DragMove();
    }

    private void Button_Click(object sender, RoutedEventArgs e)
    {
      Hide();
    }

    private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
    {
      if (IsVisible)
      {
        Hide();
        e.Cancel = true;
      }
    }

  }
}
