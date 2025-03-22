using CommunityToolkit.Mvvm.Input;
using EmployeeManagement.DataAccess;
using EmployeeManagement.Extensions;
using EmployeeManagement.Model;
using EmployeeManagement.Services;
using EmployeeManagement.ViewModelBase;
using EmployeeManagement.Views;
using Microsoft.Extensions.Logging;
using System.Collections.ObjectModel;
using System.Windows;

namespace EmployeeManagement.ViewModel
{
    public class EmployeeManagementViewModel : NotificationBase
    {
        #region Readonly Variables

        private readonly ILogger<EmployeeManagementViewModel> _logger;
        private readonly IEmployeeManagementDataAccess _employeeManagementDataAccess;
        private readonly IWindowService _windowService;

        #endregion

        #region StringProperties

        private string _employeeAge;
        public string EmployeeAge
        {
            get { return _employeeAge; }
            set
            {
                _employeeAge = value;
                NotifyPropertyChanged("EmployeeAge");
            }
        }

        private string _filterTitle = string.Empty;
        public string FilterTitle
        {
            get { return _filterTitle; }
            set
            {
                _filterTitle = value;
                NotifyPropertyChanged("FilterTitle");
            }
        }

        private string _filterName = string.Empty;
        public string FilterName
        {
            get { return _filterName; }
            set
            {
                _filterName = value;
                NotifyPropertyChanged("FilterName");
            }
        }

        #endregion

        #region Employee Registration Form Properties

        private bool _isWarningMessageEnabled;
        public bool IsWarningMessageEnabled
        {
            get => _isWarningMessageEnabled;
            set => SetProperty(ref _isWarningMessageEnabled, value);
        }

        private string _employeeName;
        public string EmployeeName
        {
            get => _employeeName;
            set => SetProperty(ref _employeeName, value);
        }

        private string _employeeTitle;
        public string EmployeeTitle
        {
            get => _employeeTitle;
            set => SetProperty(ref _employeeTitle, value);
        }

        private string _employeeSalary;
        public string EmployeeSalary
        {
            get => _employeeSalary;
            set => SetProperty(ref _employeeSalary, value);
        }

        private string _employeeSSN;
        public string EmployeeSSN
        {
            get => _employeeSSN;
            set => SetProperty(ref _employeeSSN, value);
        }

        private DateTime _employeeDOB = DateTime.Today;
        public DateTime EmployeeDOB
        {
            get => _employeeDOB;
            set
            {
                if (SetProperty(ref _employeeDOB, value)) // Only update if value changes
                {
                    EmployeeAge = CalculateAge(value);
                }
            }
        }

        private string _employeeAddress;
        public string EmployeeAddress
        {
            get => _employeeAddress;
            set => SetProperty(ref _employeeAddress, value);
        }

        private string _employeeCity;
        public string EmployeeCity
        {
            get => _employeeCity;
            set => SetProperty(ref _employeeCity, value);
        }

        private string _employeeState;
        public string EmployeeState
        {
            get => _employeeState;
            set => SetProperty(ref _employeeState, value);
        }

        private string _employeeZip;
        public string EmployeeZip
        {
            get => _employeeZip;
            set => SetProperty(ref _employeeZip, value);
        }

        private string _employeePhone;
        public string EmployeePhone
        {
            get => _employeePhone;
            set => SetProperty(ref _employeePhone, value);
        }

        private DateTime _employeeJoiningDate = DateTime.Today;
        public DateTime EmployeeJoiningDate
        {
            get => _employeeJoiningDate;
            set => SetProperty(ref _employeeJoiningDate, value);
        }
       
        #endregion

        #region Boolean Properties
        private bool _isLoading;
        public bool IsLoading
        {
            get { return _isLoading; }
            set
            {
                _isLoading = value;
                NotifyPropertyChanged("IsLoading");
            }
        }

        private bool _isFilterEnabled;
        public bool IsFilterEnabled
        {
            get { return _isFilterEnabled; }
            set
            {
                _isFilterEnabled = value;
                NotifyPropertyChanged("IsFilterEnabled");
            }
        }

        #endregion

        #region ObservableCollectionProperties

        private List<Employee> _masterEmployees { get; set; }

        private ObservableCollection<Employee> _employeesViewCollection;
        public ObservableCollection<Employee> EmployeesViewCollection
        {
            get { return _employeesViewCollection; }
            set
            {
                _employeesViewCollection = value;

                if (value == null || value.Count() == 0)
                {
                    IsFilterEnabled = false;
                }
                else
                {
                    IsFilterEnabled = true;
                }
                NotifyPropertyChanged("EmployeesViewCollection");
            }
        }

        private ObservableCollection<TitleSalaryDetails> _titlesViewCollection;
        public ObservableCollection<TitleSalaryDetails> TitlesViewCollection
        {
            get { return _titlesViewCollection; }
            set
            {
                _titlesViewCollection = value;
                NotifyPropertyChanged("TitlesViewCollection");
            }
        }

        #endregion

        #region RelayCommands

        private AsyncRelayCommand<object> _listBtnClick;
        public AsyncRelayCommand<object> ListButtonCommand
        {
            get
            {
                return _listBtnClick ?? (_listBtnClick = new AsyncRelayCommand<object>(ListButtonClick));
            }
        }

        private AsyncRelayCommand<object>? _submitBtnCommand;
        public AsyncRelayCommand<object> SubmitBtnCommand
        {
            get
            {
                return _submitBtnCommand ??= new AsyncRelayCommand<object>(AddEmployeeRecord);
            }
        }

        private ViewModelBase.RelayCommand<object> _titleBtnClick;
        public ViewModelBase.RelayCommand<object> TitleButtonCommand
        {
            get
            {
                return _titleBtnClick ?? (_titleBtnClick = new ViewModelBase.RelayCommand<object>(TitleButtonClick));
            }
        }

        private ViewModelBase.RelayCommand<object> _openEmployeeRegistrationFormCommand;
        public ViewModelBase.RelayCommand<object> OpenEmployeeRegistrationFormCommand
        {
            get
            {
                return _openEmployeeRegistrationFormCommand ?? (_openEmployeeRegistrationFormCommand = new ViewModelBase.RelayCommand<object>(OpenEmployeeRegistrationForm));
            }
        }

        private ViewModelBase.RelayCommand<object> _filterCommand;
        public ViewModelBase.RelayCommand<object> FilterCommand
        {
            get
            {
                return _filterCommand ?? (_filterCommand = new ViewModelBase.RelayCommand<object>(FilterEmployee));
            }
        }

        private ViewModelBase.RelayCommand<object> _clearFilterCommand;
        public ViewModelBase.RelayCommand<object> ClearFilterCommand
        {
            get
            {
                return _clearFilterCommand ?? (_clearFilterCommand = new ViewModelBase.RelayCommand<object>(ClearFilter));
            }
        }

        #endregion

        #region Constructor
        public EmployeeManagementViewModel(IEmployeeManagementDataAccess employeeManagementDataAccess,
            IWindowService WindowService, ILogger<EmployeeManagementViewModel> logger)
        {
            _employeeManagementDataAccess = employeeManagementDataAccess;
            _windowService = WindowService;
            _logger = logger;
            LoadEmployeeDetails();
        }

        #endregion

        #region Private Methods

        private string CalculateAge(DateTime? employeeDOB)
        {
            var employeeAge = string.Empty;

            if (employeeDOB.HasValue) // Ensure DateOfBirth is not null
            {
                int age = DateTime.Today.Year - employeeDOB.Value.Year;

                // Subtract 1 if the birthday hasn't occurred yet this year
                if (DateTime.Today < employeeDOB.Value.AddYears(age))
                {
                    age--;
                }

                employeeAge = age.ToString();
            }
            else
            {
                employeeAge = "N/A"; // Or any default value indicating missing DOB
            }

            return employeeAge;
        }

        private async Task AddEmployeeRecord(object obj)
        {
            try
            {
                // Check for input error fields
                IsWarningMessageEnabled = CheckWarningMessageEnabled();
                if (IsWarningMessageEnabled)
                {
                    return;
                }

                // Create the new employee object
                var employee = new Employee
                {
                    Name = EmployeeName,
                    Title = EmployeeTitle,
                    Address = EmployeeAddress,
                    SSN = EmployeeSSN,
                    City = EmployeeCity,
                    Phone = EmployeePhone,
                    Salary = Convert.ToDecimal(EmployeeSalary),
                    State = EmployeeState,
                    Zip = EmployeeZip,
                    DateOfBirth = EmployeeDOB,
                    JoinDate = EmployeeJoiningDate
                };

                _logger.LogInformation("Adding employee record into Database");

                // Add the new record to the database
                var employeeId = await _employeeManagementDataAccess.AddEmployeeAsync(employee);

                // Refresh the employee list after insert operation completes
                await RefreshEmployeeListAsync();

                // Show success message
                MessageBox.Show("Record has been successfully saved!", "Employee Registration Notification", MessageBoxButton.OK, MessageBoxImage.Information);
                _logger.LogInformation("Employee record with {employeeId} has been saved successfully", employeeId);

                // Close the window
                _windowService.CloseWindow(this);
            }
            catch (Exception ex)
            {
                // Handle exceptions gracefully
                _logger.LogError(ex,$"Error adding employee record");
                MessageBox.Show("An error occurred while saving the employee record.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private async Task RefreshEmployeeListAsync()
        {
            _logger.LogInformation("RefreshEmployeeList called");

            await LoadEmployeeDetails();
            await ListButtonClick(new object());
            TitleButtonClick(new object());
        }

        private void OpenEmployeeRegistrationForm(object obj)
        {
            _logger.LogInformation("Opening Employee Registration Form..");
            ClearRegistrationVariables();
            _windowService.OpenWindow(typeof(EmployeeRegistrationForm), this);
        }

        private void ClearRegistrationVariables()
        {
            EmployeeAddress = string.Empty;
            EmployeeCity = string.Empty;
            EmployeeDOB = DateTime.Today;
            EmployeeJoiningDate = DateTime.Today;
            EmployeeTitle = string.Empty;
            EmployeeSSN = string.Empty;
            EmployeeState = string.Empty;
            EmployeeZip = string.Empty;
            EmployeeSalary = string.Empty;
            EmployeeName = string.Empty;
            EmployeePhone = string.Empty;
            IsWarningMessageEnabled = false;
        }

        private bool CheckWarningMessageEnabled()
        {
            //Reset warning message visibility
            IsWarningMessageEnabled = false;

            if (string.IsNullOrEmpty(EmployeeZip)
                 || string.IsNullOrEmpty(EmployeePhone)
                 || string.IsNullOrEmpty(EmployeeCity)
                 || string.IsNullOrEmpty(EmployeeSalary)
                 || string.IsNullOrEmpty(EmployeeTitle)
                 || string.IsNullOrEmpty(EmployeeState)
                 || string.IsNullOrEmpty(EmployeeName)
                 || string.IsNullOrEmpty(EmployeeAddress)
                 || string.IsNullOrEmpty(EmployeeSSN))
            {
                IsWarningMessageEnabled = true;
            }

            if (!(DateTime.TryParse(EmployeeDOB.ToString(), out DateTime parsedDate)))
            {
                IsWarningMessageEnabled = true;
            }

            if (!(DateTime.TryParse(EmployeeJoiningDate.ToString(), out DateTime parsedJoiningDate)))
            {
                IsWarningMessageEnabled = true;
            }
            if (!(decimal.TryParse(EmployeeSalary, out decimal result)))
            {
                IsWarningMessageEnabled = true;
            }

            return IsWarningMessageEnabled;
        }

        private void ClearFilter(object obj)
        {
            try
            {
                FilterTitle = string.Empty;
                FilterName = string.Empty;

                List<Employee> filteredList = _masterEmployees;

                if (EmployeesViewCollection == null)
                {
                    EmployeesViewCollection = new ObservableCollection<Employee>(filteredList);
                }
                else
                {
                    EmployeesViewCollection.Clear();
                    EmployeesViewCollection.AddRange(filteredList);
                }

                NotifyPropertyChanged(nameof(EmployeesViewCollection));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "error occurred while Clearing Filter");
            }
        }

        private void FilterEmployee(object obj)
        {
            try
            {
                var filteredList = _masterEmployees
     .Where(x => (string.IsNullOrWhiteSpace(FilterTitle) || x.Title.Equals(FilterTitle, StringComparison.OrdinalIgnoreCase)) &&
                 (string.IsNullOrWhiteSpace(FilterName) || x.Name.IndexOf(FilterName, StringComparison.OrdinalIgnoreCase) >= 0))
     .ToList();

                // Initialize or update EmployeesViewCollection
                if (EmployeesViewCollection == null)
                {
                    EmployeesViewCollection = new ObservableCollection<Employee>(filteredList);
                }
                else
                {
                    EmployeesViewCollection.Clear();
                    EmployeesViewCollection.AddRange(filteredList);
                }

                NotifyPropertyChanged(nameof(EmployeesViewCollection));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while Filtering Employee Details");
            }
        }

        private void TitleButtonClick(object obj)
        {
            IsLoading = true; // Show progress bar

            try
            {
                if (_masterEmployees?.Count > 0)
                {
                    _logger.LogInformation("Loading Titles..");

                    // LINQ Query
                    List<TitleSalaryDetails> titleSalarySummaryList = _masterEmployees.GroupBy(e => e.Title)
                                                                  .Select(g => new TitleSalaryDetails
                                                                  {
                                                                      Title = g.Key,
                                                                      MinSalary = g.Min(e => e.Salary),
                                                                      MaxSalary = g.Max(e => e.Salary)
                                                                  }).ToList();

                    if (titleSalarySummaryList?.Count > 0)
                    {

                        TitlesViewCollection = new ObservableCollection<TitleSalaryDetails>(titleSalarySummaryList);
                        NotifyPropertyChanged(nameof(TitlesViewCollection));
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                _logger.LogError(ex,$"Error processing TitleSalary list:");
            }
            finally
            {
                IsLoading = false;
            }
        }


        /// <summary>
        /// Fetch Employee Details from Table
        /// </summary>
        private async Task LoadEmployeeDetails()
        {
            IsLoading = true; // Show progress bar

            try
            {
                await Task.Yield(); // Ensure progress bar is rendered

                _logger.LogInformation("Loading Employee Details..");

                // Fetch data asynchronously from the database
                var employees = await Task.Run(() => _employeeManagementDataAccess.GetAllEmployeesAsync());


                foreach (var employee in employees)
                {
                    employee.Age = CalculateAge(employee.DateOfBirth);
                }

                // Populate the master collection on the UI thread
                if (_masterEmployees == null)
                {
                    _masterEmployees = new List<Employee>();
                }
                else
                {
                    _masterEmployees.Clear();
                }

                _masterEmployees.AddRange(employees);
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., log or display an error message)
                _logger.LogError(ex, "Error loading employees");
            }
            finally
            {
                IsLoading = false; // Hide progress bar
            }
        }

        /// <summary>
        /// Load UI Collection from Master Collection on List Button
        /// </summary>
        /// <param name="obj"></param>
        private async Task ListButtonClick(object obj)
        {
            IsLoading = true; // Show progress bar

            try
            {
                // Ensure the progress bar is rendered before starting heavy work
                await Task.Delay(100);

                _logger.LogInformation("Loading the Employee Details to the Grid..");

                // Initialize EmployeesViewCollection if null
                if(EmployeesViewCollection == null)
                {
                    EmployeesViewCollection = new ObservableCollection<Employee>(_masterEmployees);
                }
                else
                {
                    EmployeesViewCollection.Clear();
                    EmployeesViewCollection.AddRange(_masterEmployees);
                }

                NotifyPropertyChanged(nameof(EmployeesViewCollection));
            }
            catch (Exception ex)
            {
                // Handle exceptions
                _logger.LogError(ex, $"Error processing employee list");
            }
            finally
            {
                IsLoading = false; // Hide progress bar
            }
        }

        #endregion
    }
}