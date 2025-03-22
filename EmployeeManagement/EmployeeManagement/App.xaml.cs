using EmployeeManagement.DataAccess;
using EmployeeManagement.Services;
using EmployeeManagement.ViewModel;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Serilog;
using System.Configuration;
using System.Windows;

namespace EmployeeManagement
{
    public partial class App : Application
    {
        private IServiceProvider _serviceProvider;

        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            // Configure Serilog
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Information()
                .WriteTo.File("Logs/employeemanagement_log.txt", rollingInterval: RollingInterval.Day) // File Logging
                .CreateLogger();

            // Configure Services (Dependency Injection)
            var serviceCollection = new ServiceCollection();
            ConfigureServices(serviceCollection);

            _serviceProvider = serviceCollection.BuildServiceProvider();

            // Global Exception Handling
            AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;
            DispatcherUnhandledException += App_DispatcherUnhandledException;

            // Launch Main Window
            var mainWindow = _serviceProvider.GetRequiredService<EmployeeManagementView>();
            mainWindow.Show();
        }

        private void ConfigureServices(IServiceCollection services)
        {
            // Add Serilog to Microsoft.Extensions.Logging
            services.AddLogging(loggingBuilder =>
            {
                loggingBuilder.ClearProviders();
                loggingBuilder.AddSerilog();
            });

            // Register Services and Repositories
            services.AddSingleton<IWindowService, WindowService>();

            // Register EmployeeManagementDataAccess with DI for logger and connection string
            services.AddSingleton<IEmployeeManagementDataAccess, EmployeeManagementDataAccess>(provider =>
            {
                var logger = provider.GetRequiredService<ILogger<EmployeeManagementDataAccess>>();
                var connectionString = ConfigurationManager.ConnectionStrings["EmployeeDb"].ConnectionString;
                return new EmployeeManagementDataAccess(connectionString, logger);
            });

            // Register ViewModels and Views
            services.AddTransient<EmployeeManagementViewModel>();
            services.AddTransient<EmployeeManagementView>();
        }

        private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            var logger = _serviceProvider.GetRequiredService<ILogger<App>>();
            logger.LogError(e.Exception, "An unhandled UI exception occurred.");
            MessageBox.Show("An unexpected error occurred. Please check the log file.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            e.Handled = true;
        }

        private void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            var logger = _serviceProvider.GetRequiredService<ILogger<App>>();
            if (e.ExceptionObject is Exception ex)
            {
                logger.LogCritical(ex, "A critical non-UI thread exception occurred.");
            }
        }

        protected override void OnExit(ExitEventArgs e)
        {
            base.OnExit(e);
            Log.CloseAndFlush(); // Ensure all logs are flushed
        }
    }
}
