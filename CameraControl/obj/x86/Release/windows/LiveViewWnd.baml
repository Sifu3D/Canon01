   M S B A M L   `   `   `  ���� H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CameraControl.windowsCameraControl.windows  M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls ?$clr-namespace:CameraControl.ControlsCameraControl.Controls  kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation P LCameraControl.Devices, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\Bclr-namespace:CameraControl.Devices;assembly=CameraControl.DevicesCameraControl.Devices '    !CameraControl.windows.LiveViewWnd   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     2my#clr-namespace:CameraControl.windows     X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  :d2http://schemas.microsoft.com/expression/blend/2008  GCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core  JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  0local$clr-namespace:CameraControl.Controls  PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  PDevicesBclr-namespace:CameraControl.Devices;assembly=CameraControl.Devices  -   $	��632��$	��758��(  "MahApps.Metro.Controls.MetroWindow    ShowMinButton  .   � Title 7  1CameraControl.Core.Translation.TranslateExtension  *LiveViewWindowTitle+ � Topmost ��  �� ElementName$ chk_top�� �� Path$ 	IsChecked� � 	Resources  �� MergedDictionaries �� Source��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?��� $ ../Resources/Icons.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�%       WindowCommands +  %MahApps.Metro.Controls.WindowCommands  .@��� -   $��btn_help����  *
ButtonHelp+.��� 	 � RowDefinitions	 �� $	��224 ��� $	��46* ��� $
��303* ��� $	��20* �
 � ColumnDefinitions
 �� $	��200 ��� $
��635* �.+��� -   $��img_preview��$��Uniform=�$��1��$��3������ (  "CameraControl.Core.ServiceProvider   Settings �� Source# Z $! SelectedBitmap.DisplayImage��� -   $��image1��$��Uniform=�$��1��$��3�� J� Opacity �� $ slider_transparent��$ Value��� -   $��canvas��$��1��$��3����Z� .+��� -   $��lbl_rec�� �� Left$ 0��
 �� Top$ 0��$	��REC��$��41��$��20(�$
��Bold"�
���  ��$��52���� -   $��button1��$��23��$
��Left=�$��	12,12,0,0q�$	��Top=�$��75����  *ButtonAutoFocus+�� -   $��button2��$��23��$
��Left=�$��
119,12,0,0q�$	��Top=�$��75����  *ButtonCapture+�� $
��Auto=�$��1��$��2��.����  �� ScrollOwner �� .+�9� $��1q�
���   �$��3q���  *LabelManualFocus+{��� $ IsFree� �� RelativeSource �� *FindAncestor+ �� AncestorType$ my:LiveViewWndL� �� AncestorLevel$ 1����� 
 �� $	��17* ��� $	��13* ��� $	��10* ��� $	��10* ��� $	��13* ��� $	��17* �	 �� $��35 ��� $��35 ��� $	��25* �.+��� -	   $��
btn_focusm��$��1q�$��<��$
��Bold"� � ToolTip$	 -10��$��2��   MetroCircleButtonStyle#���   �� -
   $��
btn_focusp��$��1q�$��>��$��3��$
��Bold"�$ 10��#���   �� -   $��btn_focusmm��$��1q�$��<<��$
��Bold"�$
 -100��$��1��#���   �� -   $��btn_focuspp��$��1q�$��>>��$��4��$
��Bold"�$	 100��#���   �� -   $��btn_focusmmm��$��1q�$	��<<<��$
��Bold"�$
 -500��#���   �� -   $��btn_focusppp��$��1q�$	��>>>��$
��Bold"�$	 500��$��5��#���   �� $��2��$��2��$��1��$��Center=�$��Center=����� $ CounterMessage� �� *FindAncestor+$ my:LiveViewWndL�$ 1��d� $��0��$��1��.���� �� -   $��	btn_movea��$��1q�$��|<��$��1��$��1��#���   {��� $ LockA� �� *FindAncestor+$ my:LiveViewWndL�$ 1��d� $��3q�$��0��$��1�� d� 	IsChecked �� $ LockA� �� *FindAncestor+$ my:LiveViewWndL�$ 1��   OnImage j� Stretch  appbar_lock !� Visual  OffImage  appbar_unlock_keyhole��%|   &	       7  &	 0     7  �� $��15��$��15����!� $
 Fill=�8   �� $��15��$��15����!� $
 Fill=�8   ����  �� 
TargetType" d� �� BasedOn# [Bd� �� Triggers P�  P� Property �@d�	IsChecked P� Value$
 TrueY�. ���  �� Property � �� �� Value# [ P�  �@d�	IsChecked$ FalseY�. ���  � ��# [ �� -   $��	btn_moveb��$��1q�$��>|��$��4��$��1��#���   {��� $ LockB� �� *FindAncestor+$ my:LiveViewWndL�$ 1��d� $��3q�$��5��$��1�� �� $ LockB� �� *FindAncestor+$ my:LiveViewWndL�$ 1��{��� $ LockA� �� *FindAncestor+$ my:LiveViewWndL�$ 1�� ��%|   &	       7  &	 0     7  �� $��15��$��15����!� $
 Fill=�8   �� $��15��$��15����!� $
 Fill=�8   ���� " d�# [Bd� P�  �@d�	IsChecked$
 TrueY�. ���  � ��# [ P�  �@d�	IsChecked$ FalseY�. ���  � ��# [ �� -   $��focus_slider��$��6��$��2�� �� AutoToolTipPlacement$ BottomRight=�  �� TickFrequency$  10Q�! � Maximum! �� $ 
FocusValue� �� *FindAncestor+$ my:LiveViewWndL�$ 1��{��� $ LockB� �� *FindAncestor+$ my:LiveViewWndL�$ 1��9� $��1q�
���   �$��3q���  *LabelFocusStacking+��� 	 �� $��35 ��� $��35 ��� $��35 ��� $��40 ��� $��38 �
 �� $��86 ��� $��5 ��� $	��86* ��� $��5 �.+��� -   $��btn_takephoto��$��3��$��2��$��5q���  *ButtonStart+{���  �� *FindAncestor+'   !CameraControl.windows.LiveViewWnd"  $ IsFree��� -   $��btn_preview��$��2��$��3��$��5q���  *ButtonPreview+{���  �� *FindAncestor+"  $ IsFree��� -   $��btn_stop��$��2��$��4��$��5q���  *
ButtonStop+{���  �� *FindAncestor+"  $ IsBusy�+   %CameraControl.Controls.AdvancedSlider  "   Minimum$" 1��#   Maximum$	# 100��$��4��$   Label$   *LabelNoOfPhots+%   Value% ��  �� *FindAncestor+"  $ PhotoNo�{���  �� *FindAncestor+"  $ IsFree�  $" 1��$
# 1024��$��4��$��1��$   *LabelFocusStep+% ��  �� *FindAncestor+"  $ 	FocusStep�{���  �� *FindAncestor+"  $ IsFree��� -   $��label3��$��28��$
��Left=�$��5,7,0,0q�$	��Top=�$��75��$��4������  �� *FindAncestor+"  $ 
PhotoCount�  $" 2��$# 60��$��4��$��2��$   *LabelWaitTime+% ��  �� *FindAncestor+"  $ WaitTime�{���  �� *FindAncestor+"  $ IsFree�9� $��1q�
���   �$��3q���  *LabelControl+{��� $ IsFree� �� *FindAncestor+$ my:LiveViewWndL�$ 1����&    CameraControl.Controls.Controler  -   &  Name$& 
controler1��$��3q�' � DataContext' �� (   DeviceManager# Z( 9� $��1q�
���   �$��3q���  *LabelDisplay+��� 
 �� $��5 ��� $	��88* ��� $��5 ��� $	��90* ��� $��5 �	 �� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $
��186* �.+��� $��1��$��Center=���  *	LabelGrid+�� $��3��$��3q�) �� SelectedIndex) ��  �� *FindAncestor+"  $ GridType�.@��� ��  *	LabelNone+�� ��  *LabelRuleOfThirds+�� ��  *LabelComboGrid+�� ��  *LabelDiagonal+�� ��  *
LabelSplit+�� -   $��cmb_zoom��$��1��$��3��$��3q�{��� $= 7SelectedPortableDevice.LiveViewImageZoomRatio.IsEnabled� �� *FindAncestor+$ my:LiveViewWndL�$ 1������ $: 4SelectedPortableDevice.LiveViewImageZoomRatio.Values� �� *FindAncestor+$ my:LiveViewWndL�$ 1��* �� SelectedValue* �� $9 3SelectedPortableDevice.LiveViewImageZoomRatio.Value� �� *FindAncestor+$ my:LiveViewWndL�$ 1���� -   $��label1��$��1��$��1��$��2����  *LabelLvZoomRation+�� -   $��	checkBox1��$	��B&W��$��2��$��1��$��Center=� �� $ BlackAndWhite� �� *FindAncestor+$ my:LiveViewWndL�$ 1���� -   $��slider_transparent��$! 1Q�+ � Value$+ 1Q�$��4��$��3��$��1���� -   $��chk_top��$��5��$��1��$��3����  *LabelStayOnTop+�� -   $��label2��$��1��$��3��$��3����  *LabelOpacity+9� $��1q�
���   �$��3q�, 9� 
IsExpanded, . ��  *LabelLuminosity+���� $��1q�
���   �
�������$��4q�$��75��._�� - �� Stretch$
- Fill=�
���   �$	 0.8Q�. � Points. ��  �� *FindAncestor+"  $ LuminanceHistogramPoints�9� $��1q�
���   �$��3q���  *LabelMotionDetection+��� 
 �� $��5 ��� $	��88* ��� $��5 ��� $	��90* ��� $��5 �	 �� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $��30 ��� $
��186* �.+��� -   $��chk_motiondetect��$��1��$��3��$��Center=���  *LabelActivateMotionDetection+�� -   $��chk_tiggeronmotion��$��1��$��2��$��3��$��Center=���  *LabelCaptureWhenMove+�� $��1��$��3����  *LabelThreshold+%  Xceed.Wpf.Toolkit.IntegerUpDown  -   $��upd_threshold��$��3��$��3���	  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]/ 	  Maximum$/ 99X�0 	  Minimum$0 1X��
  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]1 
  Value$1 20X�$��3q��� $��1��$��4����  *LabelWaitMoion+  -    $��upd_movewait��$��3��$��4��$��3q�$0 1X�$
/ 3600X�$1 10X��� -!   $��
lbl_motion��$��3��$��5���� -"   $��chk_autofocus��$��1��$��1��$��3��$��Center=���  *LabelAutofocusBeforeCapture+d� -#   $��23��$
��Left=�$��	12,83,0,0q�$	��Top=�$	��182����  *ButtonFreezeImage+ ��  �� *FindAncestor+"  $ FreezeImage��� -$   $��
btn_record��$��23��$
��Left=�$��	12,51,0,0q�$	��Top=�$	��182����  *ButtonRecordMovie+�� -%   $��canvas_image��$	��104��$
��Left=�$��
32,114,0,0q�$	��Top=�$	��130�����	#FFC7C7C7.+��� -&   $��small_focus_rect��$ 0��$ 0��$��15��
���  ��$��17��}�. �� $��164,114,9,72q����� $	 Fps� �� *FindAncestor+$ my:LiveViewWndL�$ 1��� -'   $��	grid_wait��$��100,0,100,0q�$��1��$��1��$y�Hidden=�.+�� 2 � IsIndeterminate2 . $��20���� $��Center=���  *LabelWaitingForDevice+�� $
��Bold"�$��Right=�$��3��$��1��$��0q����� (  "CameraControl.Devices.StaticHelper3   Instance# Z3 $ SystemMessage�