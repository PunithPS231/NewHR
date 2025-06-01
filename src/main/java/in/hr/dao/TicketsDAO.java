package in.hr.dao;

import java.util.ArrayList;

import in.hr.dto.Tickets;

public interface TicketsDAO {
	public boolean insertTicket(Tickets t);
	public boolean updateTicket(Tickets t);
	public boolean deleteTicket(Tickets t);
	public Tickets getTicket(long ticketId);
	//public Tickets getTicket(long ticketId,int eid);
	public ArrayList<Tickets> getTicketsByEmployee(int eid);
	public ArrayList<Tickets> getTicket();
}
