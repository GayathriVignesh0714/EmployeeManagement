   M S B A M L   `   `   `  ���� M  IEmployeeManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:EmployeeManagementEmployeeManagement  R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35L5clr-namespace:System.Diagnostics;assembly=WindowsBaseSystem.Diagnostics /    )EmployeeManagement.EmployeeManagementView   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     2local clr-namespace:EmployeeManagement     Fdiag5clr-namespace:System.Diagnostics;assembly=WindowsBase       � Title$  Employee Management��$	��450��$	��800�� � WindowState$ 	Maximized=� � 
ResizeMode$ CanMinimize=�   AppIcon � Icon# [  .���  � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+���   GenericBorderStyle#��[ $��0��$��2q�._���  �� Orientation$ 
Horizontal=�$
��Left=�.+���   ListBtnStyle#��[ $��2q����� *ListButtonCommand+���  � ColumnDefinitions �� $
��Auto ��� .+��� $��0��$
��Left=�$��Center=�$��25��$��20��  EmployeeListIcon#��[ �� $��Center=�$
��Left=�$��List Employee Details��$��1��$��4,0,0,0q��� #��[ $��2q����� *%#OpenEmployeeRegistrationFormCommand+���  �� $
��Auto ��� .+��� $��0��$
��Left=�$��Center=�$��25��$��20��  EmployeeAddIcon#��[ �� $��Center=�$
��Left=�$��Add Employee Details��$��1��$��4,0,0,0q�� $��1��{��� *IsFilterEnabled+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=� �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $ 
Horizontal=�$��0��$��2q�$
��Left=�.+��� $��Filter by Name���� $��25��$��2q�$	��200������ *
FilterName+$ PropertyChanged=�$ TwoWay=��� $ 
Horizontal=�$��1��$��2q�$
��Left=�.+��� $��Filter by Title���� $��25��$	��200��$��2q����� *FilterTitle+$ PropertyChanged=�$ TwoWay=��� -   	 ��Name$	 	BtnFilter��$��25��$��25��$��2q�$��2��$
��Left=����� *FilterCommand+����   
FilterIcon#��[ �� -   $	 BtnTitleClearFilter��$��25��$��25��$��2q�$��3��$
��Left=����� *ClearFilterCommand+����   ClearFilterIcon#��[ �� $��2��$��2q�  DataGridBorderStyle#��[ ._�� .+�&   System.Windows.Controls.DataGrid  "
   VerticalScrollBarVisibility$

 Auto=�$��5q�$	��150��$	��300��$   HorizontalScrollBarVisibility$
 Auto=�   GridLinesVisibility$
 None=�!   EnableColumnVirtualization$
 True��   EnableRowVirtualization$
 True��1  +System.Diagnostics.PresentationTraceSources   
TraceLevel$
 High=�   AutoGenerateColumns$
 True��$
��Auto��   CanUserResizeColumns$
 True��   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$ * ���� *EmployeesViewCollection+�� $��3��$��Center=�$��Center=�y��� *	IsLoading+$ PropertyChanged=�$ TwoWay=�  BoolVisibilityConverter �� 	Converter# [ .+��� $��
Loading...��$��14(�$��Center=��  � IsIndeterminate$
 True��$	��200��$��15��$��5q��� $��4��$��2q�#��[ ._��  �� $
��Auto ��� $
��Auto �.+��� $��0��$��0��#��[ $��2q����� *TitleButtonCommand+���  �� $
��Auto ��� .+��� $��0��$
��Left=�$��Center=�$��25��$��20��#��[ �� $��Center=�$
��Left=�$��List Titles��$��1��$��4,0,0,0q��� $��6��$��2q�#��[ ._�� .+�  $

 Auto=�$��5q�$	��150��$	��300��$
 Auto=�$
 None=�$
 True��$
 True��$
 High=�$
 True��$
��Auto��   
IsReadOnly$
 True��$
 True��$ *    CanUserAddRows$ False������ *TitlesViewCollection+