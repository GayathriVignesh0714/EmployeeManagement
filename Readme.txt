# Employee Management Application - QA Instructions

##  Application Summary
The **EmployeeManagement** application is built using **C# and WPF (Windows Presentation Foundation)** for an interactive user interface. The backend is powered by **Microsoft SQL Server (MSSQL)** for managing employee data. This implementation follows the given use case, and the following technologies have been used:

- **Backend:** MSSQL for database operations.
- **Frontend:** WPF with XAML for UI development.
- **Database Management:** SQL scripts to create and seed the database.

##  Executable File Location
The application executable file is located at:
bin\Release\Executable\EmployeeManagement.exe

##  Prerequisite Steps for Running the Application
Before running the application, follow these steps:

### 1 Database Setup
- Execute the **SQL scripts** provided in the `DbScripts.sql` file on your **SQL Server environment**.
- This script will **create the necessary tables** and **seed initial data** required for the application.

### 2 Configure Connection String
- Navigate to the **configuration file**:
bin\Release\Executable\EmployeeManagement.dll.config

- Open the file in a **text editor** and update the **database connection string** to match your **SQL Server instance**.
- **Save the file** after updating the details.

##  Running the Application
1. **Ensure that the database is set up and the connection string is correctly configured.**
2. **Double-click `EmployeeManagement.exe` to launch the application.**
3. **Verify that the data loads correctly from the SQL Server database.**

##  Troubleshooting
- If the application fails to load data, check:
- The **SQL Server is running**.
- The **connection string is correctly configured**.
- The **database tables exist** (run `DbScripts.sql` again if needed).

##  Reporting Issues
If you encounter any issues:
- Capture a **screenshot** of the error message.
- Check for any **logs** inside the application folder .
---
 **Now, you are ready to test the Employee Management application!**

