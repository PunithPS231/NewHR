package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.SalaryDAO;
import in.hr.dao.SalaryDAOImpl;
import in.hr.dto.Employee;
import in.hr.dto.Salary;
import in.hr.index.PayslipGenerator;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payslip")
public class GeneratePayslip extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SalaryDAO sdao=new SalaryDAOImpl();
		HttpSession s=req.getSession(false);
		System.out.println(s);
		Employee e=(Employee)s.getAttribute("employee");
		String month="01 "+req.getParameter("month");
		System.out.println(month);
		month=sdao.getDate(month);
		Salary sal=sdao.getSalary(e.getEid(), month);
		String path=PayslipGenerator.generatePdf(e, sal);
		if(path!=null) {
			req.setAttribute("success","Payslip downloaded! go to <a href='file:///D:\\J2EE\\Employee\\Salary_Slip"+"\\"+sal.getEid()+"_"+sal.getMonth_year()+".pdf'>path</a>");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Password updated successfully!</h1>");
		}
		else {
			req.setAttribute("error","Failed to update password!");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
			//out.println("<h1>Failed to update password!</h1>");
		}
	}
}

