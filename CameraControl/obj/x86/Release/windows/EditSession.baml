   M S B A M L   `   `   `  ���� I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullcDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation  CameraControl'   !CameraControl.windows.EditSession   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  JControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  RClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core  PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  -   $	��317��$	��374��  � 
ResizeMode$  NoResize=� � WindowStartupLocation$ CenterScreen=� � Topmost .  � Title 7  1CameraControl.Core.Translation.TranslateExtension  *SessionWindowTitle+ � DataContext -  'CameraControl.Core.Classes.PhotoSession   � 	Resources  �� MergedDictionaries �� Source��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $e _pack://application:,,,/MahApps.Metro;component/Styles/Controls.AnimatedSingleRowTabControl.xaml?��� $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�%    (   "MahApps.Metro.Controls.MetroWindow   WindowCommands +   %MahApps.Metro.Controls.WindowCommands  .@��� -   $��btn_help����  *
ButtonHelp+.��� 	 � RowDefinitions	 �� $
��232* ��� $	��46* �.+��� .@��� ��  *LabelGeneral+.���� $��5q�.+��� 
 �� Orientation$
 
Horizontal=�.+��� $	��120��$��Right=���  *LabelSessonName+�� $	��200������  �� Path$
 Name��� $
 
Horizontal=�.+��� $	��120��$��Right=���  *LabelFolder+�� $	��190������ $ Folder��� -   $��
btn_browse��$�� ... ���� $
 
Horizontal=�.+��� $	��120��$��Right=���  *LabelFileNameTemplate+�� $	��200������ $ FileNameTemplate� � ToolTip   *LabelFileNameTemplateToolTip+�� $
 
Horizontal=�.+��� $	��120��$��Right=���  *LabelCounter+%  Xceed.Wpf.Toolkit.IntegerUpDown  $	��200���  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 0X��  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value �� $ Counter��� $
 
Horizontal=�.+��� ��  *LabelUseOriginal+   *LabelUseOriginalToolTip+ d� 	IsChecked �� $ UseOriginalFilename��� $
 
Horizontal=�.+��� $  ����  *LabelAlowFolderChange+ �� $ AlowFolderChange��� $
 
Horizontal=�.+��� $  ����  *LabelUseCameraCounter+ �� $ UseCameraCounter��� ��  *	LabelTags+.���  � ColumnDefinitions �� $	��250 ��� $	��100 �.+��� -   $��lst_tags��$��3q����� $
 Tags��� -   $��btn_add_tag��$��1��$��23��$��
20,40,20,0q�$	��Top=���  *	ButtonAdd+�� -   $��btn_del_tag��$��1��$��23��$��
20,80,20,0q�$	��Top=���  *ButtonDelete+�� -   $��btn_edit_tag��$��1��$��23��$��20,120,20,0q�$	��Top=���  *
ButtonEdit+�� -   $��button1��$��1��$
��Left=�$��	12,0,0,12q�$��75��$��23��$��Bottom=� �� 	IsDefault . ��  *
ButtonOk+�� -	   $��button2��$��1��$��	0,0,12,12q�$��Right=�$��75��$��23��$��Bottom=� �� IsCancel . ��  *ButtonCancel+