   M S B A M L   `   `   `  ����M  IEmployeeManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:EmployeeManagement.ViewsEmployeeManagement.Views  5   	   K*clr-namespace:EmployeeManagement.ViewModelEmployeeManagement.ViewModel  5   	   7    1EmployeeManagement.Views.EmployeeRegistrationForm   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5   	   2local&clr-namespace:EmployeeManagement.Views  5   	   3vm*clr-namespace:EmployeeManagement.ViewModel  5   	     � WindowStartupLocation$  CenterScreen=�5	       � 
ResizeMode$ NoResize=�6?    � Title$  Employee Registration Form��5
   	      RegistrationIcon � Icon# [  6,   $
��Auto��6U   $	��500��6c   .��5      � .+�5   
   �� $��5q�6     GenericBorderStyle#��[ 6   ._�5      �  � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $
��Auto �6$   �� 5      $��15 �6$   �� 5      $��30 �6$   �� 5      $
��Auto �6$   �� 5      $��20 �6$    � ColumnDefinitions 5      �� 5       $
��Auto �6'   �� 5!      $
��Auto �6'   .+�5#      ��   RegistrationTextBlockStyle#��[ 6   $��Name:��6P   $��0��6]   $��0��6j   �� 5$      $��0��6   $��1��6'     RegistrationTextBoxStyle#��[ 67    �� 	MaxLength$	 100��6�   ��6j   �� *EmployeeName+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=�6�   �� 5%      #��[ 6   $
��SSN:��6P   $��1��6]   $��0��6j   �� 5&      $��1��6   $��1��6(   #��[ 68   $ 11��6�   ��6j   �� *EmployeeSSN+$ PropertyChanged=�$ TwoWay=�.��6�   *  $Microsoft.Xaml.Behaviors.Interaction	   	Behaviors	 5'      5   /EmployeeManagement.Views.NumericTextBoxBehavior  5(      .��5)   /   5*      �� 5+      #��[ 6   $��Title:��6P   $��2��6^   $��0��6k   �� 5,      #��[ 6   $��2��6M   $��1��6Z   $	 100��6�   ��6j   �� *EmployeeTitle+$ PropertyChanged=�$ TwoWay=�6�   �� 5-      #��[ 6   $��Salary:��6P   $��3��6_   $��0��6l   �� 5.      #��[ 6   $��3��6M   $��1��6Z   $ 13��6�   ��6j   �� *EmployeeSalary+$ PropertyChanged=�$ TwoWay=�6�   �� 5/      #��[ 6   $
��DOB:��6P   $��4��6\   $��0��6i   � 50      $��4��6   $��1��6$    51      �� 52      �� 53      �� 54      .+�56      (  "System.Windows.Controls.DatePicker  $	��150��6!   $��0��6-   $
��Left=�6=   $��Center=�6X   
   SelectedDate
 6s   �� *EmployeeDOB+$ PropertyChanged=�$ TwoWay=� � 	Resources 57      :  4System.Windows.Controls.Primitives.DatePickerTextBox �� 
TargetType �� Property �� Value��%_   '        �� 59      "  6$   .�5:   "   ��  �@��
IsReadOnly$
 True��6?   5;      5<      5=      �� 5>      $
��Age:��6    $��	15,-5,0,0q�6,   $��1��6?   #��[ 6O   $��Center=�6�   �� 5?      $��2��6    $��5,-5,0,0q�60   $��Center=�6B   ${�False��6]   $��80��6o   ��6}   �� *EmployeeAge+ �� StringFormat$ 	{0} years��5@      �� 5B      #��[ 6   $��Address:��6P   $��5��6`   $��0��6m   �� 5C      #��[ 6   $��5��6M   $��1��6Z   $	 255��6�   ��6j   �� *EmployeeAddress+$ PropertyChanged=�$ TwoWay=�6�   �� 5D      #��[ 6   $��City:��6P   $��6��6]   $��0��6j   �� 5E      #��[ 6   $��6��6M   $��1��6Z   $	 100��6�   ��6j   �� *EmployeeCity+$ PropertyChanged=�$ TwoWay=�6�   �� 5F      #��[ 6   $��State:��6P   $��7��6^   $��0��6k   �� 5G      #��[ 6   $��7��6M   $��1��6Z   $ 50��6�   ��6j   �� *EmployeeState+$ PropertyChanged=�$ TwoWay=�6�   �� 5H      #��[ 6   $
��Zip:��6P   $��8��6\   $��0��6i   �� 5I      #��[ 6   $��8��6M   $��1��6Z   $ 10��6�   ��6j   �� *EmployeeZip+$ PropertyChanged=�$ TwoWay=�.��6�   	 5J        5K      .��5L   /   5M      �� 5N      #��[ 6   $��Phone:��6P   $��9��6^   $��0��6k   �� 5O      #��[ 6   $��9��6M   $��1��6Z   $ 15��6�   ��6j   �� *EmployeePhone+$ PropertyChanged=�$ TwoWay=�.��6�   	 5P        5Q      .��5R   /   5S      �� 5T      #��[ 6   $��Joining Date:��6P   $��10��6e   $��0��6s     5U      $	��150��6   $
��Left=�6)   $��10��6�   $��1��6�   
 6D   �� *EmployeeJoiningDate+$ PropertyChanged=�$ TwoWay=� 5V      ��%_   '        �� 5X      "  6    .�5Y      ��  �@��
IsReadOnly$
 True��6;   5Z      5[      5\      �� 5]      $��12��6   $��Center=�6*   $��2q�6E   $��0��6P   $��2��6`   $-��'Please enter valid inputs in all fields��6t   $
��Bold"�6  
���  ��$��12(�6(  $��Arial)�66  y�6�   �� *IsWarningMessageEnabled+  BoolVisibilityConverter �� 	Converter# [ 66  �� 5^      $��13��6   $��3��6'   $��Right=�6;     ListBtnStyle#��[ 6W    �� 	IsDefault$
 True��6}   $��0��6�   ��6�   �� *SubmitBtnCommand+{�6�   �� *IsSubmitEnabled+��5_      � 5`       5a      �� 5b   "   $
��Auto �63   �� 5c   "   .+�5e      �� $��0��6$   $��Center=�65   $��25��6P   $��30��6[     SubmitFormIcon#��[ 6g   �� 5f      #��[ 6(   $��Center=�6\   $��Submit��6x   $��1��6�   $��4,0,0,0q�6�   5g      5i      5j      5k      5l      5m      