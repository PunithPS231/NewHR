package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.TicketsDAO;
import in.hr.dao.TicketsDAOImpl;
import in.hr.dto.Tickets;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/deleteTicket")
public class DeleteTicket extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TicketsDAO tdao=new TicketsDAOImpl();
		Tickets t=new Tickets();
		t.setId(Long.parseLong(req.getParameter("id")));
		boolean res=tdao.deleteTicket(t);
		if(res) {
		req.setAttribute("success","Ticket withdrawn.");
		RequestDispatcher rd=req.getRequestDispatcher("viewAccount.jsp");
		rd.forward(req, resp);
		}
		else {
			req.setAttribute("error","Ticket Can't be returned.");
			RequestDispatcher rd=req.getRequestDispatcher("viewAccount.jsp");
			rd.forward(req, resp);
			
		}
		
		
	}

}
