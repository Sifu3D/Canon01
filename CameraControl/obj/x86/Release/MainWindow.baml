   M S B A M L   `   `   `  ���� H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:CameraControlCameraControl  ?$clr-namespace:CameraControl.ControlsCameraControl.Controls  M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullcDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes S<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core =#clr-namespace:CameraControl.ClassesCameraControl.Classes  I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls Z=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.MetroMahApps.Metro.Behaviours kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation     CameraControl.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     *myclr-namespace:CameraControl     6local$clr-namespace:CameraControl.Controls     XClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core     MCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core     9	myClasess#clr-namespace:CameraControl.Classes     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  N
Behaviours=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.Metro  PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  -   $��Window��  � Title$  digiCamControl��$	��768��$
��1024�� � Icon$. (/CameraControl;component/Images/logo.png�� � WindowState$ 	Maximized=�$��Center=�.  (System.Windows.Interactivity.Interaction   	Behaviors 7  1MahApps.Metro.Behaviours.BorderlessWindowBehavior   � 	Resources  �� MergedDictionaries �� Source !  BooleanToVisibilityConverter1��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $ Resources/Icons.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�%   &	        �� (  "MahApps.Metro.Controls.MetroWindow   WindowCommands +  %MahApps.Metro.Controls.WindowCommands  .@��� -   $��btn_settings����7  1CameraControl.Core.Translation.TranslateExtension  *SettingsToolTip+�� -   $��btn_menu����  *	LabelMenu+�� -   $��btn_help����  *
ButtonHelp+y��� (  "CameraControl.Core.ServiceProvider   Branding	 �� Source#	 Z 
 �� Path$
 OnlineReference� �� 	Converter# [  �� -   $��
btn_donate����  *
MenuDonate+y��� #	 Z $
 OnlineReference�# [   � DataContext )  #CameraControl.Core.Classes.Settings     Flyouts #  MahApps.Metro.Controls.Flyout     Position$ Right=� J� Opacity$	 0.9Q�   IsOpen .     Header   *	LabelMenu+.���� .+�o� $	��Top=�$
��Left=����� .R�$�  $� Orientation$ Vertical=�.@�m� ��  *
MenuLayout+���� .R�$� $ 
Horizontal=�.@�m� -   ��  *MenuLayoutNormal+m� -   ��  *MenuLayoutGridRight+m� -   ��  *MenuLayoutGrid+m� ��  *MenuPresets+{���    DeviceManager#	 Z $&
  SelectedCameraDevice.IsConnected����� .R�$� $ 
Horizontal=�.@�m� ��  *MenuPresetsLoad+����    Settings#	 Z $
 CameraPresets����� .R�m� ���� $

 Name� m� Command �� $
 SelectPresetCommand� �� RelativeSource �� *FindAncestor+ �� AncestorType$ my:MainWindowL� �� AncestorLevel$ 1�� m� CommandParameter �� m� -	   ��  *MenuPresetsSave+m� -
   ��  *MenuPresetsEdit+m� ��  *
MenuHelp+y��� #	 Z $
 OnlineReference�# [  ���� .R�$� $ 
Horizontal=�.@�m� -   ��  *MenuHomePage+y��� #	 Z $
 OnlineReference�# [  m� -   $��
mnu_update����  *MenuCheckForUpdate+y��� #	 Z $
 OnlineReference�# [  m� -   $��	mnu_forum����  *	MenuForum+y��� #	 Z $
 OnlineReference�# [  �� m� -   $��	mnu_about����  *	MenuAbout+y��� #	 Z $
 ShowAboutWindow�# [  ��  �� Orientation$ Vertical=�.+�9�  9� 
IsExpanded . ��  *LabelExport+.���� ����    PluginManager#	 Z $
 ExportPlugins����� .R��� .+��� $��4q����� $
 Title����� $ 
 ExecuteExportPluginCommand� �� *FindAncestor+$ my:MainWindowL�$ 1������ �� $ Vertical=�.+�9�  . ��  *
LabelTools+.���� ���� #	 Z $
 ToolPlugins����� .R��� .+��� $��4q����� $
 Title����� $
 ExecuteToolPluginCommand� �� *FindAncestor+$ my:MainWindowL�$ 1������   ���	#9f000000$
 Left=�$	 0.9Q�   *MenuConnectedCameras+.��� $	��210������  �� ElementName$ Window��$
 Height� � RowDefinitions �� $��70 ��� $��* ��� $��70 �.+��� .+��� -   $��3q���  *MenuMultipleCamera+�� -   $��btn_sort��$��30��$��30������ $��18��$��18����!�  j� Stretch$
 Fill=� & "appbar_sort_alphabetical_ascending  !� Visual#  [ �� $��Visible=�$��0q�$��1��.���� ! �� ScrollOwner! �� .+��� $��Hidden=����� #	 Z $
 ConnectedDevices�" �� SelectedItem" �� #	 Z $
 SelectedCameraDevice����� .R�'	   !CameraControl.Controls.CameraItem	  # 	  CameraDevice# �� $
 .��� $��70��$��2��.��� $ � ColumnDefinitions$ �� $	��136 ��� $	��200 ��� $
��454* ��� $	��294 � �� $��65 ��� $
��463* ��� $��54 ��� $	��102 ��� $��23 �.+�� $��1��$��3��$��1��$��4��$��Stretch=�$��Stretch=�% � ShowGridLines% .  .+�]� -   $��StackLayout���� $ Vertical=�$��2��.+��� $��Model:���� ���� #	 Z $%
 SelectedCameraDevice.DeviceName�0
  *MahApps.Metro.Controls.MetroContentControl
  -   $��toolBar1��$��4��.��� .+��� -   $��button3��$��50��$��5q�  MetroCircleButtonStyle#���  & � ToolTip&   *CapturePhotoToolTip+{��� #	 Z $&
  SelectedCameraDevice.IsConnected�.���� $��5q�$0��*/CameraControl;component/Images/Camera.png���� -   $��btn_capture_noaf��$��50��$��5q�&   *CapturePhotoNoAfToolTip+{��� #	 Z $&
  SelectedCameraDevice.IsConnected�.��� .+��� $��5q�$0��*/CameraControl;component/Images/Camera.png���� $
��NoAf��$��Center=�$��14(��� -   $��but_download��$��50��$��50��$��5q�#���  &   *DownloadWindowTitle+{��� #	 Z $&
  SelectedCameraDevice.IsConnected�.���� $��20��$��20����!� $
 Fill=�  appbar_download#  [ �� -   $��btn_br��$
��[BR]��$��50��$��50��$��5q�$��15(�#���  &   *BraketingToolTip+{��� #	 Z $&
  SelectedCameraDevice.IsConnected�d� -   $��button1��$& Image property��$��50��$��50��$��5q�.���� $��5q�$4��./CameraControl;component/Images/Properties.png���� -   $��but_timelapse��$��50��$��50��$��5q�#���  &   *TimeLapseToolTip+.���� $��20��$��20����!� $
 Fill=�  appbar_movie_clapper#  [ �� -   $��but_fullscreen��$��50��$��50��$��5q�#���  &   *FullscreenToolTip+.���� $��20��$��20����!� $
 Fill=�  appbar_new_window#  [ �� -   $��btn_liveview��$��Lv��$��50��$��50��$��5q�$��15(�#���  &   *LiveViewToolTip+���� '  !CameraControl.Classes.WpfCommands'   ShowLiveViewCommand#	 Z' ���� #	 Z $
 SelectedCameraDevice��� -   $��
btn_browse��$��B��$��50��$��50��$��5q�$��15(�#���  &   *BrowseSessionsToolTip+�� -   $��btn_Tags��$
��Tags��$��50��$��50��$��5q�$��15(�#���  &   *SelectTagsToolTip+�� $��Right=�{��� $)
 #DefaultSession.TimeLapse.IsDisabled�&    CameraControl.Controls.Controler  -   (  Name$( 
controler1��$��1��$��2��$��3q� �� #	 Z {��� #	 Z $&
  SelectedCameraDevice.IsConnected��� $ Vertical=�$��3��.+��� .+��� $��5,1,1,1q���  *	Session+�� $ 
Horizontal=�.+��� -   $��cmb_session��$	��150��$��3q�) �� SelectedValue) �� $
 DefaultSession����� $
 PhotoSessions�& �� $
 DefaultSession.Folder��� -   $��btn_add_Sesion��$��3��$��3q���  *
SessionAdd+�� -    $��btn_edit_Sesion��$��3��$��3q���  *SessionEdit+�� -!   $��btn_del_Sesion��$��3��$��3q���  *
SessionDel+)  #MahApps.Metro.Controls.ProgressRing  $��Center=�$��Center=�$��
25,24,30,0q�$��3��$��78��$��81��*   IsActive* �� #	 Z $!
 SelectedCameraDevice.IsBusy��� -"   $��
btn_getRaw��$��3��$��23��$	��Top=���  *ButtonGetRawCodec+y��� #	 Z $#
 SelectedBitmap.RawCodecNeeded�# [  + �� ConverterParameter$+ false��