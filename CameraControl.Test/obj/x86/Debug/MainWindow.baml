   M S B A M L   `   `   `  ����I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   M ICameraControl.Test, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:CameraControl.TestCameraControl.Test 5   5   #   CameraControl.Test.MainWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5   	   /my clr-namespace:CameraControl.Test     5   5     � Title$  
MainWindow��6	   $	��350��6   $	��525��6)    � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5	      $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?�6%   �� 5
      $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?�6%   �� 5      $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?�6%   �� 5      $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?�6%   �� 5      $R Lpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseLight.xaml?�6%   %    5      (   "MahApps.Metro.Controls.MetroWindow   WindowCommands 5      +   %MahApps.Metro.Controls.WindowCommands  5   
   .@�5      �� $��settings��6   �� 5      .��5      ��  �� Orientation$ 
Horizontal=�6   .+�5      �� $��20��6    $��20��6+    5         
BlackBrush �� Color��%)   &	        �� 5      $ White��6A   5      5      �� 5      $��deploy cupcakes��6    5      5       5!      .��5#      �  � ColumnDefinitions 5$   
   �� 5%      $
��376* �6   �� 5&      $
��127* �6    � RowDefinitions 5(   
   �� 5)      $
��146* �6   �� 5*      $
��165* �6   .+�5,   
   �� -   5        $��button1��5,   \   $��Button��6   $��23��6"   $
��Left=�6.   $��	77,42,0,0q�6I   $	��Top=�6k   $��75��6�   6�   9� 5-   
   $��1��6   $
��Test��6#   	 9� ExpandDirection$
	 Left=�61   $��10q�5.      
���   �$��Right=�6.   ��5/      � 50      $	��107��6    51      �� 52      $��* �6+   $��10��65   �� 53      $
��Auto �6+   .+�55      �� $��0��6#   $��10��63   
��� � �
 �� ResizeDirection$
 Columns=�56       �� ResizeBehavior$ CurrentAndNext=�6-   �� 57      $��1��6   $��Lorem ipsum dolor sit��6.   $��10q�58      
���  ��6#   59      5;      �� 5<   
   -   5        $��button2��5<   \   $��Button��6   $��23��6"   $��Right=�6.   $��0,60,9,0q�6J   $	��Top=�6k   $��75��6�   �� 5=   
   -   5        $��stackPanel1��5=   "   $��1��6   .+�5>      9� -   5        $��	expander1��5>   *   $��	expander1��6   ��5?      � 5@      $	��100��6   5B      9� 5C      -   5        $��	expander2��5C   +   $��	expander2��6   ��5D      � 5E      $	��100��6   5H      5I      5J      5K      