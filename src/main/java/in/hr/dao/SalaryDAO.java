package in.hr.dao;

import java.util.ArrayList;

import in.hr.dto.Salary;

public interface SalaryDAO {
	public boolean insertSalary(Salary s);
	public boolean updateSalary(Salary s);
	public boolean deleteSalary(Salary s);
	public Salary getSalary(int eid,String month);
	public Salary getSalary(long TransactionId);
	public ArrayList<Salary> getSalaryByEmployee(int eid);	
	public String getDate(String date);
	public ArrayList<Salary> getSalary();
}
