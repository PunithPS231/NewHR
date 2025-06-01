package in.hr.index;

import java.util.Scanner;

import in.hr.dao.TicketsDAO;
import in.hr.dao.TicketsDAOImpl;
import in.hr.dto.Employee;
import in.hr.dto.Tickets;

public class Concern {
	public static void raiseTicket(Employee e) {
		Tickets t=new Tickets();
		TicketsDAO tdao=new TicketsDAOImpl();
		Scanner sc=new Scanner(System.in);
		t.setId(RandomNumber.randomNumberGenerator());
		t.setEid(e.getEid());
		System.out.println("Enter the Subject");
		t.setSubject(sc.nextLine());
		//sc.nextLine();
		System.out.println("Description:");
		t.setAbout(sc.nextLine());
		boolean res=tdao.insertTicket(t);
		if(res) {
			System.out.println("Ticket has been raised!");
		}
		else {
			System.out.println("Failed to raise the ticket");
		}	
	}
}
