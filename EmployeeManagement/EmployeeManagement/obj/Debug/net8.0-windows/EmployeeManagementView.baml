   M S B A M L   `   `   `  ����M  IEmployeeManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:EmployeeManagementEmployeeManagement  5   	   R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35L5clr-namespace:System.Diagnostics;assembly=WindowsBaseSystem.Diagnostics 5   	   /    )EmployeeManagement.EmployeeManagementView   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:EmployeeManagement     5   	   Fdiag5clr-namespace:System.Diagnostics;assembly=WindowsBase     5   	     � Title$  Employee Management��5	   	   $	��450��6%   $	��800��65    � WindowState$ 	Maximized=�6D    � 
ResizeMode$ 	CanResize=�6\      AppIcon � Icon# [  5
   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   ��   GenericBorderStyle#��[ 6   $��0��6=   $��2q�6J   ._�5      ��  �� Orientation$ 
Horizontal=�6   $
��Left=�63   .+�5      ��   ListBtnStyle#��[ 6   $��2q�6?   ��6J   �� *ListButtonCommand+��5      � 5       � ColumnDefinitions 5      �� 5   "   $
��Auto �63   �� 5   "   .+�5      �� $��0��6$   $
��Left=�64   $��Center=�6O   $��25��6j   $��20��6u     EmployeeListIcon#��[ 6�   �� 5      $��Center=�6(   $
��Left=�6C   $��List Employee Details��6^   $��1��6{   $��4,0,0,0q�6�   5      5!      �� 5"      #��[ 6   $��2q�6?   ��6J   �� *%#OpenEmployeeRegistrationFormCommand+��5#      � 5$       5%      �� 5&   "   $
��Auto �63   �� 5'   "   .+�5)      �� $��0��6$   $
��Left=�64   $��Center=�6O   $��25��6j   $��20��6u     EmployeeAddIcon#��[ 6�   �� 5*      $��Center=�6(   $
��Left=�6C   $��Add Employee Details��6^   $��1��6z   $��4,0,0,0q�6�   5+      5-      5.      5/      � 50   
   $��1��6   {�6   �� *IsFilterEnabled+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=� 51      �� 52      $
��Auto �6#   �� 53      $
��Auto �6#   �� 54      $
��Auto �6#   �� 55      $
��Auto �6#   .+�57      �� $ 
Horizontal=�6   $��0��62   $��2q�6B   $
��Left=�6M   .+�58      �� $��Filter by Name��6   �� 59      $��25��6   $��2q�6&   $	��200��61   ��6=   �� *
FilterName+$ PropertyChanged=�$ TwoWay=�5:      �� 5;      $ 
Horizontal=�6   $��1��62   $��2q�6B   $
��Left=�6M   .+�5<      �� $��Filter by Title��6   �� 5=      $��25��6   $	��200��6&   $��2q�62   ��6>   �� *FilterTitle+$ PropertyChanged=�$ TwoWay=�5>      �� 5?      -   5        	 ��Name$	 	BtnFilter��5?      $��25��6(   $��25��63   $��2q�6@   $��2��6K   $
��Left=�6[   ��6v   �� *FilterCommand+��5@      �� 5A        
FilterIcon#��[ 6   5C      �� 5D      -   5        $	 BtnTitleClearFilter��5D      $��25��63   $��25��6>   $��2q�6K   $��3��6V   $
��Left=�6f   ��6�   �� *ClearFilterCommand+��5E      �� 5F        ClearFilterIcon#��[ 6   5H      5I      �� 5J   
   $��2��6   $��2q�6     DataGridBorderStyle#��[ 6+   ._�5K      � .+�5L      &   System.Windows.Controls.DataGrid  "
   VerticalScrollBarVisibility$

 Auto=�6   $��5q�6?   $	��150��6J   $	��300��6Z   $   HorizontalScrollBarVisibility$
 Auto=�5M         GridLinesVisibility$
 None=�67   !   EnableColumnVirtualization$
 True��6R      EnableRowVirtualization$
 True��6t      
IsReadOnly$
 True��5N   g      AutoGenerateColumns$
 True��5O      $
��Auto��6/      CanUserResizeColumns$
 True��6<      ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * 6X   ��5N      �� *EmployeesViewCollection+$ PropertyChanged=�5P      5Q      5R      �� 5T   
   $��3��6   $��Center=�6"   $��Center=�6?   y�6Z   �� *	IsLoading+$ PropertyChanged=�$ TwoWay=�  BoolVisibilityConverter �� 	Converter# [ .+�5U      �� $��
Loading...��6   $��14(�6*   $��Center=�68   � 5V       � IsIndeterminate$
 True��6   $	��200��61   $��15��6=   $��5q�6I   5W      �� 5Y   
   $��4��6   $��2q�6   #��[ 6)   ._�5Z      �  5[      �� 5\      $
��Auto �6$   �� 5]      $
��Auto �6$   .+�5_      �� $��0��6   $��0��6&   #��[ 66   $��2q�6\   ��6g   �� *TitleButtonCommand+��5`      � 5a       5b      �� 5c   "   $
��Auto �63   �� 5d   "   .+�5f      �� $��0��6$   $
��Left=�64   $��Center=�6O   $��25��6j   $��20��6u   #��[ 6�   �� 5g      $��Center=�6(   $
��Left=�6C   $��List Titles��6^   $��1��6q   $��4,0,0,0q�6�   5h      5j      5k      5l      �� 5n   
   $��5��6   $��2q�6   #��[ 6*   ._�5o      � .+�5p        $

 Auto=�6   $��5q�6>   $	��300��6J   $
 Auto=�5q      $
 None=�63   $
 True��6N   $
 True��6p   1  +System.Diagnostics.PresentationTraceSources   
TraceLevel$
 High=�5r   ]   $
 True��5s      $
��Auto��6(   $	��150��65   $
 True��6E   $
 True��6W   $ * 6s      CanUserAddRows$ False��6�   ��5r      �� *TitlesViewCollection+$ PropertyChanged=�5s   �   5t      5u      5v      5w      