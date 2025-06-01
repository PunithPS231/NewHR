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

@WebServlet("/signup")
public class Signup extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//collect the request from the user
		Employee e=new Employee();
		EmployeeDAO edao=new EmployeeDAOImpl();
		//PrintWriter out=resp.getWriter();
		//String name=req.getParameter("name");
		//e.setName(name);
		e.setName(req.getParameter("name"));
		
		//String phone=req.getParameter("phone");//string format phone
		//long phones=Long.parseLong(phone);//string converted to long
		//e.setPhone(phones);//setting the phone to emp object
		
		e.setPhone(Long.parseLong(req.getParameter("phone")));
		e.setMail(req.getParameter("mail"));
		e.setJob(req.getParameter("job"));
		e.setDob(req.getParameter("dob"));
		e.setDoj(req.getParameter("doj"));
		if(req.getParameter("password").equals(req.getParameter("confirm"))) {
			e.setPassword(req.getParameter("password"));
			e.setStatus("active");
			boolean res=edao.insertEmployee(e);
			if(res) {
				req.setAttribute("success","Data added successfully!");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
				//out.println("<h3>Data saved successfully!</h3>");
			}
			else
			{
				req.setAttribute("error","Failed to save data!");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
				//out.println("<h3>Failed to print the data</h3>");
			}
		}
		else
		{
			req.setAttribute("error","Password mismatch!");
			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			rd.forward(req, resp);
			//out.println("<h3>Password mismatch!</h3>");
		}	
	}
}
