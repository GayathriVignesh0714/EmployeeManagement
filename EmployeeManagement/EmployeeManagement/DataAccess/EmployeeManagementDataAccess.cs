using EmployeeManagement.Model;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using System.Data;

namespace EmployeeManagement.DataAccess
{
    public class EmployeeManagementDataAccess : IEmployeeManagementDataAccess
    {
        private readonly string _connectionString;
        private readonly ILogger<EmployeeManagementDataAccess> _logger;

        public EmployeeManagementDataAccess(string connectionString, ILogger<EmployeeManagementDataAccess> logger)
        {
            _connectionString = connectionString;
            _logger = logger;
        }

        public async Task<IEnumerable<Employee>> GetAllEmployeesAsync()
        {
            var employees = new List<Employee>();
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    _logger.LogInformation("Database connection opened successfully.");

                    string query = @"
                    SELECT 
                        e.EmployeeID,
                        e.Name,
                        e.SSN,
                        e.DOB,
                        e.Address,
                        e.City,
                        e.State,
                        e.Zip,
                        e.Phone,
                        e.JoinDate,
                        e.ExitDate,
                        s.Title,
                        s.Salary
                    FROM 
                        Employee e
                    LEFT JOIN 
                        EmployeeSalary s ON e.EmployeeID = s.EmployeeID;";

                    using (var command = new SqlCommand(query, connection))
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        _logger.LogDebug("Executing SQL query to retrieve employees.");

                        while (await reader.ReadAsync())
                        {
                            employees.Add(new Employee
                            {
                                EmployeeID = reader["EmployeeID"] != DBNull.Value ? Convert.ToInt32(reader["EmployeeID"]) : 0,
                                Name = reader["Name"]?.ToString() ?? "Unknown",
                                Salary = reader.IsDBNull(reader.GetOrdinal("Salary")) ? 0 : reader.GetDecimal(reader.GetOrdinal("Salary")),
                                Title = reader["Title"]?.ToString() ?? "Unknown",
                                SSN = reader["SSN"]?.ToString() ?? string.Empty,
                                DateOfBirth = reader["DOB"] != DBNull.Value ? Convert.ToDateTime(reader["DOB"]) : (DateTime?)null,
                                Address = reader["Address"]?.ToString() ?? string.Empty,
                                City = reader["City"]?.ToString() ?? string.Empty,
                                State = reader["State"]?.ToString() ?? string.Empty,
                                Zip = reader["Zip"]?.ToString() ?? string.Empty,
                                Phone = reader["Phone"]?.ToString() ?? string.Empty,
                                JoinDate = reader["JoinDate"] != DBNull.Value ? Convert.ToDateTime(reader["JoinDate"]) : DateTime.MinValue,
                                ExitDate = reader["ExitDate"] != DBNull.Value ? Convert.ToDateTime(reader["ExitDate"]) : (DateTime?)null
                            });
                        }
                        _logger.LogInformation("Successfully retrieved {Count} employees.", employees.Count);
                    }
                }
            }
            catch (SqlException ex)
            {
                _logger.LogError(ex, "SQL error occurred while retrieving employees.");
                throw;
            }
            return employees;
        }

        public async Task<int> AddEmployeeAsync(Employee employee)
        {
            int employeeId = 0;

            if (employee == null)
            {
                _logger.LogWarning("Attempted to add a null employee.");
                throw new ArgumentNullException(nameof(employee));
            }

            string employeeTableQuery = @"
                INSERT INTO Employee (Name, SSN, DOB, Address, City, State, Zip, Phone, JoinDate, ExitDate)
                OUTPUT INSERTED.EmployeeID
                VALUES (@Name, @SSN, @DOB, @Address, @City, @State, @Zip, @Phone, @JoinDate, @ExitDate);";

            string salaryTableQuery = @"
                INSERT INTO EmployeeSalary (EmployeeID, FromDate, ToDate, Title, Salary)
                VALUES (@EmployeeID, @FromDate, @ToDate, @Title, @Salary);";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                _logger.LogInformation("Database connection opened for adding employee.");

                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        employeeId = await InsertEmployeeAsync(connection, transaction, employeeTableQuery, employee);
                        _logger.LogInformation("Inserted Employee with ID {EmployeeID}.", employeeId);

                        await InsertEmployeeSalaryAsync(connection, transaction, salaryTableQuery, employeeId, employee);
                        _logger.LogInformation("Inserted salary details for Employee ID {EmployeeID}.", employeeId);

                        transaction.Commit();
                        _logger.LogInformation("Transaction committed successfully.");
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        _logger.LogError(ex, "Transaction rolled back due to an error while adding employee and Salary.");
                        throw;
                    }
                    finally
                    {
                        await connection.CloseAsync();
                        _logger.LogInformation("Database connection closed.");
                    }
                }
            }

            return employeeId;
        }

        private async Task<int> InsertEmployeeAsync(SqlConnection connection, SqlTransaction transaction, string query, Employee employee)
        {
            try
            {
                using (SqlCommand command = new SqlCommand(query, connection, transaction))
                {
                    AddEmployeeParameters(command, employee);
                    return (int)await command.ExecuteScalarAsync();
                }
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                _logger.LogError(ex, "Exception while Inserting Employee Record in the DB");
                return 0;
                throw;
            }

        }

        private async Task InsertEmployeeSalaryAsync(SqlConnection connection, SqlTransaction transaction, string query, int employeeId, Employee employee)
        {
            using (SqlCommand command = new SqlCommand(query, connection, transaction))
            {
                AddEmployeeSalaryParameters(command, employeeId, employee);
                await command.ExecuteNonQueryAsync();
            }
        }

        private void AddEmployeeParameters(SqlCommand command, Employee employee)
        {
            command.Parameters.AddWithValue("@Name", employee.Name);
            command.Parameters.AddWithValue("@SSN", employee.SSN);
            command.Parameters.AddWithValue("@DOB", employee.DateOfBirth);
            command.Parameters.AddWithValue("@Address", employee.Address);
            command.Parameters.AddWithValue("@City", employee.City);
            command.Parameters.AddWithValue("@State", employee.State);
            command.Parameters.AddWithValue("@Zip", employee.Zip);
            command.Parameters.AddWithValue("@Phone", employee.Phone);
            command.Parameters.AddWithValue("@JoinDate", employee.JoinDate);
            command.Parameters.AddWithValue("@ExitDate", employee.ExitDate ?? (object)DBNull.Value);
        }

        private void AddEmployeeSalaryParameters(SqlCommand command, int employeeId, Employee employee)
        {
            command.Parameters.AddWithValue("@EmployeeID", employeeId);
            command.Parameters.AddWithValue("@FromDate", employee.JoinDate);
            command.Parameters.AddWithValue("@ToDate", employee.ExitDate ?? (object)DBNull.Value);
            command.Parameters.AddWithValue("@Title", employee.Title);
            command.Parameters.AddWithValue("@Salary", employee.Salary);
        }
    }
}
