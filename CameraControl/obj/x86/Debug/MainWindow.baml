   M S B A M L   `   `   `  ����H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:CameraControlCameraControl  5   :   ?$clr-namespace:CameraControl.ControlsCameraControl.Controls  5   	   M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullcDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes 5   	   S<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core 5   	   =#clr-namespace:CameraControl.ClassesCameraControl.Classes  5      I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5	      Z=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.MetroMahApps.Metro.Behaviours 5      kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5          CameraControl.MainWindow   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   *myclr-namespace:CameraControl     5   :   6local$clr-namespace:CameraControl.Controls     5   	   XClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core     5   	   MCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core     5   	   9	myClasess#clr-namespace:CameraControl.Classes     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5	      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5
      N
Behaviours=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.Metro  5      PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      -   5        $��Window��5   �     � Title$  digiCamControl��5   	   $	��768��6    $
��1024��6-    � Icon$. (/CameraControl;component/Images/logo.png��5   H    � WindowState$ 	Maximized=�6x   $��Center=�6�   .  (System.Windows.Interactivity.Interaction   	Behaviors 5      7  1MahApps.Metro.Behaviours.BorderlessWindowBehavior  5   
    � 	Resources 5       �� MergedDictionaries �� Source !  BooleanToVisibilityConverter1�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $ Resources/Icons.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %   &	        �� 5       6+   5!      (  "MahApps.Metro.Controls.MetroWindow   WindowCommands 5#      +  %MahApps.Metro.Controls.WindowCommands  5$   
   .@�5%      �� -   5        $��btn_settings��5%   F   ��6   7  1CameraControl.Core.Translation.TranslateExtension  *SettingsToolTip+6Z   �� 5&      -   5        $��btn_menu��5&   @   ��6     *	LabelMenu+6P   �� 5'      -   5        $��btn_help��5'   A   ��6     *
ButtonHelp+y�6h   �� (  "CameraControl.Core.ServiceProvider   Branding	 �� Source#	 Z 
 �� Path$
 OnlineReference� �� 	Converter# [  �� 5(      -   5        $��
btn_donate��5(   A   ��6     *
MenuDonate+y�6l   �� #	 Z $
 OnlineReference�# [  56       � DataContext 58      )  #CameraControl.Core.Classes.Settings  59   
      Flyouts 5>   
   #  MahApps.Metro.Controls.Flyout     Position$ Right=�6D    J� Opacity$	 0.9Q�6U      IsOpen .     Header 6     *	LabelMenu+.��5?      �� .+�5@      o� $	��Top=�6   $
��Left=�6,   ��5A      �� 5B      .R�5C      $�  $� Orientation$ Vertical=�61   5D      .@�5G      m� ��6     *
MenuLayout+��5H      �� 5I      .R�5J      $� $ 
Horizontal=�65   5K      .@�5M      m� -   5        ��5M        *MenuLayoutNormal+6P   m� 5N      -   5        ��5N        *MenuLayoutGridRight+6S   m� 5O      -   5        ��5O        *MenuLayoutGrid+6N   5P      m� 5Q      ��6     *MenuPresets+{�6G   ��    DeviceManager#	 Z $&
  SelectedCameraDevice.IsConnected���5R      �� 5S      .R�5T      $� $ 
Horizontal=�65   5U      .@�5X      m� ��6     *MenuPresetsLoad+��6O   ��    Settings#	 Z $
 CameraPresets���5Y      �� 5Z      .R�5[   "   m� ��6+   �� $

 Name� m� Command 5\   '   �� $
 SelectPresetCommand� �� RelativeSource �� *FindAncestor+ �� AncestorType$ my:MainWindowL� �� AncestorLevel$ 1�� m� CommandParameter 5]   '   �� 5^      5`      m� 5a      -	   5        ��5a        *MenuPresetsSave+6O   m� 5b      -
   5        ��5b        *MenuPresetsEdit+6O   5c      m� 5d      ��6     *
MenuHelp+y�6H   �� #	 Z $
 OnlineReference�# [  ��5e      �� 5f      .R�5g      $� $ 
Horizontal=�65   5h      .@�5j      m� -   5        ��5j   #     *MenuHomePage+y�6g   �� #	 Z $
 OnlineReference�# [  m� 5k      -   5        $��
mnu_update��5k   V   ��6#     *MenuCheckForUpdate+y�6�   �� #	 Z $
 OnlineReference�# [  m� 5l      -   5        $��	mnu_forum��5l   M   ��6#     *	MenuForum+y�6v   �� #	 Z $
 OnlineReference�# [  �� 5m      m� 5n      -   5        $��	mnu_about��5n   M   ��6#     *	MenuAbout+y�6v   �� #	 Z $
 ShowAboutWindow�# [  5o      5p      �� 5q       �� Orientation$ Vertical=�6   .+�5r      9�  9� 
IsExpanded . ��6     *LabelExport+.��5s      �� ��6"   ��    PluginManager#	 Z $
 ExportPlugins���5t      �� 5u   "   .R�5v   &   �� .+�5w   *   �� $��4q�6�   ��61   �� $
 Title���6P   �� $ 
 ExecuteExportPluginCommand� �� *FindAncestor+$ my:MainWindowL�$ 1����6�   �� 6�   5x   '   5y   #   5{      5|      5}      �� 5~      $ Vertical=�6   .+�5      9�  . ��6     *
LabelTools+.��5�      �� ��6"   �� #	 Z $
 ToolPlugins���5�      �� 5�   "   .R�5�   &   �� .+�5�   *   �� $��4q�6�   ��61   �� $
 Title���6P   �� $
 ExecuteToolPluginCommand� �� *FindAncestor+$ my:MainWindowL�$ 1����6�   �� 6�   5�   '   5�   #   5�      5�      5�      5�      5�        5�   
   ���	#9f000000$
 Left=�6f   $	 0.9Q�6v    6     *MenuConnectedCameras+.��5�      � $	��210��6   ��6   ��  �� ElementName$ Window��$
 Height� � RowDefinitions 5�      �� 5�      $��70 �6$   �� 5�      $��* �6$   �� 5�      $��70 �6$   .+�5�      �� .+�5�      �� -   5        $��3q�5�   b   ��6     *MenuMultipleCamera+6b   �� 5�      -   5        $��btn_sort��5�   %   $��30��6   $��30��65   ��5�      �� 5�      $��18��6$   $��18��6/   ��5�      !� 5�   "    j� Stretch$
 Fill=�6.    & "appbar_sort_alphabetical_ascending  !� Visual#  [ 6=   5�      5�      5�      �� 5�      $��Visible=�6   $��0q�6E   $��1��6P   .��5�      �� ! �� ScrollOwner! 5�      �� 5�      .+�5�      �� $��Hidden=�6�   ��6"   �� #	 Z $
 ConnectedDevices�" �� SelectedItem" 6�   �� #	 Z $
 SelectedCameraDevice���5�      �� 5�      .R�5�   &   '	   !CameraControl.Controls.CameraItem	  # 	  CameraDevice# 67   �� $
 .�5�      5�      5�      5�      �� 5�      $��70��6   $��2��6)   5�      5�      5�      .��5�      � $ � ColumnDefinitions$ 5�   
   �� 5�      $	��136 �6   �� 5�      $	��200 �6   �� 5�      $
��454* �6   �� 5�      $	��294 �6    5�   
   �� 5�      $��65 �6   �� 5�      $
��463* �6   �� 5�      $��54 �6   �� 5�      $	��102 �6   �� 5�      $��23 �6   .+�5�   
   � $��1��6   $��3��6   $��1��63   $��4��6@   $��Stretch=�6Q   $��Stretch=�6o   % � ShowGridLines% .  .+�5�      ]� -   5        $��StackLayout��5�      5�      5�      �� 5�   
   $ Vertical=�6   $��2��6,   .+�5�      �� $��Model:��6   �� 5�      ��6   �� #	 Z $%
 SelectedCameraDevice.DeviceName�5�      0
  *MahApps.Metro.Controls.MetroContentControl
  5�   
   -   5        $��toolBar1��5�   ;   $��4��6'   .��5�      � .+�5�      �� -   5        $��button3��5�   [   $��50��6O   $��5q�6�     MetroCircleButtonStyle#���  6  & � ToolTip& 6     *CapturePhotoToolTip+{�6�   �� #	 Z $&
  SelectedCameraDevice.IsConnected�.��5�      �� $��5q�6   $0��*/CameraControl;component/Images/Camera.png��6'   5�      �� 5�      -   5        $��btn_capture_noaf��5�   _   $��50��6S   $��5q�6�   & 6     *CapturePhotoNoAfToolTip+{�6w   �� #	 Z $&
  SelectedCameraDevice.IsConnected�.��5�      � .+�5�      �� $��5q�6    $0��*/CameraControl;component/Images/Camera.png��6+   �� 5�      $
��NoAf��6    $��Center=�6/   $��14(�6S   5�      5�      �� 5�      -   5        $��but_download��5�   Z   $��50��6N   $��50��6n   $��5q�6y   #���  6�   & 6     *DownloadWindowTitle+{�6�   �� #	 Z $&
  SelectedCameraDevice.IsConnected�.��5�      �� $��20��6    $��20��6+   ��5�      !� 5�      $
 Fill=�6*     appbar_download#  [ 69   5�      5�      �� 5�      -   5        $��btn_br��5�   r   $
��[BR]��6   $��50��6Z   $��50��6f   $��5q�6�   $��15(�6  #���  6'  & 6(     *BraketingToolTip+{�6�   �� #	 Z $&
  SelectedCameraDevice.IsConnected�6'  d� 5�      -   5        $��button1��5�   O   $& Image property��6   $��50��68   $��50��6D   $��5q�6u   .��5�      �� $��5q�6   $4��./CameraControl;component/Images/Properties.png��6'   5�      �� 5�      -   5        $��but_timelapse��5�   W   $��50��6K   $��50��6l   $��5q�6w   #���  6�   & 6     *TimeLapseToolTip+.��5�      �� $��20��6    $��20��6+   ��5�      !� 5�      $
 Fill=�6*     appbar_movie_clapper#  [ 69   5�      5�      �� 5�      -   5        $��but_fullscreen��5�   X   $��50��6L   $��50��6n   $��5q�6y   #���  6�   & 6     *FullscreenToolTip+.��5�      �� $��20��6    $��20��6+   ��5�      !� 5�      $
 Fill=�6*     appbar_new_window#  [ 69   5�      5�      �� 5�      -   5        $��btn_liveview��5�   c   $��Lv��6   $��50��6W   $��50��6w   $��5q�6�   $��15(�6X  #���  6f  & 6&     *LiveViewToolTip+��6�   �� '  !CameraControl.Classes.WpfCommands'   ShowLiveViewCommand#	 Z' ��6�   �� #	 Z $
 SelectedCameraDevice�6f  �� 5�      -   5        $��
btn_browse��5�   h   $��B��6   $��50��6\   $��50��6z   $��5q�6�   $��15(�6�   #���  6�   & 6%     *BrowseSessionsToolTip+6�   �� 5�      -   5        $��btn_Tags��5�   g   $
��Tags��6   $��50��6[   $��50��6w   $��5q�6�   $��15(�6�   #���  6�   & 6(     *SelectTagsToolTip+6�   �� 5�      $��Right=�6   {�69   �� $)
 #DefaultSession.TimeLapse.IsDisabled�6z   5�      5�      &    CameraControl.Controls.Controler  5�   
   -   5        (  Name$( 
controler1��5�      $��1��6�   $��2��6  $��3q�6   6.   �� #	 Z {�6�   �� #	 Z $&
  SelectedCameraDevice.IsConnected�6  �� 5�   
   $ Vertical=�6   $��3��6,   .+�5      �� .+�5     �� $��5,1,1,1q�6A   ��6     *	Session+6A   5     �� 5     $ 
Horizontal=�6   .+�5     �� -   5        $��cmb_session��5     $	��150��6�   $��3q�6�   ) �� SelectedValue) 6.   �� $
 DefaultSession���6\   �� $
 PhotoSessions�& 6�   �� $
 DefaultSession.Folder��� 5     -   5        $��btn_add_Sesion��5  U   $��3��6E   $��3q�6k   ��6     *
SessionAdd+6v   �� 5     -    5        $��btn_edit_Sesion��5  V   $��3��6F   $��3q�6m   ��6     *SessionEdit+6x   �� 5     -!   5        $��btn_del_Sesion��5  U   $��3��6E   $��3q�6k   ��6     *
SessionDel+6v   5     5	     )  #MahApps.Metro.Controls.ProgressRing  5
  
   $��Center=�6�   $��Center=�6�   $��
25,24,30,0q�6�   $��3��6�   $��78��6�   $��81��6�   *   IsActive* 6    �� #	 Z $!
 SelectedCameraDevice.IsBusy�6�   �� 5  
   -"   5        $��
btn_getRaw��5  ]   $��3��6D   $��23��6Q   $	��Top=�6o   ��6     *ButtonGetRawCodec+y�6�   �� #	 Z $#
 SelectedBitmap.RawCodecNeeded�# [  + �� ConverterParameter$+ false��5     5     