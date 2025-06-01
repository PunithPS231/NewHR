package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.ApplyDAO;
import in.hr.dao.ApplyDAOImpl;
import in.hr.dto.Apply;
import in.hr.dto.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/approveLeave")
public class ApproveLeave extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		Employee e=(Employee)s.getAttribute("employee");
		ApplyDAO adao=new ApplyDAOImpl();
		Apply a =adao.getLeave(Integer.parseInt(req.getParameter("id")));
		if(e.getEid()==1001) {
			a.setStatus(req.getParameter("status"));
			boolean res=adao.updateLeave(a);
			if(res) {
				req.setAttribute("success","Leave updated successfully!");
				RequestDispatcher rd=req.getRequestDispatcher("viewLeaves.jsp");
				rd.forward(req, resp);	
			}
			else {
				req.setAttribute("error","Failed to update Leave!");
				RequestDispatcher rd=req.getRequestDispatcher("viewLeaves.jsp");
				rd.forward(req, resp);	
			}
		}
	}
}
