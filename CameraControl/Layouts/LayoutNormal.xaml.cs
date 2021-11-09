using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Input;
using CameraControl.Classes;
using CameraControl.Core;
using CameraControl.Core.Classes;
using Microsoft.VisualBasic.FileIO;
using Xceed.Wpf.Toolkit.Core.Input;
using Clipboard = System.Windows.Clipboard;
using MessageBox = System.Windows.Forms.MessageBox;
using UserControl = System.Windows.Controls.UserControl;

namespace CameraControl.Layouts
{
  /// <summary>
  /// Interaction logic for LayoutNormal.xaml
  /// </summary>
  public partial class LayoutNormal : LayoutBase
  {
    public LayoutNormal()
    {
      InitializeComponent();
      ImageLIst = ImageLIstBox;
      InitServices();
    }
  }
}
