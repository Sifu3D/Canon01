   M S B A M L   `   `   `  ���� M  ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core  I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls U QGma.QrCodeNet.Encoding, Version=0.0.1.29147, Culture=neutral, PublicKeyToken=nullwPclr-namespace:Gma.QrCodeNet.Encoding.Windows.WPF;assembly=Gma.QrCodeNet.Encoding"Gma.QrCodeNet.Encoding.Windows.WPF kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation  H DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:CameraControl.ControlsCameraControl.Controls '   !CameraControl.windows.SettingsWnd   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  GCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core  JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  YmyPclr-namespace:Gma.QrCodeNet.Encoding.Windows.WPF;assembly=Gma.QrCodeNet.Encoding  PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  4	Controls1$clr-namespace:CameraControl.Controls  -   $	��506��$	��610��  � WindowStyle$  
ToolWindow=� � WindowStartupLocation$ CenterScreen=�(  "MahApps.Metro.Controls.MetroWindow   ShowMaxRestoreButton .     ShowMinButton .   � Title 7   1CameraControl.Core.Translation.TranslateExtension  *SettingsWindowTitle+ � 	Resources  �� MergedDictionaries �� Source��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�%       WindowCommands +  %MahApps.Metro.Controls.WindowCommands  .@��� -   $��btn_help����  *
ButtonHelp+y��� (   "CameraControl.Core.ServiceProvider	   Branding
 �� Source#
 Z	  �� Path$ OnlineReference�    BooleanToVisibilityConverter �� 	Converter# [  .���  � RowDefinitions �� $
��220* ��� $	��41* �.+��� -   $��tabControl1�� �� TabStripPlacement$
 Left=�.@��� -   $��tabItem1����  *LabelGeneral+.���  � ColumnDefinitions �� $��10 ��� $
��100* ��� $��10 ��� $
��100* ��� $��10 � �� $��10 ��� $��35 ��� $��35 ��� $��20 ��� $��35 ��� $��25 ��� $��35 ��� $��25 ��� $��25 ��� $��35 ��� $��25 ��� $��30 ��� $��30 ��� $	��83* ��� $	��29* �.+��� $��1��$��1��$��Center=���  *
LabelTheme+�� -   $��
cmb_themes��$��1��$��3��$��2q� �� SelectedIndex ��    Settings#
 Z $ CurrentThemeIndex�.@��� $��	Dark/Blue���� $��
Dark/Green���� $��Dark/Orange���� $��Dark/Purple���� $��Dark/Red���� $��
Light/Blue���� $��Light/Green���� $��Light/Orange���� $��Light/Purple���� $��	Light/Red���� $��2��$��1��$��Center=���  *LabelMainWindow+�� -   $��cmb_mainwindow��$��2��$��3��$��2q� �� SelectedItem �� #
 Z $ SelectedMainForm��� $��4��$��1����  *LabelInterfaceLanguage+��  �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Value��$��4��$��3��$��2q����� 7   1CameraControl.Core.Translation.TranslationManager   AvailableLangs#
 Z  �� SelectedValue �� #
 Z $ SelectedLanguage��� $��1��$��5��$��3����  *LabelExternalViewerPath+�� $��1��$��3��$��6��$��2,2,38,2q����� #
 Z $ ExternalViewer��� -   $��btn_browse_file��$	��...��$��3��$��6��$��35��$��Right=�$��2q�$	��Top=�$��29���� $��1��$��7��$��3��$��Center=���  *LabelUseExternalViewer+ d� 	IsChecked �� #
 Z $ UseExternalViewer��� $��1��$��3��$��9��$��2,2,38,2q����� #
 Z $ ExternalViewerPath��� -   $��button4��$	��...��$��3��$��9��$��33��$��Right=�$��2q�$	��Top=�$��28���� $��1��$��8��$��3����  *LabelExternalPreViewerPath+�� $��1��$��10��$��3����  *LabelExternalPreViewerArgs+�� $��1��$��3��$��11��$��2q����� #
 Z $ ExternalViewerArgs��� ��  *LabelPreview+.���� $��10q�.+���  �� Orientation$ 
Horizontal=�$��3q�.+��� ��  *LabelPlaySound+ �� #
 Z $ 	PlaySound��� $ 
Horizontal=�$��3q�.+���  � ToolTip$. (Disable this option if you use Lightroom����  *LabelAutoPreview+ �� #
 Z $ AutoPreview��� $ 
Horizontal=�$��3q�.+��� ��  *LabelShowFocusPoints+ �� #
 Z $ ShowFocusPoints��� $ 
Horizontal=�$��3q�.+��� ��  *LabelLowMemoryUsage+ �� #
 Z $ LowMemoryUsage��� $��3q�.+��� ��  *LabelPreviewAfterCapture+ �� #
 Z $ Preview��� $ 
Horizontal=�$��3q�.+��� ��  *LabelPreviewTime+%  Xceed.Wpf.Toolkit.IntegerUpDown  �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 2X�$	��100���  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value �� #
 Z $ PreviewSeconds��� $��3q�.+��� ��  *LabelPreviewInLIveView+ �� #
 Z $ PreviewLiveViewImage��� $ 
Horizontal=�$��3q�.+��� ��  *LabelLIveViewImageFreeze+  $ 2X�   Maximum$	 120X�$	��100�� �� #
 Z $ LiveViewFreezeTimeOut��� $ 
Horizontal=�$��3q�.+��� ��  *LabelRotateImage+��  �� #
 Z $ RotateIndex�.@��� ��  *LabelRotateNone+�� ��  *LabelRotate90+�� ��  *LabelRotate180+�� ��  *LabelRotate270+�� $ 
Horizontal=�$��3q�.+��� ��  *LabelDontLoadThumbs+ �� #
 Z $ DontLoadThumbnails��� $ 
Horizontal=�$��3q�.+��� ��  *LabelFullscrenBack+#	  Xceed.Wpf.Toolkit.ColorPicker	  $	��110�� 	  SelectedColor �� #
 Z $ FullScreenColor��� ��  *LabelTriggers+.���  �� $
��132* ��� $
��252* �.+��� $��Keyboard��$	��125��$	��Top=�.���  �� $	��25* �.+��� -	   $��
chk_usekey��$��16��$
��Left=�$��10,8,0,0q�$	��Top=���  *LabelUseKeybordToTrigger+ �� #
 Z $ UseTriggerKey��� -
   $��	checkBox2��$	��Alt��$��16��$
��Left=�$��	10,32,0,0q�$	��Top=� �� #
 Z $ TriggerKeyAlt�{���  �� ElementName$ 
chk_usekey��$ 	IsChecked��� -   $��	checkBox3��$
��Ctrl��$��16��$
��Left=�$��	83,31,0,0q�$	��Top=� �� #
 Z $ TriggerKeyCtrl�{��� $ 
chk_usekey��$ 	IsChecked��� -   $��	checkBox4��$��Shift��$��16��$
��Left=�$��
161,31,0,0q�$	��Top=� �� #
 Z $ TriggerKeyShift�{��� $ 
chk_usekey��$ 	IsChecked��� -   $��cmb_keys��$��23��$
��Left=�$��	10,58,0,0q�$	��Top=�$	��111�� �� #
 Z $ 
TriggerKey�{��� $ 
chk_usekey��$ 	IsChecked��� $��0,0,0,6q�$��1����  *LabelWebserver+.���    *ReStartToolTip+.+��� -   $��	checkBox1��$��16��$
��Left=�$��	10,14,0,0q�$	��Top=���  *LabelUseWebserver+ �� #
 Z $ UseWebserver��� -   $��textBox1��$��23��$
��Left=�$��6,49,0,0q�$	��Top=�$	��290�� �� 
IsReadOnly . ���� #
 Z $ 
Webaddress�  �� Mode$  OneTime=�9
  3Gma.QrCodeNet.Encoding.Windows.WPF.QrCodeImgControl
  -   $��qrcode��$	��145��$
��Left=�$��6,81,0,0q�$��Uniform=�$	��Top=�$	��143���� ��  *LabelFocusAndLiveview+.��� $��5q� �� $	��170 ��� $
��150* � �� $��5 ��� $��35 ��� $��35 ��� $��35 ��� $��35 ��� $��35 ��� $
��260* �.+�+  %CameraControl.Controls.AdvancedSlider  !   Minimum$! 1��"   Maximum$" 50��$��3��$	��1,0q�$��1��$��0��#   Label#   *LabelSmallFocusSstep+$   Value$ �� #
 Z $ SmalFocusStep�  $	" 250��$��3��$	��1,0q�$��2��$��0��! �� #
 Z $ SmalFocusStep�#   *LabelMediumFocusStep+$ �� #
 Z $ MediumFocusStep�  $
" 2500��$��3��$	��1,0q�$��3��$��0��! �� #
 Z $ MediumFocusStep�#   *LabelLargFocusStep+$ �� #
 Z $ LargeFocusStep��� $��4��$��Right=���  *LabelMotionDetectionType+�� $��1��$��4��$��3q�����  �� #
 Z $ DetectionType�.@��� ��  *" LabelTwoFramesDifferenceDetector+�� ��  *'%LabelSimpleBackgroundModelingDetector+  $! 5��$	" 250��$��3��$	��1,0q�$��5��$��0��#   *LabelSmallestBlockSize+$ �� #
 Z $ MotionBlockSize��� ��  *LabelAdvanced+.��� $��5q� �� $	��170 ��� $
��150* � �� $��5 ��� $��30 ��� $��30 ��� $��50 ��� $��30 ��� $��30 ��� $
��260* �.+��� $��2��$��0,4,0,1q�$��2����  *LabelUseParellelTransfer+ �� #
 Z $ UseParallelTransfer��� $��2��$��2����  * LabelShowUnTranslatedStringIds+ �� #
 Z $ ShowUntranslatedLabelId�)  #MahApps.Metro.Controls.ToggleSwitch  % � UseLayoutRounding% .  $��3��$��0��$��3��$a [This option disable special handig of some cameras. Use this if you experience some problem��$��1,0,1,1q�&   Header&   *LabelDisableDriver+'   	IsChecked' �� #
 Z $ DisableNativeDrivers��� -   $��button1��( �� 	IsDefault( . $��75��$��
12,12,0,16q�$��1��$
��Left=���  *
ButtonOk+�� -   $��button2��) �� IsCancel) . $��75��$��
0,12,12,16q�$��1��$��Right=���  *ButtonCancel+�� -   $��button3��$��1��$��115,12,0,16q�$
��Left=�$	��125����  *ButtonLocateLogFile+�� -   $��	btn_reset��$��1��$��0,12,113,16q�$��Right=�$��97����  *ButtonResetSettings+