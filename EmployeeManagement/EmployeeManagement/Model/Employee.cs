namespace EmployeeManagement.Model
{
    public class Employee
    {
        public int EmployeeID { get; set; } // INT IDENTITY(100,1)
        public required string Name { get; set; }
        public string Age { get; set; }
        public required string Title { get; set; }
        public required decimal Salary { get; set; }
        public required string SSN { get; set; } // UNIQUE constraint can be handled at the database level
        public DateTime? DateOfBirth { get; set; } // DATE
        public required string Address { get; set; }
        public required string City { get; set; }
        public required string State { get; set; }
        public required string Zip { get; set; }
        public required string Phone { get; set; }
        public DateTime JoinDate { get; set; } // DATE
        public DateTime? ExitDate { get; set; }
    }
}
