   M S B A M L   `   `   `  ����M  ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core  5      I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      U QGma.QrCodeNet.Encoding, Version=0.0.1.29147, Culture=neutral, PublicKeyToken=nullwPclr-namespace:Gma.QrCodeNet.Encoding.Windows.WPF;assembly=Gma.QrCodeNet.Encoding"Gma.QrCodeNet.Encoding.Windows.WPF 6e   kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation  5      H DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:CameraControl.ControlsCameraControl.Controls 5      '   !CameraControl.windows.SettingsWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5   �   GCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core  5      JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      YmyPclr-namespace:Gma.QrCodeNet.Encoding.Windows.WPF;assembly=Gma.QrCodeNet.Encoding  6e   PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      4	Controls1$clr-namespace:CameraControl.Controls  5      -   5        $	��506��5   <   $	��610��6I     � WindowStyle$  
ToolWindow=�6l    � WindowStartupLocation$ CenterScreen=�6�   (  "MahApps.Metro.Controls.MetroWindow   ShowMaxRestoreButton .     ShowMinButton .   � Title 6	   7   1CameraControl.Core.Translation.TranslateExtension  *SettingsWindowTitle+ � 	Resources 5	       �� MergedDictionaries �� Source�� 5
   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %    5         WindowCommands 5      +  %MahApps.Metro.Controls.WindowCommands  5   
   .@�5      �� -   5        $��btn_help��5   A   ��6     *
ButtonHelp+y�6h   �� (   "CameraControl.Core.ServiceProvider	   Branding
 �� Source#
 Z	  �� Path$ OnlineReference�    BooleanToVisibilityConverter �� 	Converter# [  5      .��5      �  � RowDefinitions 5   
   �� 5       $
��220* �6   �� 5!      $	��41* �6   .+�5#   
   �� -   5        $��tabControl1��5#       �� TabStripPlacement$
 Left=�6(   .@�5$      �� -   5        $��tabItem1��5$   C   ��6     *LabelGeneral+.��5%      �  � ColumnDefinitions 5&      �� 5'      $��10 �6+   �� 5(      $
��100* �6+   �� 5)      $��10 �6+   �� 5*      $
��100* �6+   �� 5+      $��10 �6+    5-      �� 5.      $��10 �6(   �� 5/      $��35 �6(   �� 50      $��35 �6(   �� 51      $��20 �6(   �� 52      $��35 �6(   �� 53      $��25 �6(   �� 54      $��35 �6(   �� 55      $��25 �6(   �� 56      $��25 �6(   �� 57      $��35 �6(   �� 58      $��25 �6(   �� 59      $��30 �6(   �� 5:      $��30 �6(   �� 5;      $	��83* �6(   �� 5<      $	��29* �6(   .+�5>      �� $��1��6H   $��1��6U   $��Center=�6e   ��6     *
LabelTheme+6e   �� 5?      -   5        $��
cmb_themes��5?      $��1��61   $��3��6>   $��2q�6�    �� SelectedIndex 6N   ��    Settings#
 Z $ CurrentThemeIndex�.@�5@      �� $��	Dark/Blue��6'   �� 5A      $��
Dark/Green��6'   �� 5B      $��Dark/Orange��6'   �� 5C      $��Dark/Purple��6'   �� 5D      $��Dark/Red��6'   �� 5E      $��
Light/Blue��6'   �� 5F      $��Light/Green��6'   �� 5G      $��Light/Orange��6'   �� 5H      $��Light/Purple��6'   �� 5I      $��	Light/Red��6'   5J      �� 5K      $��2��6M   $��1��6Z   $��Center=�6j   ��6     *LabelMainWindow+6j   �� 5L      -   5        $��cmb_mainwindow��5L      $��2��65   $��3��6B   $��2q�6�    �� SelectedItem 6R   �� #
 Z $ SelectedMainForm�6�   �� 5N      $��4��6T   $��1��6a   ��6     *LabelInterfaceLanguage+6a   �� 5O       �� DisplayMemberPath$
 Name��6u    �� SelectedValuePath$ Value��6�   $��4��6  $��3��6  $��2q�6.  ��6    �� 7   1CameraControl.Core.Translation.TranslationManager   AvailableLangs#
 Z  �� SelectedValue 6�   �� #
 Z $ SelectedLanguage�6.  �� 5P      $��1��6U   $��5��6e   $��3��6r   ��6     *LabelExternalViewerPath+6r   �� 5Q      $��1��6   $��3��6.   $��6��6B   $��2,2,38,2q�6O   ��6a   �� #
 Z $ ExternalViewer��� 5R      -   5        $��btn_browse_file��5R   {   $	��...��6   $��3��6+   $��6��6;   $��35��6H   $��Right=�6T   $��2q�6p   $	��Top=�6�   $��29��6�   6�   �� 5S      $��1��6W   $��7��6g   $��3��6u   $��Center=�6�   ��6     *LabelUseExternalViewer+ d� 	IsChecked 6�   �� #
 Z $ UseExternalViewer�6�   �� 5T      $��1��6   $��3��6.   $��9��6B   $��2,2,38,2q�6�   ��6O   �� #
 Z $ ExternalViewerPath�6�   �� 5U      -   5        $��button4��5U   {   $	��...��6   $��3��6+   $��9��6;   $��33��6H   $��Right=�6T   $��2q�6p   $	��Top=�6�   $��28��6�   6�   �� 5V      $��1��6X   $��8��6h   $��3��6u   ��6     *LabelExternalPreViewerPath+6u   �� 5W      $��1��6X   $��10��6h   $��3��6v   ��6     *LabelExternalPreViewerArgs+6v   �� 5X      $��1��6   $��3��6.   $��11��6B   $��2q�6�   ��6Q   �� #
 Z $ ExternalViewerArgs�6�   5Y      5Z      �� 5[      ��6     *LabelPreview+.��5\      �� $��10q�6   .+�5]      ��  �� Orientation$ 
Horizontal=�6!   $��3q�6:   .+�5^      �� ��6#     *LabelPlaySound+ 6T   �� #
 Z $ 	PlaySound�5_      �� 5`      $ 
Horizontal=�6!   $��3q�6:   .+�5a      ��  � ToolTip$. (Disable this option if you use Lightroom��6�   ��6#     *LabelAutoPreview+ 6V   �� #
 Z $ AutoPreview�6�   5b      �� 5c      $ 
Horizontal=�6!   $��3q�6:   .+�5d      �� ��6#     *LabelShowFocusPoints+ 6Z   �� #
 Z $ ShowFocusPoints�5e      �� 5f      $ 
Horizontal=�6!   $��3q�6:   .+�5g      �� ��6#     *LabelLowMemoryUsage+ 6Y   �� #
 Z $ LowMemoryUsage�5h      �� 5j      $��3q�6!   .+�5k      �� ��6#     *LabelPreviewAfterCapture+ 6]   �� #
 Z $ Preview��� 5l      $ 
Horizontal=�6%   $��3q�6>   .+�5m      �� ��6$     *LabelPreviewTime+%  Xceed.Wpf.Toolkit.IntegerUpDown  5n      �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 2X�61   $	��100��6=   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 6I   �� #
 Z $ PreviewSeconds�5o      5p      �� 5q      $��3q�6!   .+�5r      �� ��6#     *LabelPreviewInLIveView+ 6[   �� #
 Z $ PreviewLiveViewImage��� 5s      $ 
Horizontal=�6%   $��3q�6>   .+�5t      �� ��6$     *LabelLIveViewImageFreeze+  5u      $ 2X�61      Maximum$	 120X�6=   $	��100��6K    6W   �� #
 Z $ LiveViewFreezeTimeOut�5v      5w      �� 5x      $ 
Horizontal=�6!   $��3q�6:   .+�5y      �� ��6      *LabelRotateImage+�� 5z       6#   �� #
 Z $ RotateIndex�.@�5{      �� ��6+     *LabelRotateNone+�� 5|      ��6+     *LabelRotate90+�� 5}      ��6+     *LabelRotate180+�� 5~      ��6+     *LabelRotate270+5      5�      �� 5�      $ 
Horizontal=�6!   $��3q�6:   .+�5�      �� ��6#     *LabelDontLoadThumbs+ 6X   �� #
 Z $ DontLoadThumbnails�5�      �� 5�      $ 
Horizontal=�6!   $��3q�6:   .+�5�      �� ��6      *LabelFullscrenBack+#	  Xceed.Wpf.Toolkit.ColorPicker	  5�      $	��110��6�    	  SelectedColor 6+   �� #
 Z $ FullScreenColor�6�   5�      5�      5�      �� 5�      ��6     *LabelTriggers+.��5�      �  5�      �� 5�      $
��132* �6(   �� 5�      $
��252* �6(   .+�5�      �� $��Keyboard��6   $	��125��61   $	��Top=�6>   .��5�      �  5�      �� 5�   "   $	��25* �60   .+�5�      �� -	   5        $��
chk_usekey��5�   �   $��16��6a   $
��Left=�6m   $��10,8,0,0q�6�   $	��Top=�6�   ��6'     *LabelUseKeybordToTrigger+ 6�   �� #
 Z $ UseTriggerKey��� 5�      -
   5        $��	checkBox2��5�   o   $	��Alt��6'   $��16��65   $
��Left=�6A   $��	10,32,0,0q�6\   $	��Top=�6�    6�   �� #
 Z $ TriggerKeyAlt�{�6�   ��  �� ElementName$ 
chk_usekey��$ 	IsChecked��� 5�      -   5        $��	checkBox3��5�   p   $
��Ctrl��6'   $��16��66   $
��Left=�6B   $��	83,31,0,0q�6]   $	��Top=�6�    6�   �� #
 Z $ TriggerKeyCtrl�{�6�   �� $ 
chk_usekey��$ 	IsChecked��� 5�      -   5        $��	checkBox4��5�   r   $��Shift��6'   $��16��67   $
��Left=�6C   $��
161,31,0,0q�6^   $	��Top=�6�    6�   �� #
 Z $ TriggerKeyShift�{�6�   �� $ 
chk_usekey��$ 	IsChecked��� 5�      -   5        $��cmb_keys��5�   a   $��23��6'   $
��Left=�63   $��	10,58,0,0q�6N   $	��Top=�6q   $	��111��6�    6�   �� #
 Z $ 
TriggerKey�{�6�   �� $ 
chk_usekey��$ 	IsChecked�5�      5�      �� 5�      $��0,0,0,6q�6N   $��1��6_   ��6     *LabelWebserver+.��5�      �  6     *ReStartToolTip+.+�5�      �� -   5        $��	checkBox1��5�   �   $��16��6Z   $
��Left=�6f   $��	10,14,0,0q�6�   $	��Top=�6�   ��6'     *LabelUseWebserver+ 6�   �� #
 Z $ UseWebserver��� 5�      -   5        $��textBox1��5�   _   $��23��6&   $
��Left=�62   $��6,49,0,0q�6M   $	��Top=�6o   $	��290��6�    �� 
IsReadOnly . ��6�   �� #
 Z $ 
Webaddress�  �� Mode$  OneTime=�9
  3Gma.QrCodeNet.Encoding.Windows.WPF.QrCodeImgControl
  5�      -   5        $��qrcode��5�   �   $	��145��62   $
��Left=�6?   $��6,81,0,0q�6Z   $��Uniform=�6l   $	��Top=�6~   $	��143��6�   6�   5�      5�      5�      5�      �� 5�      ��6     *LabelFocusAndLiveview+.��5�      � $��5q�6    5�      �� 5�      $	��170 �6+   �� 5�      $
��150* �6+    5�      �� 5�      $��5 �6(   �� 5�      $��35 �6(   �� 5�      $��35 �6(   �� 5�      $��35 �6(   �� 5�      $��35 �6(   �� 5�      $��35 �6(   �� 5�      $
��260* �6(   .+�5�      +  %CameraControl.Controls.AdvancedSlider  !   Minimum$! 1��6/   "   Maximum$" 50��6;   $��3��6|   $	��1,0q�6�   $��1��6�   $��0��6  #   Label# 6H     *LabelSmallFocusSstep+$   Value$ 6�   �� #
 Z $ SmalFocusStep�6    5�      $	" 250��6�   $��3��6�   $	��1,0q�6�   $��2��6Q  $��0��6^  ! 6/   �� #
 Z $ SmalFocusStep�# 6�     *LabelMediumFocusStep+$ 6�   �� #
 Z $ MediumFocusStep�6^    5�      $
" 2500��6�   $��3��6�   $	��1,0q�6�   $��3��6Q  $��0��6^  ! 6/   �� #
 Z $ MediumFocusStep�# 6�     *LabelLargFocusStep+$ 6�   �� #
 Z $ LargeFocusStep�6^  �� 5�      $��4��6V   $��Right=�6c   ��6     *LabelMotionDetectionType+6c   �� 5�      $��1��6   $��4��6/   $��3q�6<   ��6G   ��  6_   �� #
 Z $ DetectionType�.@�5�      �� ��6'     *" LabelTwoFramesDifferenceDetector+�� 5�      ��6'     *'%LabelSimpleBackgroundModelingDetector+5�        5�      $! 5��6/   $	" 250��6;   $��3��6   $	��1,0q�6�   $��5��6   $��0��6  # 6I     *LabelSmallestBlockSize+$ 6�   �� #
 Z $ MotionBlockSize�6  5�      5�      �� 5�      ��6     *LabelAdvanced+.��5�      � $��5q�6    5�      �� 5�      $	��170 �6+   �� 5�      $
��150* �6+    5�      �� 5�      $��5 �6(   �� 5�      $��30 �6(   �� 5�      $��30 �6(   �� 5�      $��50 �6(   �� 5�      $��30 �6(   �� 5�      $��30 �6(   �� 5�      $
��260* �6(   .+�5�      �� $��2��6Y   $��0,4,0,1q�6�   $��2��6�   ��6     *LabelUseParellelTransfer+ 6m   �� #
 Z $ UseParallelTransfer�6�   �� 5�      $��2��6_   $��2��6�   ��6     * LabelShowUnTranslatedStringIds+ 6s   �� #
 Z $ ShowUntranslatedLabelId�6�   )  #MahApps.Metro.Controls.ToggleSwitch  5�      % � UseLayoutRounding% .  $��3��6y   $��0��6�   $��3��6�   $a [This option disable special handig of some cameras. Use this if you experience some problem��6  $��1,0,1,1q�6x  &   Header& 6,     *LabelDisableDriver+'   	IsChecked' 6�   �� #
 Z $ DisableNativeDrivers�6x  5�      5�      5�      �� 5�   
   -   5        $��button1��5�   L   ( �� 	IsDefault( . $��75��6[   $��
12,12,0,16q�6f   $��1��6z   $
��Left=�6�   ��6     *
ButtonOk+6�   �� 5�   
   -   5        $��button2��5�   O   ) �� IsCancel) . $��75��6^   $��
0,12,12,16q�6i   $��1��6}   $��Right=�6�   ��6     *ButtonCancel+6�   �� 5�   
   -   5        $��button3��5�   F   $��1��6k   $��115,12,0,16q�6x   $
��Left=�6�   $	��125��6�   ��6     *ButtonLocateLogFile+6�   �� 5�   
   -   5        $��	btn_reset��5�   S   $��1��6F   $��0,12,113,16q�6|   $��Right=�6�   $��97��6�   ��6     *ButtonResetSettings+6�   5�      5�      