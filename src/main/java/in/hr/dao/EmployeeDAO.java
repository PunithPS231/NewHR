package in.hr.dao;

import java.util.ArrayList;

import in.hr.dto.Employee;

public interface EmployeeDAO {
	public boolean insertEmployee(Employee e);
	public boolean updateEmployee(Employee e);
	public boolean deleteEmployee(Employee e);
	public Employee getEmployee(long phone,String mail);
	public Employee getEmployee(String mail,String password);
	public ArrayList<Employee> getEmployee();
	public Employee getEmployee(int id);
}
