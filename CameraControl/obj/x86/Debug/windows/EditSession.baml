   M S B A M L   `   `   `  ����I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullcDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes 5      kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5       CameraControl'   !CameraControl.windows.EditSession   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  6�   JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      RClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core  5      PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      -   5        $	��317��5   r   $	��374��6     � 
ResizeMode$  NoResize=�6�    � WindowStartupLocation$ CenterScreen=�5       � Topmost .  � Title 5   @   7  1CameraControl.Core.Translation.TranslateExtension  *SessionWindowTitle+ � DataContext 5      -  'CameraControl.Core.Classes.PhotoSession  5	   
    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $e _pack://application:,,,/MahApps.Metro;component/Styles/Controls.AnimatedSingleRowTabControl.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %    5      (   "MahApps.Metro.Controls.MetroWindow   WindowCommands 5      +   %MahApps.Metro.Controls.WindowCommands  5   
   .@�5      �� -   5        $��btn_help��5   A   ��6     *
ButtonHelp+6Q   5      .��5       � 	 � RowDefinitions	 5!   
   �� 5"      $
��232* �6   �� 5#      $	��46* �6   .+�5%   
   �� .@�5&      �� ��6     *LabelGeneral+.��5'      �� $��5q�6   .+�5(      �� 
 �� Orientation$
 
Horizontal=�6!   .+�5)      �� $	��120��6Q   $��Right=�6]   ��6      *LabelSessonName+6]   �� 5*      $	��200��6=   ��6"   ��  �� Path$
 Name�6=   5+      �� 5,      $
 
Horizontal=�6!   .+�5-      �� $	��120��6M   $��Right=�6Y   ��6      *LabelFolder+6Y   �� 5.      $	��190��6?   ��6"   �� $ Folder�6?   �� 5/      -   5        $��
btn_browse��5/   !   $�� ... ��63   6C   50      �� 51      $
 
Horizontal=�6!   .+�52      �� $	��120��6W   $��Right=�6c   ��6      *LabelFileNameTemplate+6c   �� 53      $	��200��6I   ��6"   �� $ FileNameTemplate� � ToolTip 6U     *LabelFileNameTemplateToolTip+54      �� 55      $
 
Horizontal=�6!   .+�56      �� $	��120��6N   $��Right=�6Z   ��6      *LabelCounter+6Z   %  Xceed.Wpf.Toolkit.IntegerUpDown  57      $	��200��6L   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 0X�6X   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 6-   �� $ Counter�6X   58      �� 59      $
 
Horizontal=�6!   .+�5:      �� ��6#     *LabelUseOriginal+ 6U     *LabelUseOriginalToolTip+ d� 	IsChecked 6�   �� $ UseOriginalFilename�5;      �� 5<      $
 
Horizontal=�6!   .+�5=      �� $  ��6Z   ��6#     *LabelAlowFolderChange+ 6e   �� $ AlowFolderChange�5>      �� 5?      $
 
Horizontal=�6!   .+�5@      �� $  ��6Z   ��6#     *LabelUseCameraCounter+ 6e   �� $ UseCameraCounter�5A      5B      5C      �� 5D      ��6     *	LabelTags+.��5E      �  � ColumnDefinitions 5F      �� 5G      $	��250 �6+   �� 5H      $	��100 �6+   .+�5J      �� -   5        $��lst_tags��5J      $��3q�6.   ��69   �� $
 Tags��� 5K      -   5        $��btn_add_tag��5K   x   $��1��6H   $��23��6X   $��
20,40,20,0q�6d   $	��Top=�6�   ��6     *	ButtonAdd+6�   �� 5L      -   5        $��btn_del_tag��5L   {   $��1��6K   $��23��6[   $��
20,80,20,0q�6g   $	��Top=�6�   ��6     *ButtonDelete+6�   �� 5M      -   5        $��btn_edit_tag��5M   z   $��1��6I   $��23��6Y   $��20,120,20,0q�6e   $	��Top=�6�   ��6     *
ButtonEdit+6�   5N      5O      5P      �� 5Q   
   -   5        $��button1��5Q   v   $��1��6;   $
��Left=�6H   $��	12,0,0,12q�6c   $��75��6�   $��23��6�   $��Bottom=�6�    �� 	IsDefault . ��6     *
ButtonOk+6�   �� 5R   
   -	   5        $��button2��5R   _   $��1��6?   $��	0,0,12,12q�6L   $��Right=�6n   $��75��6�   $��23��6�   $��Bottom=�6�    �� IsCancel . ��6     *ButtonCancel+6�   5S      5T      