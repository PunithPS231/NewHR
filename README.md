# NewHR

**Go to File → Import → Maven → Existing Maven Projects**
Then:
-> Select the root folder [NewHR]
-> Eclipse will detect the pom.xml
-> Click Finish

# Working on Eclipse
**By default eclipse show error once you add the file because by default, Maven adds J2SE-1.5 lib.**
Hence,
-> Right click on project
-> Go to properties -> Java build path -> Libraries -> Choose JRE System Library [J2SE - 1.5]
-> Click on edit, add the JRE System Library [JavaSE-1.7]
-> Click on apply and close

# Adding .sql file to MySQL
**Open MySQL Workbench. Login to Local Instance 80**
Go to Server -> Data Import -> Import from self contained file -> Choose the file path (.sql file path) -> Start Import


/  
├── .gitignore  
├── README.md  
├── newhr.sql  
├── pom.xml  
└── src/  
    └── main/  
        ├── java/  
        │   └── in/hr/  
        │       ├── connection/  
        │       │   └── Connector.java  
        │       ├── dao/  
        │       │   ├── ApplyDAO.java  
        │       │   ├── ApplyDAOImpl.java  
        │       │   ├── EmployeeDAO.java  
        │       │   ├── EmployeeDAOImpl.java  
        │       │   ├── SalaryDAO.java  
        │       │   ├── SalaryDAOImpl.java  
        │       │   ├── TaskDAO.java  
        │       │   ├── TaskDAOImpl.java  
        │       │   ├── TicketsDAO.java  
        │       │   └── TicketsDAOImpl.java  
        │       ├── dto/  
        │       │   ├── Apply.java  
        │       │   ├── Employee.java  
        │       │   ├── Salary.java  
        │       │   ├── Task.java  
        │       │   └── Tickets.java  
        │       ├── index/  
        │       │   ├── Admin.java  
        │       │   ├── App.java  
        │       │   ├── Concern.java  
        │       │   ├── Concerns.java  
        │       │   ├── Index.java  
        │       │   ├── Leave.java  
        │       │   ├── LeaveUpdate.java  
        │       │   ├── Login.java  
        │       │   ├── PaySlip.java  
        │       │   ├── PayslipGenerator.java  
        │       │   ├── RandomNumber.java  
        │       │   ├── ResignationApprove.java  
        │       │   └── Signup.java  
        │       └── servlets/  
        │           ├── AddSalary.java  
        │           ├── ApplyLeave.java  
        │           ├── ApproveLeave.java  
        │           ├── DeleteLeave.java  
        │           ├── DeleteTicket.java  
        │           ├── ForgotPassword.java  
        │           ├── GeneratePayslip.java  
        │           ├── Login.java  
        │           ├── Logout.java  
        │           ├── RaiseConcern.java  
        │           └── Signup.java  
        └── webapp/  
            ├── WEB-INF/  
            │   └── web.xml  
            ├── dashboard.jsp  
            ├── employees.jsp  
            ├── forgotPassword.jsp  
            ├── images/  
            │   └── logo.png  
            ├── login.jsp  
            ├── salaries.jsp  
            ├── signup.jsp  
            ├── tickets.jsp  
            ├── updateAccount.jsp  
            ├── viewAccount.jsp  
            ├── viewLeaves.jsp  
            └── viewProfile.jsp  
