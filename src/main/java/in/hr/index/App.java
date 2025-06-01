package in.hr.index;

import java.util.ArrayList;
import java.util.Scanner;

import in.hr.dao.ApplyDAO;
import in.hr.dao.ApplyDAOImpl;
import in.hr.dao.SalaryDAO;
import in.hr.dao.SalaryDAOImpl;
import in.hr.dao.TicketsDAO;
import in.hr.dao.TicketsDAOImpl;
import in.hr.dto.Apply;
import in.hr.dto.Employee;
import in.hr.dto.Salary;
import in.hr.dto.Tickets;

public class App {
	public static void options(Employee e) {
		Scanner sc=new Scanner(System.in);
		ApplyDAO adao=new ApplyDAOImpl();
		TicketsDAO tdao=new TicketsDAOImpl();
	
		int i=0;
		do {
			System.out.println("Choose options");
			System.out.println("<1> View Data");
			System.out.println("<2> Apply for Leave");
            System.out.println("<3> View Leave Status");
            //System.out.println("<4> View Tasks");
            System.out.println("<4> Download Payslip");
            System.out.println("<5> Raise a Concern");
            System.out.println("<6> View Raised Concerns");
            System.out.println("<7> Submit Resignation");
            
            System.out.println("<8> Logout");
            
            switch(i=sc.nextInt()) 
            {
            	case 1: System.out.println(e);
            	break;
            	
            	case 2: Leave.applyLeave(e);
            	break;
            	
            	case 3: System.out.println("Leaves applied:");
            	ArrayList<Apply> leavesList=adao.getLeaveByEmployee(e.getEid());
            	for(Apply a:leavesList) {
            		System.out.println(a);
            	}
            	break;
            	
            	case 4:
            		System.out.println("Enter month (MM/YYYY): ");
            	    String month = sc.next();

            	    SalaryDAO sdao = new SalaryDAOImpl();

            	    Salary sal = sdao.getSalary(e.getEid(), month);
            	    
            	    if (sal != null) {
            	        String path = PayslipGenerator.generatePdf(e, sal);
            	        if (path != null) {
            	            System.out.println("Payslip downloaded successfully: " + path);
            	        } else {
            	            System.out.println("Failed to generate payslip.");
            	        }
            	    } else {
            	        System.out.println("No salary record found for " + month);
            	    }
            	    break;
            	
            	case 5:Concern.raiseTicket(e);
            	break;
            	
            	case 6:System.out.println("Your ticket status:");
            	ArrayList<Tickets> tickets=tdao.getTicketsByEmployee(e.getEid());
            	for(Tickets t:tickets) {
            		System.out.println(t);
            	}
            	break;
            	
            	case 7:Leave.applyLeave(e);
            	break;
            	
            	case 8:System.out.println("Back to main menu!");
            	break;
            	
            	default:System.out.println("Invalid choice!");
            }	
		}while(i!=8);
	}
}
