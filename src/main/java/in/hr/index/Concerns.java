package in.hr.index;

import java.util.ArrayList;
import java.util.Scanner;

import in.hr.dao.TicketsDAO;
import in.hr.dao.TicketsDAOImpl;
import in.hr.dto.Employee;
import in.hr.dto.Tickets;

public class Concerns {
	public static void view(Employee e) {
		Scanner sc=new Scanner(System.in);
		TicketsDAO tdao=new TicketsDAOImpl();
		ArrayList<Tickets> tickets=tdao.getTicket();
		for(Tickets t:tickets) {
			System.out.println(t);
		}
		System.out.println("Enter the ticket ID:");
		Tickets t=tdao.getTicket(sc.nextLong());
		System.out.println(t);
		System.out.println("<1> In progress");
		System.out.println("<2> Resolved");
		System.out.println("<3> Closed");
		switch(sc.nextInt()) {
		case 1:t.setStatus("In progress");
		break;
		case 2:t.setStatus("Resolved");
		break;
		case 3:t.setStatus("closed");
		break;
		default:System.out.println("Sorry! Ticket is still open.");
		}
		boolean res=tdao.updateTicket(t);
		if(res) {
			System.out.println("New Ticket status:"+t.getStatus());
		}
		else {
			System.out.println("Failed to update the status");
		}
	}
}
