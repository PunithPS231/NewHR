<%@page import="in.hr.dto.Salary"%>
<%@page import="in.hr.dao.SalaryDAOImpl"%>
<%@page import="in.hr.dao.SalaryDAO"%>
<%@page import="in.hr.dao.EmployeeDAOImpl"%>
<%@page import="in.hr.dao.EmployeeDAO"%>
<%@page import="in.hr.servlets.ApplyLeave"%>
<%@page import="in.hr.dto.Tickets"%>
<%@page import="in.hr.dto.Apply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.hr.dao.TicketsDAOImpl"%>
<%@page import="in.hr.dao.TicketsDAO"%>
<%@page import="in.hr.dao.ApplyDAOImpl"%>
<%@page import="in.hr.dao.ApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="in.hr.dto.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>NewHR | Employee Dashboard</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/6.7.2/css/all.min.css"
	integrity="sha512-
Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>

    .profile-container {
        max-width: 100%;
        margin: 30px auto;
    }
    .section-card {
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        border-radius: 8px;
        margin-bottom: 30px;
    }
    .section-card .card-header {
        background-color: #343a40;
        color: white;
        font-size: 1.1rem;
        font-weight: 500;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }
    .table th {
       	width:20%;
        background-color: #f8f9fa;
        vertical-align: middle;
        
    }
    .page-header {
        background-color: #212529;
        color: white;
        padding: 15px 25px;
        border-radius: 8px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    .page-header h2 {
        margin: 0;
        font-weight: 500;
    }

</style>
</head>
<body class="bg-info">
<%
    Employee e =(Employee)session.getAttribute("employee");
	EmployeeDAO edao=new EmployeeDAOImpl();
	Employee e1=new Employee();
	if(request.getParameter("id")!=null){
		e1=edao.getEmployee(Integer.parseInt(request.getParameter("id")));
	}else{
		e1=e;   
	}
    ApplyDAO adao=new ApplyDAOImpl();
    TicketsDAO tdao=new TicketsDAOImpl();
    ArrayList<Apply> leavesList=adao.getLeaveByEmployee(e1.getEid());
    ArrayList<Tickets> ticketsList=tdao.getTicketsByEmployee(e1.getEid());
    
    SalaryDAO sdao=new SalaryDAOImpl();
    ArrayList<Salary> salList=sdao.getSalary();
%>

<div class="container profile-container">

<%
					if (request.getAttribute("success") != null) {
					%>
					<div
						class="alert alert-success alert-dismissible fade show notification"
						align="center" role="alert">
						<h5 align="center"><%=request.getAttribute("success")%></h5>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
					}
					%>
					<%
					if (request.getAttribute("error") != null) {
					%>
					<div
						class="alert alert-danger alert-dismissible fade show notification"
						align="center" role="alert">
						<h5 align="center"><%=request.getAttribute("error")%></h5>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
					}
					%>

    <!-- Page Header -->
    <div class="page-header">
        <a href="dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
        <h2><i class="fas fa-id-card-alt"></i> Salary Transactions</h2>
        <form action="updateAccount.jsp" method="post">
        <input type="hidden" name="id" value="<%=e1.getEid()%>">
        <button type="submit" class="btn btn-success">Visit Bank Page</button>
        </form>
       
    </div>

    <!-- Profile Section -->
    <div class="card section-card">
        <div class="card-header">Personal Info</div>
        <div class="card-body">
            <table class="table table-bordered mb-0">
            	<thead>
            	<tr>
            		
            		<th>Transaction ID</th>
            		<th>Employee ID</th>
            		<th>Salary</th>
            		<th>Month</th>
            		<th>Net Salary</th>
            		<th>Date Issued</th>
            		
            	<tr>
            	</thead>
            	<tbody>
            	<%for(Salary s:salList){%>
            		<tr>
            			
            			<td><%=s.getId()%></td>
            			<td><%=s.getEid()%></td>
            			<td><%=s.getSal()%></td>
            			<td><%=s.getMonth_year()%></td>
            			<td><%=s.getNetPay()%></td>
            			<td><%=s.getDate()%></td>
            		</tr>
            		<%}%>
            	</tbody>
            </table>
        </div>
    </div>

	
	



    

</div>

<!-- FontAwesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>