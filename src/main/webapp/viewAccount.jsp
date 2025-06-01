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
        <h2><i class="fas fa-id-card-alt"></i> Employee Profile</h2>
        <form action="updateAccount.jsp" method="post">
        <input type="hidden" name="id" value="<%=e1.getEid()%>">
        <button type="submit" class="btn btn-outline-warning">Update Account</button>
        </form>
    </div>

    <!-- Profile Section -->
    <div class="card section-card">
        <div class="card-header">Personal Info</div>
        <div class="card-body">
            <table class="table table-bordered mb-0">
            	<thead>
            	<tr>
            		
            		<th>Name</th>
            		<th>Phone</th>
            		<th>Mail ID</th>
            		<th>Date of Birth</th>
            	<tr>
            	</thead>
            	<tbody>
            		<tr>
            			
            			<td><%=e1.getName()%></td>
            			<td><%=e1.getPhone()%></td>
            			<td><%=e1.getMail()%></td>
            			<td><%=e1.getDob()%></td>
            		</tr>
            	</tbody>
            </table>
        </div>
    </div>

	<div class="card section-card">
        <div class="card-header">Designation Info</div>
        <div class="card-body">
            <table class="table table-bordered mb-0">
            	<thead>
            	<tr>
            		<th>Employee ID</th>
            		<th>Job Role</th>
            		<th>Date of Joining</th>
            		<th>Salary</th>
            		
            	<tr>
            	</thead>
            	<tbody>
            		<tr>
            			<td><%=e1.getEid()%></td>
            			<td><%=e1.getJob()%></td>
            			<td><%=e1.getDoj()%></td>
            			<td><%=e1.getSal()%></td>
            		</tr>
            	</tbody>
            </table>
        </div>
    </div>
	

    <!-- Tickets Table -->
    <div class="card section-card">
        <div class="card-header">Tickets Raised</div>
        <div class="card-body p-0">
            <table class="table table-bordered table-hover mb-0">
                <thead class="thead-light">
                    <tr>
                        <th>Ticket ID</th>
                        <th>Issue</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (ticketsList != null && !ticketsList.isEmpty()) {
                        for (Tickets t : ticketsList) {
                %>
                    <tr>
                        <td><%= t.getId()%></td>
                        <td><%= t.getSubject()%></td>
                        <%if(t.getStatus().equalsIgnoreCase("In progress")){%>
                        <td><div class="badge badge-pill badge-warning"><%=t.getStatus()%></div></td>
                        <%}else if(t.getStatus().equalsIgnoreCase("Open")){%>
                        <td><div class="badge badge-pill badge-danger"><%=t.getStatus()%></div></td>
                         <%}else if(t.getStatus().equalsIgnoreCase("Resolved")){%>
                        <td><div class="badge badge-pill badge-success"><%=t.getStatus()%></div></td>
                        <%}else{%>
                        <td><div class="badge badge-pill badge-secondary"><%=t.getStatus()%></div></td>
                        <%}%>
                        <td><%=t.getDate()%></td>
                        <%if(t.getStatus().equalsIgnoreCase("open")){%>
                        <td>
                        	<form action="deleteTicket" method="post">
                        		<input type="hidden" id="id" name="id" value="<%=t.getId()%>">
                        		<button type="submit" class="btn btn-outline-danger">Withdraw</button>
                        	</form>
                        </td>
                        <%}else{%>
                       	 	<button class="btn btn-outline-dark" disabled="disabled">Withdraw</button>
                        <%}%>
                    </tr>
                	<%}
                    } else {%>
                    <tr><td colspan="5" class="text-center text-muted">No tickets found.</td></tr>
                <%}%>
                
                </tbody>
            </table>
        </div>
    </div>

    <!-- Leaves Table -->
    <div class="card section-card">
        <div class="card-header">Leave Status</div>
        <div class="card-body p-0">
            <table class="table table-bordered table-hover mb-0">
                <thead class="thead-light">
                    <tr>
                        <th>Leave ID</th>
                        <th>Type</th>
                        <th>From - To</th>
                        <th>Days</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if (leavesList != null && !leavesList.isEmpty()) {
                        for (Apply a : leavesList) {
                %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><%= a.getType() %></td>
                        <td><%= a.getStart_date() %> - <%= a.getEnd_date()%></td>
                        <td><%=ApplyLeave.leaveCount%></td>
                        <td><%=a.getReason()%></td>
                        <%if(a.getStatus().equalsIgnoreCase("pending")){ %>
                        <td><div class="badge badge-pill badge-warning"><%=a.getStatus()%></div></td>
                        <%}else if(a.getStatus().equalsIgnoreCase("approved")){ %>
                        <td><div class="badge badge-pill badge-success"><%=a.getStatus()%></div></td>
                        <%}else if(a.getStatus().equalsIgnoreCase("rejected")){%>
                        <td><div class="badge badge-pill badge-danger"><%=a.getStatus()%></div></td>
                        <%}else{%>
                         <td><div class="badge badge-pill badge-secondary"><%=a.getStatus()%></div></td>
                         <%}%>
                         <%if(a.getStatus().equalsIgnoreCase("pending")){%>
                         <td>
                         	<form action="deleteLeave" method="post">
                         		<input type="hidden" name="id" value="<%=a.getId()%>">
                         		<button type="submit" class="btn btn-outline-danger">Withdraw</button>
                         	</form>
                         </td>
                         <%}else{%>
                         <td><button class="btn btn-outline-dark" disabled="disabled">Withdraw</button></td>
                         <%}%>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="5" class="text-center text-muted">No leave records found.</td></tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- FontAwesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>