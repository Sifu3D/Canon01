   M S B A M L   `   `   `  ����M  ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core  5   	   I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5       CameraControl'   !CameraControl.windows.PropertyWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   MCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core     5   	   Oontrols;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      -   5          � Title$  Image Propert��5   	   $	��322��6   $	��522��6,    � ShowInTaskbar .   � Topmost .  � WindowStyle$
 None=�6]    � AllowsTransparency . 
������ (  "MahApps.Metro.Controls.MetroWindow   ShowMaxRestoreButton .   � DataContext 5      (   "CameraControl.Core.ServiceProvider  5   
    � 	Resources 5
       �� MergedDictionaries	 �� Source   WindowFrameBrush
 �� 
StartPoint �� EndPoint � Color � Offset �� 
TargetType �� Property �� Value �� Path � Orientation�� 5   
    5      �� 5      $H	 Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F	 @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I	 Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $H	 Bpack://application:,,,/MahApps.Metro;component/Styles/VS/Menu.xaml?�6%   �� 5      $M	 Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R	 Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %�  &	        '�� �     �� 5      $
 0,0.5&�6;   $ 1,0.5&�6N   .��5      � $ 	CadetBlue��6   $	 0.4Q�61   � 5      $
 Gray��6   $ 1Q�6,   5      �� 5      " ��6   .�5      ��  � �� 5       �� 5!      .R�5"      �� .+�5#   "   �� $
��Bold"�6F   ��6(   �� $
 Name�6F   �� 5$   "   ��6(   �� $ Value�5%      5&      5(      �� 5*       � �� 5+      �� 5,      .R�5-      � $ Vertical=�6(   5.      50      51      52      .��54      �� ���	#68000000 �� CornerRadius$ 5��6$   #��[  65   $��2,0,2,2q�6e   ._�55   
   �  � ColumnDefinitions 56      �� 57      $
��250* �6#   �� 58      $
��250* �6#    � RowDefinitions 5:      �� 5;      $
��150* �6    �� 5<      $
��150* �6    .+�5A      �� $��2��6n   $��2q�6   $��Hidden=�6�   ��6   �� $&  Settings.SelectedBitmap.Metadata���6X   Z� 6�   �� 5C      $��1��6   $��
Luminosity��6'   $��0q�6;   .��5D      �� $��1q�6   
���   �
�������._�5E      �  �� Stretch$
 Fill=�6g   
���   � J� Opacity$	 0.8Q�6�    � Points 6   �� $6 0Settings.SelectedBitmap.LuminanceHistogramPoints�6�   5F      5G      �� 5H      $��1��6   $��1��6'   $��Color��64   $��0q�6C   .��5I      �� $��1q�6   
���   �
�������$��4q�6T   ._�5J      � .+�5K      � $
 Fill=�6j   
���  ��$	 0.5Q�6�    6"   �� $5 /Settings.SelectedBitmap.RedColorHistogramPoints�6�   � 5L      $
 Fill=�6l   
��� � �$	 0.5Q�6�    6"   �� $7 1Settings.SelectedBitmap.GreenColorHistogramPoints�6�   � 5M      $
 Fill=�6k   
����  �$	 0.5Q�6�    6"   �� $6 0Settings.SelectedBitmap.BlueColorHistogramPoints�6�   5N      5O      5P      5U      5V      5W      