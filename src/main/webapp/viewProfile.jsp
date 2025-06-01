<%@page import="in.hr.servlets.ApplyLeave"%>
<%@page import="in.hr.dto.Tickets"%>
<%@page import="in.hr.dto.Apply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.hr.dao.TicketsDAOImpl"%>
<%@page import="in.hr.dao.TicketsDAO"%>
<%@page import="in.hr.dao.ApplyDAOImpl"%>
<%@page import="in.hr.dao.ApplyDAO"%>
<%@page import="in.hr.dto.Employee"%>
<%@ page import="in.hr.dto.Employee %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    body {
        background-color: #f4f6f9;
        font-family: 'Segoe UI', sans-serif;
    }
    .profile-container {
        max-width: 1100px;
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
        width: 30%;
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
<body>
<%
    Employee e = (Employee) session.getAttribute("employee");
    ApplyDAO adao=new ApplyDAOImpl();
    TicketsDAO tdao=new TicketsDAOImpl();
    ArrayList<Apply> leavesList=adao.getLeaveByEmployee(e.getEid());
    ArrayList<Tickets> ticketsList=tdao.getTicketsByEmployee(e.getEid());
%>

<div class="container profile-container">

    <!-- Page Header -->
    <div class="page-header">
        <a href="dashboard.jsp" class="btn btn-outline-light btn-sm">Back to Dashboard</a>
        <h2><i class="fas fa-id-card-alt"></i> Employee Profile</h2>
        <a href="updateAccount.jsp" class="btn btn-warning btn-sm">Update Account</a>
    </div>

    <!-- Profile Section -->
    <div class="card section-card">
        <div class="card-header">Basic Details</div>
        <div class="card-body">
            <table class="table table-bordered mb-0">
                <tr><th>Employee ID</th><td><%= e.getEid() %></td></tr>
                <tr><th>Name</th><td><%= e.getName() %></td></tr>
                <tr><th>Phone</th><td><%= e.getPhone() %></td></tr>
                <tr><th>Email</th><td><a href="mailto:<%= e.getMail() %>"><%= e.getMail() %></a></td></tr>
                <tr><th>Date of Birth</th><td><%= e.getDob() %></td></tr>
                <tr><th>Job Role</th><td><%= e.getJob() %></td></tr>
                <tr><th>Date of Joining</th><td><%= e.getDoj() %></td></tr>
                <tr><th>Salary</th><td><%= e.getSal() %></td></tr>
                <tr><th>Casual Leaves</th><td><%= e.getCl() %></td></tr>
                <tr><th>Sick Leaves</th><td><%= e.getSl() %></td></tr>
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
                        <%}%>
                        <td><%=t.getDate()%></td>
                        <%if(t.getStatus().equalsIgnoreCase("open")){%>
                        <td>
                        	<form action="deleteTicket">
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
                        <%}else if(a.getStatus().equalsIgnoreCase("approved")){%>
                        <td><div class="badge badge-pill badge-danger"><%=a.getStatus()%></div></td>
                        <%}else{%>
                         <td><div class="badge badge-pill badge-secondary"><%=a.getStatus()%></div></td>
                         <%}%>
                         <%if(a.getStatus().equalsIgnoreCase("pending")){%>
                         <td>
                         	<form action="deleteLeave">
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
