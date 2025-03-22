using EmployeeManagement.ViewModel;
using System.Windows;

namespace EmployeeManagement
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class EmployeeManagementView : Window
    {
        public EmployeeManagementView(EmployeeManagementViewModel viewModel)
        {
            InitializeComponent();
           DataContext = viewModel;
        }
    }
}