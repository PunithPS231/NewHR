package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.TicketsDAO;
import in.hr.dao.TicketsDAOImpl;
import in.hr.dto.Employee;
import in.hr.dto.Tickets;
import in.hr.index.RandomNumber;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/raiseTicket")
public class RaiseConcern extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		Employee e=(Employee)s.getAttribute("employee");
		
		TicketsDAO tdao=new TicketsDAOImpl();
		Tickets t=new Tickets();
		t.setId(RandomNumber.randomNumberGenerator());
		t.setEid(e.getEid());
		t.setSubject(req.getParameter("subject"));
		t.setAbout(req.getParameter("about"));
		
		boolean res=tdao.insertTicket(t);
		if(res) {
			req.setAttribute("success","Ticket raised!");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error","Failed to raise the ticket!");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}	
	}
}
