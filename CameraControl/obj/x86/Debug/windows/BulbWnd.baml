   M S B A M L   `   `   `  ����H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CameraControl.windowsCameraControl.windows  5   �   M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core 5   	   I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5      P LCameraControl.Devices, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\Bclr-namespace:CameraControl.Devices;assembly=CameraControl.DevicesCameraControl.Devices 5      #    CameraControl.windows.BulbWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   m   ,my#clr-namespace:CameraControl.windows  6�   GCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core  5   	   JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      PDevicesBclr-namespace:CameraControl.Devices;assembly=CameraControl.Devices  5      -   5          � Title$
  Bulb��5   	   $	��227��6   $	��441��6#    � WindowStyle$ 
ToolWindow=�6/    � WindowStartupLocation$ CenterScreen=�6H    � Topmost .  � 	Resources 5
       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $e _pack://application:,,,/MahApps.Metro;component/Styles/Controls.AnimatedSingleRowTabControl.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %    5      (  "MahApps.Metro.Controls.MetroWindow   WindowCommands 5      +  %MahApps.Metro.Controls.WindowCommands  5   
   .@�5      �� -   5        $��btn_help��5   A   ��6   7  1CameraControl.Core.Translation.TranslateExtension  *
ButtonHelp+y�6h   �� (  "CameraControl.Core.ServiceProvider   Branding	 �� Source#	 Z 
 �� Path$
 OnlineReference�    BooleanToVisibilityConverter �� 	Converter# [  5      .��5      �  � ColumnDefinitions 5    
   �� 5!      $��5 �6   �� 5"      $
��192* �6   �� 5#      $
��106* �6   �� 5$      $
��115* �6    � RowDefinitions 5&   
   �� 5'      $��5 �6   �� 5(      $��1* �6   �� 5)      $��1* �6   �� 5*      $��1* �6   �� 5+      $��1* �6   �� 5,      $��1* �6   .+�5.   
   �� -   5        $��	btn_start��5.   D   $��3��6m   $��1��6}   $��5q�6�   ��6     *LabelStartCapture+6�   �� 5/   
   -   5        $��btn_stop��5/   C   $��3��6j   $��3��6z   $��5q�6�   ��6     *LabelStopCapture+6�   %  Xceed.Wpf.Toolkit.IntegerUpDown  50   
   -   5        $��upd_time��50      �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 30X�6-      Maximum$
 6000X�6:   $��2��6�   $��1��6�   $��5q�6�   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 6I   �� $
 CaptureTime� �� RelativeSource �� *FindAncestor+ �� AncestorType$ 
my:BulbWndL� �� AncestorLevel$ 1��6�   �� 51   
   -   5        $��label1��51   B   $��1��6P   $��1��6`   $��5q�6m   $��Right=�6x   ��6     *LabelCaptureTime+6x   �� 52   
   -   5        $��
lbl_status��52   o   $��5��6�   $��Center=�6�   $��Center=�6�   $��4��6�   $��5q�6�   ��6   �� (  "CameraControl.Devices.StaticHelper   Instance#	 Z $
 SystemMessage�6�     53   
   -   5        $��upd_num��53      $ 1X�6,   $ 10000X�68   $��2��6�   $��2��6�   $��5q�6�    6H   �� $
 NumOfPhotos� �� *FindAncestor+$ 
my:BulbWndL�$ 1��6�   �� 54   
   -	   5        $��label2��54   E   $��2��6S   $��1��6`   $��5q�6p   $��Right=�6{   ��6     *LabelNumberOfPhotos+6{   �� 55   
   -
   5        $��label3��55   G   $��3��6U   $��1��6b   $��5q�6r   $��Right=�6}   ��6     *LabelTimeBetweenShots+6}     56   
   -   5        $��upd_waittime��56      $ 0X�61   $
 6000X�6=   $��2��6�   $��3��6�   $��5q�6�    6L   �� $
 WaitTime� �� *FindAncestor+$ 
my:BulbWndL�$ 1��6�   �� 57   
   $��1��6�   $��3��6�   $��4��6�   $��5q�6�   $��Center=�6�   $��Center=�6�   $��13(�6  $
��Bold"�6  ��6   �� $
 Message� �� *FindAncestor+$ 
my:BulbWndL�$ 1��6  58      59      