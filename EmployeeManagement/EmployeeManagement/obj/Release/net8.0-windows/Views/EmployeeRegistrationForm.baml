   M S B A M L   `   `   `  ���� M  IEmployeeManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:EmployeeManagement.ViewsEmployeeManagement.Views  K*clr-namespace:EmployeeManagement.ViewModelEmployeeManagement.ViewModel  7    1EmployeeManagement.Views.EmployeeRegistrationForm   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     8local&clr-namespace:EmployeeManagement.Views     9vm*clr-namespace:EmployeeManagement.ViewModel       � WindowStartupLocation$  CenterScreen=� � 
ResizeMode$ NoResize=� � Title$  Employee Registration Form��   RegistrationIcon � Icon# [  $
��Auto��$	��500��.��� .+��� $��5q�  GenericBorderStyle#��[ ._��  � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��15 ��� $��30 ��� $
��Auto ��� $��20 � � ColumnDefinitions �� $
��Auto ��� $
��Auto �.+���   RegistrationTextBlockStyle#��[ $��Name:��$��0��$��0���� $��0��$��1��  RegistrationTextBoxStyle#��[  �� 	MaxLength$	 100������ *EmployeeName+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=��� #��[ $
��SSN:��$��1��$��0���� $��1��$��1��#��[ $ 11������ *EmployeeSSN+$ PropertyChanged=�$ TwoWay=��� #��[ $��Title:��$��2��$��0���� #��[ $��2��$��1��$	 100������ *EmployeeTitle+$ PropertyChanged=�$ TwoWay=��� #��[ $��Salary:��$��3��$��0���� #��[ $��3��$��1��$ 13������ *EmployeeSalary+$ PropertyChanged=�$ TwoWay=��� #��[ $
��DOB:��$��4��$��0��(  "System.Windows.Controls.DatePicker  $	��150��$
��Left=�$��4��$��1��	   SelectedDate	 �� *EmployeeDOB+$ PropertyChanged=�$ TwoWay=�
 � 	Resources
 :  4System.Windows.Controls.Primitives.DatePickerTextBox �� 
TargetType �� Property �� Value��%:   '        �� "  .���  �@��
IsReadOnly$
 True���� #��[ $��Address:��$��5��$��0���� #��[ $��5��$��1��$	 255������ *EmployeeAddress+$ PropertyChanged=�$ TwoWay=��� #��[ $��City:��$��6��$��0���� #��[ $��6��$��1��$	 100������ *EmployeeCity+$ PropertyChanged=�$ TwoWay=��� #��[ $��State:��$��7��$��0���� #��[ $��7��$��1��$ 50������ *EmployeeState+$ PropertyChanged=�$ TwoWay=��� #��[ $
��Zip:��$��8��$��0���� #��[ $��8��$��1��$ 10������ *EmployeeZip+$ PropertyChanged=�$ TwoWay=��� #��[ $��Phone:��$��9��$��0���� #��[ $��9��$��1��$ 15������ *EmployeePhone+$ PropertyChanged=�$ TwoWay=��� #��[ $��Joining Date:��$��10��$��0��  $	��150��$
��Left=�$��10��$��1��	 �� *EmployeeJoiningDate+$ PropertyChanged=�$ TwoWay=�
 ��%:   '        �� "  .���  �@��
IsReadOnly$
 True���� $��12��$��Center=�$��2q�$��0��$��2��$-��'Please enter valid inputs in all fields��$
��Bold"�
���  ��$��12(�$��Arial)�y��� *IsWarningMessageEnabled+  BoolVisibilityConverter �� 	Converter# [ �� $��13��$��3��$��Right=�  ListBtnStyle#��[  �� 	IsDefault$
 True��$��0������ *SubmitBtnCommand+{��� *IsSubmitEnabled+���  �� $
��Auto ��� .+��� $��0��$��Center=�$��25��$��30��  SubmitFormIcon#��[ �� #��[ $��Center=�$��Submit��$��1��$��4,0,0,0q�