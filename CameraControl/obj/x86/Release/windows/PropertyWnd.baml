   M S B A M L   `   `   `  ���� M  ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:CameraControl.Core;assembly=CameraControl.CoreCameraControl.Core  I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  CameraControl'   !CameraControl.windows.PropertyWnd   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     MCore<clr-namespace:CameraControl.Core;assembly=CameraControl.Core     Oontrols;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     -     � Title$  Image Propert��$	��322��$	��522�� � ShowInTaskbar .   � Topmost .  � WindowStyle$
 None=� � AllowsTransparency . 
������ (  "MahApps.Metro.Controls.MetroWindow   ShowMaxRestoreButton .   � DataContext (   "CameraControl.Core.ServiceProvider   � 	Resources  �� MergedDictionaries	 �� Source   WindowFrameBrush
 �� 
StartPoint �� EndPoint � Color � Offset �� 
TargetType �� Property �� Value �� Path � Orientation��  �� $H	 Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F	 @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I	 Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $H	 Bpack://application:,,,/MahApps.Metro;component/Styles/VS/Menu.xaml?��� $M	 Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $R	 Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�%  &	        '�� W     �� $
 0,0.5&�$ 1,0.5&�.��� $ 	CadetBlue��$	 0.4Q�� $
 Gray��$ 1Q��� " ��.���  � �� �� .R��� .+��� $
��Bold"����� $
 Name��� ���� $ Value���  � �� �� .R�� $ Vertical=�.���� ���	#68000000 �� CornerRadius$ 5��#��[  $��2,0,2,2q�._��  � ColumnDefinitions �� $
��250* ��� $
��250* � � RowDefinitions �� $
��150* ��� $
��150* �.+��� $��2��$��2q�$��Hidden=����� $&  Settings.SelectedBitmap.Metadata���Z� �� $��1��$��
Luminosity��$��0q�.���� $��1q�
���   �
�������._��  �� Stretch$
 Fill=�
���   � J� Opacity$	 0.8Q� � Points �� $6 0Settings.SelectedBitmap.LuminanceHistogramPoints��� $��1��$��1��$��Color��$��0q�.���� $��1q�
���   �
�������$��4q�._�� .+�� $
 Fill=�
���  ��$	 0.5Q� �� $5 /Settings.SelectedBitmap.RedColorHistogramPoints�� $
 Fill=�
��� � �$	 0.5Q� �� $7 1Settings.SelectedBitmap.GreenColorHistogramPoints�� $
 Fill=�
����  �$	 0.5Q� �� $6 0Settings.SelectedBitmap.BlueColorHistogramPoints�