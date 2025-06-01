package in.hr.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import in.hr.dao.EmployeeDAO;
import in.hr.dao.EmployeeDAOImpl;
import in.hr.dto.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao=new EmployeeDAOImpl();
		//PrintWriter out=resp.getWriter();
		Employee e=edao.getEmployee(Long.parseLong(req.getParameter("phone")) , req.getParameter("mail"));
		if(e!=null&&req.getParameter("password").equals(req.getParameter("confirm"))) {

			e.setPassword(req.getParameter("password"));
			boolean res=edao.updateEmployee(e);
			if(res) {
				req.setAttribute("success","Password updated successfully!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
				//out.println("<h1>Password updated successfully!</h1>");
			}
			else {
				req.setAttribute("error","Failed to update password!");
				RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
				rd.forward(req, resp);
				//out.println("<h1>Failed to update password!</h1>");
			}
		}
		else {
			req.setAttribute("error","Password mismatch!");
			RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Password mismatch!</h1>");
		}
	}
}
