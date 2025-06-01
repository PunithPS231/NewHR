package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.EmployeeDAO;
import in.hr.dao.EmployeeDAOImpl;
import in.hr.dao.SalaryDAO;
import in.hr.dao.SalaryDAOImpl;
import in.hr.dto.Employee;
import in.hr.dto.Salary;
import in.hr.index.RandomNumber;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addSalary")
public class AddSalary extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession(false);
		Employee e=(Employee)s.getAttribute("employee");
		EmployeeDAO edao=new EmployeeDAOImpl();
		SalaryDAO sdao=new SalaryDAOImpl();
		Employee e1=edao.getEmployee(Integer.parseInt(req.getParameter("eid")));
		Salary sal=new Salary();
		sal.setId(RandomNumber.randomNumberGenerator());
		sal.setEid(e1.getEid());
		sal.setSal(e1.getSal());
		System.out.println(req.getParameter("month"));
		sal.setMonth_year(req.getParameter("month"));
		sal.setNetPay(e.getSal()-(e.getSal()*0.1));
		
		sal.setUrl("D:\\J2EE\\Employee\\Salary_Slip"+"\\"+sal.getEid()+"_"+sal.getMonth_year()+".pdf");
		boolean res=sdao.insertSalary(sal);
		if(res) {
			req.setAttribute("success", "Salary credited to "+e1.getName());
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "Failed to credit the salary to "+e1.getName());
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
	}
}
