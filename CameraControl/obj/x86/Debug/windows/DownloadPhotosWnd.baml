   M S B A M L   `   `   `  ����I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullkHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5      kHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5      cDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.CoreCameraControl.Core.Classes 5      Z=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.MetroMahApps.Metro.Behaviours  5	       CameraControl-   'CameraControl.windows.DownloadPhotosWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      VTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core     5      `TranslationHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core     5      XClassesDclr-namespace:CameraControl.Core.Classes;assembly=CameraControl.Core     5      c _System.Windows.Interactivity, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      N
behaviours=clr-namespace:MahApps.Metro.Behaviours;assembly=MahApps.Metro  5	      X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  6h   -   5          � Title$  Download photos��5   j   $	��593��6�   $	��833��6�    � 	Resources 5
       �� MergedDictionaries �� Source �� DataType)  #CameraControl.Core.Classes.FileItem �� CornerRadius �� Path � ToolTip �� Orientation	 d� 	IsChecked   ContainerStyle
 �� 
TargetType �� Property �� Value 9� 
IsExpanded�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %r  (��       5      *, +)&	  �    �� 6   "  6   .R�5      �� .+�5      �� 
���   �$��2q�61   $ 5��6E   $��6q�6V   ._�5      �� $��Uniform=�6c   $	��120��6u   $��80��6�   ��6    �� $ 	Thumbnail� 6B   �� $ ToolTip�6�   5      �� 5      $ 
Horizontal=�6!   .+�5      �� 	 6#   �� $ 	IsChecked��� 5       $��Center=�6>   ��6    �� $
 Name�6>   5!      5"      5$      �� 5%      "
 ��6+   .�5&      ��  � �� 5'      �� 5(      .R�5)      9�  . ��6'   �� $
 Name�.��5*   "   �� 5+      5,      5.      5/      50      .  (System.Windows.Interactivity.Interaction   	Behaviors 53      7   1MahApps.Metro.Behaviours.BorderlessWindowBehavior  54   
      ResizeWithGrip . 6.   (   "MahApps.Metro.Controls.MetroWindow   WindowCommands 57      +   %MahApps.Metro.Controls.WindowCommands  58   
   .@�59      �� -   5        $��btn_help��59   $   $
��Help��6   64   5:      .��5<      �  � RowDefinitions 5=   
   �� 5>      $
��429* �6   �� 5?      $	��125 �6   .+�5B   
   �� -   5        $��	lst_items��5B       �� 
GroupStyle 5C      (  "System.Windows.Controls.GroupStyle  5D         ContainerStyle# [  6   ��5I      �� 5J      .R�5K      �� .+�5L      �� 
���   �$��2q�65   $ 5��6I   $��6q�6Z   ._�5M      �� $��Uniform=�6g   $	��120��6y   $��80��6�   ��6$   �� $ 	Thumbnail� 6F   �� $ ToolTip�5N      5O      �� 5P      $ 
Horizontal=�6%   .+�5Q      �� 	 6'   �� $ 	IsChecked��� 5R      $��Center=�6B   ��6$   �� $
 Name�6B   5S      5T      5U      ��5W      �� 5X      .R�5Y      � 5Z      5\      �� 5]   
   -   5        $��btn_download��5]   v   $��1��6J   $��23��6W   $��	0,0,12,11q�6c   $��Bottom=�6�   $��Right=�6�   $��75��6�   ��6   7  1CameraControl.Core.Translation.TranslateExtension  *LabelDownload+6�   �� 5^   
   -   5        $��
chk_delete��5^   �   $��1��6R   $��Right=�6_   $��0,0,7,66q�6{   $	��161��6�   $��16��6�   $��Bottom=�6�   ��6     *LabelDeleteFilesAfterTransfer+6�   �� 5_   
   -   5        $��	groupBox1��5_   N   $��	Selection��6   $	��120��6&   $
��Left=�63   $	��Top=�6_   $	��391��6w   $��1��6�   $��5,5,0,0q�6�   .��5`      �  � ColumnDefinitions 5a      �� 5b      $
��111* �6'   �� 5c      $	��73* �6'   �� 5d      $	��83* �6'   �� 5e      $
��106* �6'    5g      �� 5h      $	��30* �6$   �� 5i      $	��30* �6$   .+�5k      �� -   5        $��btn_all��5k   `   $	��All��6   $��23��6'   $
��Left=�63   $��13,7,0,0q�6N   $	��Top=�6o   $��75��6�   6�   �� 5l      -   5        $��btn_none��5l   n   $
��None��6   $��1��6(   $��23��65   $
��Left=�6A   $��13,2,0,0q�6\   $	��Top=�6~   $��75��6�   6�   �� 5m      -	   5        $��
btn_invert��5m   d   $��Invert��6   $��23��6*   $
��Left=�66   $��	111,2,0,0q�6Q   $	��Top=�6v   $��75��6�   $��2��6�   $��1��6�   �� 5n      -
   5        $��label1��5n   �   $��Index:��6   $��1��6)   $��2��69   $��28��6J   $
��Left=�6V   $��8,7,0,0q�6q   $	��Top=�6�   �� 5o      -   5        $��
btn_select��5o   s   $��Select��6   $��3��6*   $��23��6:   $
��Left=�6F   $��27,7,0,0q�6a   $	��Top=�6�   $��75��6�   6�   �� 5p      -   5        $��txt_indx��5p   b   $��2��6   $��23��6*   $
��Left=�66   $��8,6,0,0q�6Q   $	��Top=�6r   $��76��6�   $��Right=�6�   5q      5r      �� 5s   
   -   5        $��
chk_format��5s   }   $��Format all camera cards��6   $��1��65   $��16��6B   $��Right=�6N   $��	0,0,22,47q�6j   $��Bottom=�6�   �� 5t   
   -   5        $��button1��5t   j   $��Reload��6   $��1��6"   $��23��6/   $��Right=�6;   $��	0,0,93,12q�6W   $��Bottom=�6y   $��75��6�   6�   5u      5v      