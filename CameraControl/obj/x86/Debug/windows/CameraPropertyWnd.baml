   M S B A M L   `   `   `  ����H  DCameraControl, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:CameraControl.windowsCameraControl.windows  5   x   I EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      M ICameraControl.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullkHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.CoreCameraControl.Core.Translation 5      -    'CameraControl.windows.CameraPropertyWnd   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   2my#clr-namespace:CameraControl.windows     5   x   Oontrols;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      X TXceed.Wpf.Toolkit, Version=1.9.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      PTHclr-namespace:CameraControl.Core.Translation;assembly=CameraControl.Core  5      -   5          � Title$  Camera Property��5   	   $	��332��6!   $	��331��6.    � WindowStartupLocation$ CenterScreen=�6S    � WindowStyle$ 
ToolWindow=�5       � UseLayoutRounding .   � 	Resources 5	       �� MergedDictionaries �� Source�� 5
   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   �� 5      $U Opack://application:,,,/CameraControl;component/Styles/Wpf.Toolkit.Extended.xaml?�6%   %    5      .��5      �  � ColumnDefinitions 5   
   �� 5      $��10 �6   �� 5      $
��130* �6   �� 5      $
��158* �6   �� 5      $��10 �6    � RowDefinitions 5   
   �� 5       $	��32* �6   �� 5!      $	��32* �6   �� 5"      $	��32* �6   �� 5#      $	��32* �6   �� 5$      $	��32* �6   �� 5%      $	��32* �6   �� 5&      $	��80* �6   �� 5'      $	��41* �6   .+�5)   
   �� -   5        $��label1��5)   &   $��Camera name��6   $��1��64   $��1��6D   �� 5*   
   -   5        $��textBox1��5*   /   $��2��6   $��1��6"   $��3q�6�   ��6?   �� 	 �� RelativeSource	 �� *FindAncestor+
 �� AncestorType$
 my:CameraPropertyWndL� �� AncestorLevel$ 1�� �� Path$ CameraProperty.DeviceName�6�   �� 5+   
   -   5        $��label2��5+   d   $��Serial number��6   $��2,1.955,0,0q�6(   $��28��6=   $
��Left=�6I   $	��Top=�6r   $��1��6�   �� 5,   
   -   5        $��textBox2��5,   "   $��2��6    �� 
IsReadOnly . $��3q�6�   ��62   �� 	 �� *FindAncestor+$
 my:CameraPropertyWndL�$ 1��$! CameraProperty.SerialNumber�6�   �� 5-   
   -   5        $��btn_save��5-   ]   $
��Save��6   $��7��6    $
��Left=�6-   $��2,0,0,13.38q�6H   $��75��6m   $��1��6�   �� 5.   
   -   5        $��
btn_cancel��5.   D   $��Cancel��6   $��7��6"   $��0,0,2,13.38q�6/   $��Right=�6V   $��75��6r   $��2��6}   6�   �� 5/   
   -   5        $��label3��5/   H   $��Default session��6   $��2,2,0,2q�6*   $��2��6;   $��1��6V   �� 50   
   -	   5        $��	comboBox1��50   0   $��2��6   $��2��6#   $��3q�6r  ��6A   �� 	 �� *FindAncestor+$
 my:CameraPropertyWndL�$ 1��$ PhotoSessionNames� �� SelectedItem 6�   �� 	 �� *FindAncestor+$
 my:CameraPropertyWndL�$ 1��$% CameraProperty.PhotoSessionName�6r  �� 51   
   -
   5        $��btn_identify��51   B   $��	Indentify��6   $��2��6%   $��5��65   6V   �� 53   
   $	��120��6>   $��3��6J   $��1��6W   ��6   7  1CameraControl.Core.Translation.TranslateExtension  *LabelCounter+6W   %  Xceed.Wpf.Toolkit.IntegerUpDown  54   
   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Minimum$ 0X�6�   $��3��6�   $��2��6�   $��2q�6�   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]   Value 6   �� 	 �� *FindAncestor+$
 my:CameraPropertyWndL�$ 1��$ CameraProperty.Counter�6�   �� 56   
   $	��120��6I   $��4��6U   $��1��6b   ��6     *LabelCounterIncrementer+6b     57   
   $ 1X�6�   $��4��6�   $��2��6�   $��2q�6�    6   �� 	 �� *FindAncestor+$
 my:CameraPropertyWndL�$ 1��$ CameraProperty.CounterInc�6�   59      5:      