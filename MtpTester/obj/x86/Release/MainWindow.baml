   M S B A M L   `   `   `  ���� I  EMahApps.Metro, Version=0.10.0.0, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  D @MtpTester, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:MtpTester	MtpTester    MtpTester.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     &myclr-namespace:MtpTester       � Title$  
MainWindow��$	��706��$	��814�� � WindowStartupLocation$ CenterScreen=� � 	Resources  �� MergedDictionaries �� Source��  �� $H Bpack://application:,,,/MahApps.Metro;component/Styles/Colours.xaml?��� $F @pack://application:,,,/MahApps.Metro;component/Styles/Fonts.xaml?��� $I Cpack://application:,,,/MahApps.Metro;component/Styles/Controls.xaml?��� $M Gpack://application:,,,/MahApps.Metro;component/Styles/Accents/Blue.xaml?��� $Q Kpack://application:,,,/MahApps.Metro;component/Styles/Accents/BaseDark.xaml?�%    .���  � RowDefinitions �� $��25 ��� $
��334* �.+�o� -   $��menu1��.@�m� $
��Menu��.@�m� -   $	��New��m� -   $��Save as��m� -   $
��Load���� -   $��tabControl1��$��1��.@��� $��
Operations��.��� .+��� -   $��	lst_opers��$
��Left=�$��5,5,0,5q�$	��300�� �� DisplayMemberPath$ DisplayName���� $
��Name��$	��127��$
��Left=�$��	311,0,0,0q�$	��Top=�$	��465�� � DataContext ��  �� ElementName$ 	lst_opers��	 �� Path$	 SelectedItem�.��� 
 � ColumnDefinitions
 �� $
��212* ��� $
��241* � �� $	��39* ��� $	��49* �.+��� $
��Name��$��Right=��� $��1������ *Name+�� -   $��	groupBox4��$��Execute��$��80��$
��Left=�$��311,138,0,0q�$	��Top=�$	��465��.��� �� -   $��	groupBox5��$��Execute write data��$	��115��$
��Left=�$��311,231,0,0q�$	��Top=�$	��463��.��� �� -	   $��	groupBox6��$��Execute read data��$	��224��$
��Left=�$��311,355,0,0q�$	��Top=�$	��465��.��� �� $��Events��.��� .+��� -
   $��
lst_events��$
��Left=�$��5,5,0,5q�$	��300���� $��
Properties��.���  �� $
��118* ��� $
��293* ��� $
��174* �
 �� $	��312 ��� $	��472 �.+��� -   $��lst_prop��$��5q�$��3��$ DisplayName���� -   $��	groupBox1��$��1��$��Values��$��1�� �� $ lst_prop��$	 SelectedItem�.��� 
 �� $
��260* ��� $
��190* �.+��� -   $��
lst_values��$ DisplayName������ *Values+�� $��Display name��$��1��$��28��$
��Left=�$��6,0,0,0q�$	��Top=��� $��1��$��23��$
��Left=�$��6,39,0,0q�$	��Top=�$	��178�� �� $ 
lst_values��$	 SelectedItem����� *Name+�� -   $��	Set value��$��1��$��23��$
��Left=�$��6,0,0,6q� � ToolTip$' !Set this value to selected camera��$��Bottom=�$��75���� -   $��btn_get_value��$��	Get value��$��1��$��23��$
��Left=�$��	6,182,0,0q�$	��Top=�$��75���� -   $��	groupBox2��$��1��$��2��$��Testing��.��� �� -   $��	groupBox3��$��1��$��Description�� �� $ lst_prop��$	 SelectedItem�.��� 
 �� $
��166* ��� $
��284* � �� $	��33* ��� $	��36* �.+��� $
��Name��$��Right=��� $��1������ *Name+�� $��Device Control��.��� 