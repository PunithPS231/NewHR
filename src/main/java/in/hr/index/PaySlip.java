package in.hr.index;

import java.util.ArrayList;

import java.util.Scanner;

import in.hr.dao.EmployeeDAO;
import in.hr.dao.EmployeeDAOImpl;
import in.hr.dao.SalaryDAO;
import in.hr.dao.SalaryDAOImpl;
import in.hr.dto.Apply;
import in.hr.dto.Employee;
import in.hr.dto.Salary;

public class PaySlip {
	public static void generatePayslip(Employee e) {
		Salary s=new Salary();
		Scanner sc=new Scanner(System.in);
		SalaryDAO sdao=new SalaryDAOImpl();
		EmployeeDAO edao=new EmployeeDAOImpl();
		ArrayList<Employee> eList=edao.getEmployee();
		for(Employee emp:eList) {
			System.out.println(emp);
		}
		s.setId(RandomNumber.randomNumberGenerator());
		System.out.println("Enter the Employee ID:");
		s.setEid(sc.nextInt());
		System.out.println("Enter the month (mm/yyyy):");
		s.setMonth_year(sc.next());
		System.out.println("Enter the Salary:");
		s.setSal(sc.nextDouble());
		s.setNetPay(s.getSal()-(s.getSal()*10/100));
		String path="D:\\J2EE\\Employee\\Salary_Slip"+"\\"+s.getEid()+"_"+s.getMonth_year()+".pdf";
		System.out.println(path);
		s.setUrl(path);
		boolean res=sdao.insertSalary(s);
		if(res) {
			System.out.println("Salary credited to "+s.getEid());
		}
		else {
			System.out.println("Failed to credit the salary!");
		}
	}
}
