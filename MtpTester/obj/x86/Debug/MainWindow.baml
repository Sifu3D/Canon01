   M S B A M L   `   `   `  ����I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      D @MtpTester, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:MtpTester	MtpTester 6�      MtpTester.MainWindow   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      &myclr-namespace:MtpTester     6�     � Title$  
MainWindow��6d   $	��706��6w   $	��814��6�    � WindowStartupLocation$ CenterScreen=�6�    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5	      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5
      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $Q Kpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseDark.xaml?�6%   %    5      .��5      �  � RowDefinitions 5   
   �� 5      $��25 �6   �� 5      $
��334* �6   .+�5   
   o� -   5        $��menu1��5      .@�5      m� $
��Menu��6   .@�5      m� -   5        $	��New��5      6(   m� 5      -   5        $��Save as��5      6,   m� 5      -   5        $
��Load��5      6)   5      5      �� 5   
   -   5        $��tabControl1��5   "   $��1��6   .@�5       �� $��
Operations��6   .��5!      � .+�5"      �� -   5        $��	lst_opers��5"   J   $
��Left=�6   $��5,5,0,5q�69   $	��300��6[    �� DisplayMemberPath$ DisplayName��6g   �� 5#      $
��Name��6   $	��127��6-   $
��Left=�6:   $��	311,0,0,0q�6U   $	��Top=�6h   $	��465��6�    � DataContext 6�   ��  �� ElementName$ 	lst_opers��	 �� Path$	 SelectedItem�.��5$      � 
 � ColumnDefinitions
 5%      �� 5&   "   $
��212* �63   �� 5'   "   $
��241* �63    5)      �� 5*   "   $	��39* �60   �� 5+   "   $	��49* �60   .+�5-      �� $
��Name��6$   $��Right=�63   �� 5.      $��1��6=   ��6'   �� *Name+6=   5/      50      �� 51      -   5        $��	groupBox4��51   l   $��Execute��6   $��80��60   $
��Left=�6<   $��311,138,0,0q�6W   $	��Top=�6}   $	��465��6�   .��52      � 53      �� 54      -   5        $��	groupBox5��54   x   $��Execute write data��6   $	��115��6;   $
��Left=�6H   $��311,231,0,0q�6c   $	��Top=�6�   $	��463��6�   .��55      � 56      �� 57      -	   5        $��	groupBox6��57   w   $��Execute read data��6   $	��224��6:   $
��Left=�6G   $��311,355,0,0q�6b   $	��Top=�6�   $	��465��6�   .��58      � 59      5:      5;      �� 5<      $��Events��6   .��5=      � .+�5>      �� -
   5        $��
lst_events��5>   J   $
��Left=�6   $��5,5,0,5q�69   $	��300��6\   5?      5@      �� 5A      $��
Properties��6   .��5B      �  5C      �� 5D      $
��118* �6(   �� 5E      $
��293* �6(   �� 5F      $
��174* �6(   
 5H      �� 5I      $	��312 �6+   �� 5J      $	��472 �6+   .+�5L      �� -   5        $��lst_prop��5L      $��5q�6.   $��3��69   $ DisplayName��6J   �� 5M      -   5        $��	groupBox1��5M   ?   $��1��6   $��Values��6/   $��1��6P    6]   �� $ lst_prop��$	 SelectedItem�.��5N      � 
 5O      �� 5P   "   $
��260* �63   �� 5Q   "   $
��190* �63   .+�5S      �� -   5        $��
lst_values��5S   e   $ DisplayName��6E   ��6&   �� *Values+6e   �� 5T      $��Display name��6$   $��1��6;   $��28��6K   $
��Left=�6W   $��6,0,0,0q�6r   $	��Top=�6�   �� 5U      $��1��6&   $��23��66   $
��Left=�6B   $��6,39,0,0q�6]   $	��Top=�6�   $	��178��6�    6o   �� $ 
lst_values��$	 SelectedItem���6�   �� *Name+6�   �� 5V      -   5        $��	Set value��5V   %   $��1��69   $��23��6I   $
��Left=�6U   $��6,0,0,6q�6p    � ToolTip$' !Set this value to selected camera��6�   $��Bottom=�6�   $��75��6�   6�   �� 5W      -   5        $��btn_get_value��5W   �   $��	Get value��6%   $��1��69   $��23��6I   $
��Left=�6U   $��	6,182,0,0q�6p   $	��Top=�6�   $��75��6�   6�   5X      5Y      �� 5Z      -   5        $��	groupBox2��5Z   M   $��1��6   $��2��6/   $��Testing��6<   .��5[      � 5\      �� 5]      -   5        $��	groupBox3��5]   D   $��1��6   $��Description��6/    6U   �� $ lst_prop��$	 SelectedItem�.��5^      � 
 5_      �� 5`   "   $
��166* �63   �� 5a   "   $
��284* �63    5c      �� 5d   "   $	��33* �60   �� 5e   "   $	��36* �60   .+�5g      �� $
��Name��6$   $��Right=�63   �� 5h      $��1��6&   ��66   �� *Name+5i      5j      5k      5l      �� 5m      $��Device Control��6   .��5n      � 5o      5q      5r      5s      