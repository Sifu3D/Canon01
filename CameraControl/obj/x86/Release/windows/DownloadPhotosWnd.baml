   M S B A M L   `   `   `  ���� I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullkHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation cDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes Z=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.MetroMahApps.Metro.Behaviours   CameraControl-   'CameraControl.windows.DownloadPhotosWnd   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     VTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core     `TranslationHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core     XClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core     c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  N
behaviours=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.Metro  X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  -     � Title$  Download photos��$	��593��$	��833�� � 	Resources  �� MergedDictionaries �� Source �� DataType)  #CameraControl.Core.Classes.FileItem �� CornerRadius �� Path � ToolTip �� Orientation	 d� 	IsChecked   ContainerStyle
 �� 
TargetType �� Property �� Value 9� 
IsExpanded��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�%[  (��       *, +)&	  �     �� "  .R��� .+��� 
���   �$��2q�$ 5��$��6q�._��� $��Uniform=�$	��120��$��80������ $ 	Thumbnail� �� $ ToolTip��� $ 
Horizontal=�.+��� 	 �� $ 	IsChecked��� $��Center=����� $
 Name��� "
 ��.���  � �� �� .R�9�  . ���� $
 Name�.���� .  (System.Windows.Interactivity.Interaction   	Behaviors 7   1MahApps.Metro.Behaviours.BorderlessWindowBehavior     ResizeWithGrip . (   "MahApps.Metro.Controls.MetroWindow   WindowCommands +   %MahApps.Metro.Controls.WindowCommands  .@��� -   $��btn_help��$
��Help��.���  � RowDefinitions �� $
��429* ��� $	��125 �.+��� -   $��	lst_items�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle# [  ���� .R��� .+��� 
���   �$��2q�$ 5��$��6q�._��� $��Uniform=�$	��120��$��80������ $ 	Thumbnail� �� $ ToolTip��� $ 
Horizontal=�.+��� 	 �� $ 	IsChecked��� $��Center=����� $
 Name����� .R�� �� -   $��btn_download��$��1��$��23��$��	0,0,12,11q�$��Bottom=�$��Right=�$��75����7  1CameraControl.Core.Translation.TranslateExtension  *LabelDownload+�� -   $��
chk_delete��$��1��$��Right=�$��0,0,7,66q�$	��161��$��16��$��Bottom=���  *LabelDeleteFilesAfterTransfer+�� -   $��	groupBox1��$��	Selection��$	��120��$
��Left=�$	��Top=�$	��391��$��1��$��5,5,0,0q�.���  � ColumnDefinitions �� $
��111* ��� $	��73* ��� $	��83* ��� $
��106* � �� $	��30* ��� $	��30* �.+��� -   $��btn_all��$	��All��$��23��$
��Left=�$��13,7,0,0q�$	��Top=�$��75���� -   $��btn_none��$
��None��$��1��$��23��$
��Left=�$��13,2,0,0q�$	��Top=�$��75���� -	   $��
btn_invert��$��Invert��$��23��$
��Left=�$��	111,2,0,0q�$	��Top=�$��75��$��2��$��1���� -
   $��label1��$��Index:��$��1��$��2��$��28��$
��Left=�$��8,7,0,0q�$	��Top=��� -   $��
btn_select��$��Select��$��3��$��23��$
��Left=�$��27,7,0,0q�$	��Top=�$��75���� -   $��txt_indx��$��2��$��23��$
��Left=�$��8,6,0,0q�$	��Top=�$��76��$��Right=��� -   $��
chk_format��$��Format all camera cards��$��1��$��16��$��Right=�$��	0,0,22,47q�$��Bottom=��� -   $��button1��$��Reload��$��1��$��23��$��Right=�$��	0,0,93,12q�$��Bottom=�$��75��