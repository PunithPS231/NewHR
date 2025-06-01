<%@page import="in.hr.dao.EmployeeDAOImpl"%>
<%@page import="in.hr.dao.EmployeeDAO"%>
<%@page import="in.hr.dto.Tickets"%>
<%@page import="in.hr.dao.TicketsDAOImpl"%>
<%@page import="in.hr.dao.TicketsDAO"%>
<%@page import="in.hr.dto.Apply"%>
<%@page import="java.util.ArrayList"%>
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
body {
	background-color: #f8f9fa;
}

.sidebar {
	min-height: 100vh;
	background-color: #343a40;
}

.sidebar a {
	color: #fff;
	padding: 15px 20px;
	display: block;
	font-size: 16px;
}

.sidebar a:hover {
	background-color: #495057;
	text-decoration: none;
}

.card-box {
	padding: 20px;
	border-radius: 10px;
	color: white;
	text-align: center;
}

.header-title {
	font-weight: bold;
}

.logo {
	width: 120px;
	height: 160px;
	display: flex;
	position: relative;
	left: 65px;
	background-color: white;
}

.button {
	height: 40px;
	position: relative;
	left: 850px;
}

.notification {
	width: 300px;
	text-align: center;
	position: fixed;
	top: 20px;
	left: 750px;
	z-index: 9999;
}

.name {
	position: relative;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row no-gutters">
			<%
			Employee e = (Employee) session.getAttribute("employee");
			EmployeeDAO edao = new EmployeeDAOImpl();
			ArrayList<Employee> empList = edao.getEmployee(); //admin part
			ApplyDAO adao = new ApplyDAOImpl();
			ArrayList<Apply> leavesList = adao.getLeaveByEmployee(e.getEid());
			ArrayList<Apply> leaveStatus = adao.getLeave();//admin part
			TicketsDAO tdao = new TicketsDAOImpl();
			ArrayList<Tickets> ticketsList = tdao.getTicketsByEmployee(e.getEid());
			ArrayList<Tickets> ticketStatus = tdao.getTicket(); //admin part
			%>
			<!-- Sidebar -->
			<div class="col-md-2 sidebar">
				<div class="brand">
					<img class="logo" alt="" src="images/logo.png">
				</div>
				<a href="dashboard.jsp">Home</a> 
				<a href="viewAccount.jsp">View Profile</a>
				<%
				if (e.getEid() == 1001) {
				%>
				<a href="viewLeaves.jsp">Leaves Approval</a> 
				<a href="employees.jsp">View Employees</a> 
				<a href="salaries.jsp">View Salary</a>
				<%
				}
				else {
				%>
				<a href="viewLeaves.jsp">Leave Status</a>
				 <a href="resignation.jsp">Submit Resignation</a>
				<%
				}
				%>
				<a href="updateAccount.jsp">Update account</a> 
				<a href="resetPin.jsp">Reset Pin</a> 
				<a href="#">About us</a>
			</div>
			<!-- Main Content -->
			<div class="col-md-10 p-4">
				<div class="col-md-10 p-4 d-flex">
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

					<div class="d-flex name">
						<h3 class="mb-4">
							Welcome,
							<%=e.getName()%></h3>
					</div>
					<form action="logout" method="post">
					<button type="submit" class="btn btn-danger button" name="logout">Logout</button>
					</form>
				</div>

				<!-- Dashboard Cards -->

				<div class="row">
					<%
					if (e.getEid() == 1001) {
					%>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-primary">
							<h6 class="header-title">Employees Count</h6>
							<h3><%=empList.size()%></h3>
						</div>
					</div>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-success">
							<h6 class="header-title">This Month's Salary</h6>
							<h3>
								Rs<%=e.getSal()%>0
							</h3>
						</div>
					</div>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-warning">
							<h6 class="header-title">Tickets to Resolve</h6>
							<h3><%=ticketStatus.size()%></h3>
						</div>
					</div>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-info">
							<h6 class="header-title">Leaves Pending</h6>
							<h3>
								SL :
								<%=e.getSl()%>
								CL :
								<%=e.getCl()%></h3>
						</div>
					</div>
					<%
					} else {
					%>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-primary">
							<h6 class="header-title">Total Leaves Taken</h6>
							<h3><%=leavesList.size()%></h3>
						</div>
					</div>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-success">
							<h6 class="header-title">This Month's Salary</h6>
							<h3>
								Rs.
								<%=e.getSal()%>0
							</h3>
						</div>
					</div>
					<div class="col-md-3 mb-4">
						<div class="card-box bg-warning">
							<h6 class="header-title">Open Tickets</h6>
							<h3><%=ticketsList.size()%></h3>
						</div>
					</div>

					<div class="col-md-3 mb-4">
						<div class="card-box bg-info">
							<h6 class="header-title">Leaves Pending</h6>
							<h3>
								SL :
								<%=e.getSl()%>
								CL :
								<%=e.getCl()%></h3>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<!-- Payslip & Leave Form -->

				<div class="row">
					<%
					if (e.getEid() == 1001) {
					%>
					<div class="col-md-6 mb-4">
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Add Salary</div>
							<div class="card-body">
								<form action="addSalary" method="post">
									<div class="form-group">
										<label for="eid">Employee ID</label> <input type="number"
											class="form-control" id="eid" name="eid"
											placeholder="Employee ID" required min="1002">
									</div>
									<div class="form-group">
										<label for="month">Month</label> <input class="form-control"
											type="month" id="month" name="month" required>
									</div>
									<button class="btn btn-success">Add Salary</button>
								</form>
							</div>
						</div>
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Fire Employee</div>
							<div class="card-body">
								<form>
									<div class="form-group">
										<label for="eid">Employee ID</label> <input type="number"
											class="form-control" id="eid" name="eid"
											placeholder="Employee ID" required min="1002">
									</div>
									<button class="btn btn-danger">Fire</button>
								</form>
							</div>
						</div>
					</div>
						<div class="col-md-6 mb-4">
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Add an Employee</div>
							<div class="card-body">
								<form action="signup" method="post">
									<div class="form-group">
										<div class="col">
											<input type="text"
												class="form-control" id="name" name="name"
												required placeholder="Name">
										</div>
									</div>
									<div class="form-row">
										<div class="col-md-6 mb-3">
											<input type="tel"
												class="form-control" id="phone" name="phone"
												required placeholder="Phone" maxlength="10">
										</div>
										<div class="col-md-6 mb-3">
											<input type="email"
												class="form-control" id="mail" name="end-date" required
												placeholder="Email ID">
										</div>
									</div>
									<div class="form-row">
										<div class="col-md-6 mb-3">
										<label for="dob">Date of Birth</label>
											<input type="date"
												class="form-control" id="dob" name="dob"
												required>
										</div>
										<div class="col-md-6 mb-3">
										<label for="doj">Date of Joining</label>
											<input type="date"
												class="form-control" id="doj" name="doj" required>
										</div>
									</div>
									<div class="form-row">
									<div class="col-md-6 mb-3">
										<label for="job">Job</label><select
											class="form-control" id="job" name="job">
											<option>Accountant</option>
											<option>Business Analyst</option>
											<option>Developer</option>
											<option>Manager</option>
											<option>Operation Analyst</option>
											<option>Salesman</option>
										</select>
									</div>
									<div class="col-md-6 mb-3">
									<label for="sal">Salary</label>
											<input type="number"
												class="form-control" id="sal" name="sal" required>
									</div>
									</div>
									<button type="submit" class="btn btn-success">Add Employee</button>
								</form>
							</div>
						</div>
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Search Employee</div>
							<div class="card-body">
								<form action="search" method="post">
									<div class="form-row">
										<div class="col-md-6 mb-3">
												<input type="search"
												class="form-control" id="id" name="id" required
												placeholder="Employee ID">
										</div>
										<div class="col-md-6">
											<button type="submit" class="btn btn-primary">Search</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
					} else {
					%>
					<div class="col-md-6 mb-4">
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Raise Concern</div>
							<div class="card-body">
								<form action="raiseTicket" method="post">
									<div class="form-group">
										<label for="subject">Subject</label> <input type="text"
											class="form-control" id="subject" name="subject" required>
									</div>
									<div class="form-group">
										<label>Description</label>
										<textarea class="form-control" name="about" rows="2"></textarea>
									</div>
									<button class="btn btn-danger">Raise Concern</button>
								</form>
							</div>
						</div>

						<div class="card shadow">
							<div class="card-header bg-dark text-white">Download Payslip</div>
							<div class="card-body">
								<form action="payslip" method="post">
									<div class="form-group">
										<label for="month">Select Month</label>
										 <select class="form-control" name="month" id="month">
											<option>January 2025</option>
											<option>February 2025</option>
											<option>March 2025</option>
											<option>April 2025</option>
											<option>May 2025</option>
										</select>
									</div>
									<button class="btn btn-primary">Download PDF</button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-4">
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Apply for Leave</div>
							<div class="card-body">
								<form action="applyLeave" method="post">
									<div class="form-group">
										<label>Leave Type</label> <select name="leaveType"
											class="form-control">
											<option value="Sick Leave">Sick Leave</option>
											<option value="Casual Leave">Casual Leave</option>
										</select>
									</div>
									<div class="form-row">
										<div class="col-md-6 mb-3">
											<label for="start-date">Start-Date</label> <input type="date"
												class="form-control" id="start-date" name="start-date"
												required placeholder="Date of Birth" value="">
										</div>
										<div class="col-md-6 mb-3">
											<label for="end-date">End-Date</label> <input type="date"
												class="form-control" id="end-date" name="end-date" required
												placeholder="Date of joining">
										</div>
									</div>
									<div class="form-group">
										<label>Reason</label>
										<textarea class="form-control" name="reason" rows="2"></textarea>
									</div>
									<button type="submit" class="btn btn-success">Apply</button>
								</form>
							</div>
						</div>
					
						<div class="card shadow">
							<div class="card-header bg-dark text-white">Search Employee</div>
							<div class="card-body">
								<form action="search" method="post">
									<div class="form-row">
										<div class="col-md-6 mb-3">
												<input type="search"
												class="form-control" id="id" name="id" required
												placeholder="Employee ID">
										</div>
										<div class="col-md-6">
											<button type="submit" class="btn btn-primary">Search</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<!-- Tickets Table -->

				<div class="card shadow mb-4">
					<div class="card-header bg-dark text-white">Your Concerns</div>
					<div class="card-body p-0">
						<table class="table table-bordered mb-0">
							<thead class="thead-light">
								<tr align="center">
									<th>Ticket ID</th>
									<th>Concern</th>
									<th>Status</th>
									<th>Withdraw</th>
								</tr>
							</thead>
							<%
							for (Tickets t : ticketsList) {
							%>
							<tbody>
								<tr align="center">
									<td><%=t.getId()%></td>
									<td><%=t.getSubject()%></td>

									<%
									if (t.getStatus().equalsIgnoreCase("In progress")) {
									%>
									<td><span class="badge badge-danger"><%=t.getStatus()%></span></td>
									<%
									} else if (t.getStatus().equalsIgnoreCase("open")) {
									%>
									<td><span class="badge badge-warning"><%=t.getStatus()%></span></td>
									<%
									} else if (t.getStatus().equalsIgnoreCase("resolved")) {
									%>
									<td><span class="badge badge-success"><%=t.getStatus()%></span></td>
									<%
									} else {
									%>
									<td><span class="badge badgesecondary"><%=t.getStatus()%></span></td>
									<%
									}
									%>
									<%
									if (t.getStatus().equalsIgnoreCase("Open")) {
									%>
									<td>
										<form action="withdrawLeave" method="post">
											<input type="hidden" name="<%=t.getId()%>">
											<button type="submit" class="btn btn-outline-danger">Withdraw</button>
										</form>
									</td>
									<%
									} else {
									%>
									<td><button type="submit" class="btn btn-outline-dark"
											disabled="disabled">Withdraw</button></td>
									<%
									}
									%>
								</tr>

								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>

				<%-- <%ArrayList<Apply> resigns=adao.resignByEmployee();%>
 <!-- Resignation Status -->
 <div class="card shadow">
 <div class="card-header bg-danger text-white">Resignation Status</div>
 <div class="card-body">
 <p><strong>Status:</strong> Pending</p>
 <p><strong>Applied On:</strong> 2025-04-20</p>
 </div>
 </div>
 </div> --%>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
