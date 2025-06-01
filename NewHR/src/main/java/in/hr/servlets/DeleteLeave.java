package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.ApplyDAO;
import in.hr.dao.ApplyDAOImpl;
import in.hr.dto.Apply;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/withdrawLeave")
public class DeleteLeave extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession();
		ApplyDAO adao=new ApplyDAOImpl();
		Apply a=new Apply();
		a.setId(Integer.parseInt(req.getParameter("id")));
		int leaveCount=ApplyLeave.leaveCount;
		boolean res=adao.deleteLeave(a);
		if(res) {
			
			req.setAttribute("success","Leave withdrawn!");
			RequestDispatcher rd=req.getRequestDispatcher("viewLeaves.jsp");
			rd.forward(req, resp);
		}
		else
		{
			req.setAttribute("error","Couldn't withdraw leave!");
			RequestDispatcher rd=req.getRequestDispatcher("viewLeaves.jsp");
			rd.forward(req, resp);
		}
	}
}
