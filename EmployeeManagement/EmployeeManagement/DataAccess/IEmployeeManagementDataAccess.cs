using EmployeeManagement.Model;

namespace EmployeeManagement.DataAccess
{
    public interface IEmployeeManagementDataAccess
    {
        public Task<IEnumerable<Employee>> GetAllEmployeesAsync();

        public Task<int> AddEmployeeAsync(Employee employee);
    }
}