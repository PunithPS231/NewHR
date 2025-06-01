package in.hr.servlets;

import java.io.IOException;

import in.hr.dao.ApplyDAO;
import in.hr.dao.ApplyDAOImpl;
import in.hr.dao.EmployeeDAO;
import in.hr.dao.EmployeeDAOImpl;
import in.hr.dto.Apply;
import in.hr.dto.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/applyLeave")
public class ApplyLeave extends HttpServlet{
	public static int leaveCount; 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ApplyDAO adao=new ApplyDAOImpl();
		EmployeeDAO edao=new EmployeeDAOImpl();
		Apply a=new Apply();
		boolean res=false;
		boolean empUpdate=false;

		HttpSession s=req.getSession(false);
		Employee e=(Employee)s.getAttribute("employee");
		if(e.getCl()>0&&e.getSl()>0) {
			a.setEid(e.getEid());
			a.setType(req.getParameter("leaveType"));

			a.setStart_date(req.getParameter("start-date"));
			int res1=adao.dateCheck(a.getStart_date());
			//res1=2

			a.setEnd_date(req.getParameter("end-date"));
			int res2=adao.dateCheck(a.getEnd_date());
			//res2=2
			a.setReason(req.getParameter("reason"));
			leaveCount=(res2-res1)+1;

			if(a.getType().equalsIgnoreCase("Casual Leave")&&res2-res1<=e.getCl()&&e.getCl()-leaveCount>=0) {
				
				e.setCl(e.getCl()-leaveCount);
				empUpdate=edao.updateEmployee(e);
				res=adao.insertLeave(a);
				System.out.println(res);
			}
			else if(a.getType().equalsIgnoreCase("Sick Leave")&&res2-res1<=e.getSl()&&e.getSl()-leaveCount>=0) {
				e.setSl(e.getSl()-leaveCount);
				empUpdate=edao.updateEmployee(e);
				res=adao.insertLeave(a);
				//System.out.println(res);
				}else {
					req.setAttribute("error","Failed to apply leave!");
					RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
					rd.forward(req, resp);	
				}
			}
			else {
				req.setAttribute("error","Failed to apply leave!");
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);	
			}
			if(res&&empUpdate) {
				req.setAttribute("success",a.getType()+" applied!");
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);	
			}
			else {
				req.setAttribute("error","Failed to apply leave!");
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);	
			}
		}  
	}
