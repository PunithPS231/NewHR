package in.hr.index;

import java.util.Scanner;

import in.hr.dao.EmployeeDAO;
import in.hr.dao.EmployeeDAOImpl;
import in.hr.dto.Employee;

public class Login {
	public static void login() {
		Scanner sc=new Scanner(System.in);

		System.out.println("Enter the Mail ID:");
		String mail=sc.next();
		System.out.println("Enter the password:");
		String password=sc.next();

		EmployeeDAO edao=new EmployeeDAOImpl();
		Employee e=edao.getEmployee(mail, password);
		if(e!=null) {
			if(e.getEid()==1001)
			//if(e.getJob().equals("CEO")||e.getJob().equals("Manager")) 
			{
				System.out.println("Login successful! Welcome Admin:"+e.getName()+",");
				Admin.admin(e);
			}
			else {
				System.out.println("Login successful! Welcome "+e.getName()+",");
				App.options(e);
			}
		}
		else {
			System.out.println("Failed to login!");
		}
	}
}
