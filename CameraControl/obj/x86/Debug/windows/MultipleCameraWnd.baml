   M S B A M L   `   `   `  ����H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CameraControl.windowsCameraControl.windows  5   �   M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core 5      I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      P LCameraControl.Devices, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\Bclr-namespace:CameraControl.Devices;assembly=CameraControl.DevicesCameraControl.Devices 5      ?$clr-namespace:CameraControl.ControlsCameraControl.Controls  5      kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5      -    'CameraControl.windows.MultipleCameraWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  6�   -my1#clr-namespace:CameraControl.windows  6�   GCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core  5      JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      PDevicesBclr-namespace:CameraControl.Devices;assembly=CameraControl.Devices  5      0local$clr-namespace:CameraControl.Controls  5      PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      -   5        $	��408��5   y   $	��693��6�     � WindowStartupLocation$  CenterScreen=�5	       � WindowStyle$ 
ToolWindow=�6<   (  "MahApps.Metro.Controls.MetroWindow   ShowMaxRestoreButton .     ShowMinButton .   � Topmost .  � Title 5   @   7  1CameraControl.Core.Translation.TranslateExtension  *MultipleCameraWindowTitle+ � 	Resources 5       �� MergedDictionaries �� Source !  BooleanToVisibilityConverter1�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $e _pack://application:,,,/MahApps.Metro;component/Styles/Controls.AnimatedSingleRowTabControl.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %   &	        �� 5      6+   5      	   WindowCommands	 5      +  %MahApps.Metro.Controls.WindowCommands  5   
   .@�5      �� -   5        $��btn_help��5   A   ��6     *
ButtonHelp+y�6h   �� (  "CameraControl.Core.ServiceProvider
   Branding �� Source# Z
  �� Path$ OnlineReference�   BooleanToVisibilityConverter �� 	Converter# [ 5      .��5!      �  � RowDefinitions 5"   
   �� 5#      $	��22* �6   �� 5$      $
��315* �6   �� 5%      $��30 �6    � ColumnDefinitions 5'   
   �� 5(      $	��180 �6   �� 5)      $
��635* �6   .+�5+   
   �� -   5        $��btn_shot��5+      $��54��6F   $
��Left=�6R   $��17,0,0,0q�6m   $	��Top=�6�   $	��154��6�   $��1��6�   ��6     *ButtonCapturePhotos+6�   %  Xceed.Wpf.Toolkit.IntegerUpDown  5,   
   -   5        $��int_wait��5,   1   $��
16,165,0,0q�6   $	��Top=�6A    � ToolTip$, &Wait beetven cameras shots in seconds ��6Y   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 0X�6�      Maximum$ 1000000X�6�   $
��Left=�6+  $	��124��6F  $��1��6R  �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 6�   �� $ DelaySec� �� RelativeSource �� *FindAncestor+ �� AncestorType$ my1:MultipleCameraWndL� �� AncestorLevel$ 1��6R  �� 5-   
   -   5        $��label1��5-   �   $! Delay between camera shouts��6<   $
��Left=�6b   $��
17,145,0,0q�6}   $��28��6�   $	��Top=�6�   $��1��6�   ��6     *
LabelDelay+6�   �� 5.   
   -   5        $��lbl_message��5.   o   $��Center=�6�   $��Center=�6�   $��2��6�   $��2��6�   ��6   �� (  "CameraControl.Devices.StaticHelper   Instance# Z $ SystemMessage�6�   �� 5/   
   -   5        $��chk_noautofocus��5/   �   $��16��6J   $
��Left=�6V   $��
17,123,0,0q�6q   $	��Top=�6�   $��1��6B  ��6     *LabelDisableAutofocus+ d� 	IsChecked 6�   �� $ DisbleAutofocus� �� *FindAncestor+$ my1:MultipleCameraWndL�$ 1��6B  �� 50   
   -   5        $��chk_ignoreisbusy��50   �   $��16��6F   $
��Left=�6R   $��
17,304,0,0q�6m   $	��Top=�6�   $��1��6<  ��6     *LabelIgnoreIsBusy+ 6�   �� $ IgnoreIsBusy� �� *FindAncestor+$ my1:MultipleCameraWndL�$ 1��6<    51   
   -	   5        $��integerUpDown1��51   1   $��
17,225,0,0q�6   $	��Top=�6G      ShowButtonSpinner . $ 10000X�6�   $ 1X�6  $
��Left=�6  $��1��65   6_   �� $ NumOfPhotos� �� *FindAncestor+$ my1:MultipleCameraWndL�$ 1��65  �� 52   
   -
   5        $��label2��52   �   $��28��6G   $
��Left=�6S   $��
17,197,0,0q�6n   $	��Top=�6�   $��1��6�   ��6     *LabelNumberOfCaptures+6�     53   
   -   5        $��integerUpDown2��53   1   $��
17,268,0,0q�6   $	��Top=�6G   $ 0X�6�   $ 100000X�6�   $
��Left=�6�   $	��124��6  $��1��6%   6_   �� $ WaitSec� �� *FindAncestor+$ my1:MultipleCameraWndL�$ 1��6%  �� 54   
   -   5        $��label3��54   z   $��28��6?   $
��Left=�6K   $��
17,246,0,0q�6f   $	��Top=�6�   $' !Wait time between capture circles��6�   $��1��6�   ��6     *LabelWaitTime+6�   �� 55   
   -   5        $��btn_stop��55   w   $��23��6=   $
��Left=�6I   $��	17,60,0,0q�6d   $	��Top=�6�   $	��154��6�   $��1��6�   ��6     *
ButtonStop+6�   �� 56   
   -   5        $��listBox1��56   "   $��1��6   $��1��6�   $��Disabled=�6�   ��62   ��    DeviceManager# Z $ ConnectedDevices� �� SelectedItem 6�   �� # Z $ SelectedCameraDevice� � ContextMenu 57      �� 58      .@�59      m� -   5        ��59        *MenuProperties+6N   m� 5:      -   5        ��5:        *MenuUseSelectedCameraPreset+6[   5;      ��5=      �� 5>      .R�5?      � 5@      ��5B      �� 5C      .R�5D      �  � Orientation$ Vertical=�6    .+�5E      ��  6#   �� $ 	IsChecked�'	   !CameraControl.Controls.CameraItem	  5F       	  CameraDevice 6+   �� $ .�5G      5H      5J      �� 5K   
   $��1��6G   $��0q�6W   ��6     *LabelConnectedCameras+6W   �� 5L   
   -   5        $��btn_resetCounters��5L   v   $��23��6<   $
��Left=�6H   $��	17,91,0,0q�6c   $	��Top=�6�   $	��154��6�   $��1��6�   ��6     *LabelResetCounters+6�   5M      5N      