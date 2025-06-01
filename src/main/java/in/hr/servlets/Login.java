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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession(true);
		EmployeeDAO edao=new EmployeeDAOImpl();
		//PrintWriter out=resp.getWriter();
		Employee e=edao.getEmployee(req.getParameter("mail"), req.getParameter("password"));
		if(e!=null) {
			s.setAttribute("employee", e);
			req.setAttribute("success","Logged in successfully!");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Logged in successfully!</h1>");
		}
		else {
			//out.println("<h1>Failed to login!</h1>");
		}
	}
}
