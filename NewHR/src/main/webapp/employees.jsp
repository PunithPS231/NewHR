<%@page import="in.hr.dto.Apply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.hr.dao.EmployeeDAOImpl"%>
<%@page import="in.hr.dao.EmployeeDAO"%>
<%@page import="in.hr.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 .profile-container {
        max-width: 100%;
        margin: 30px auto;
    }
 .logo {
		width:120px;
		height:160px; 
		display:flex;
		position: relative;
		left:65px; 
		background-color: white;
		
    }
    .button{
    	height:40px;
    	position: relative;
    }
    .notification{
    	width:300px;
    	text-align:center;
    	position:fixed;
    	top:20px;
    	left:750px;
    	
    	z-index:9999;
    	
    }
    .name{
    	position:relative;
    	
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
 <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/6.7.2/css/all.min.css"
	integrity="sha512-
Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap 4 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body class="bg-info">

		<%Employee e=(Employee)session.getAttribute("employee");
		EmployeeDAO edao=new EmployeeDAOImpl();
		ArrayList<Employee> empList = edao.getEmployee();
	%>
	
	<div class="container profile-container">
	<div class="page-header">
        <a href="dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
        <h2><i class="fas fa-id-card-alt"></i> Employee Profiles</h2>
        <a href="updateAccount.jsp" class="btn btn-outline-warning">Modify admin</a>
    </div>
	  
    <%if(request.getAttribute("success")!=null) {%>
    <div class="alert alert-success alert-dismissible fade show notification" align="center" role="alert">
  	<h5 align="center"><%=request.getAttribute("success")%></h5>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%}%>
     <%if(request.getAttribute("error")!=null) {%>
    <div class="alert alert-danger alert-dismissible fade show notification" align="center" role="alert">
  	<h5 align="center"><%=request.getAttribute("error")%></h5>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
    <%}%>
     
     
      <div class="card shadow mb-4">
        <div class="card-header bg-dark text-white">Your Leaves</div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0">
            <thead class="thead-light">
              <tr align="center">
                <th>Employee ID</th>
                <th>Name</th>
                <th>Job</th>
                <th>Salary</th>
                <th>Status</th>
                <th>View</th>
                
              </tr>
            </thead>
            <%for(Employee e1:empList){%>
            <tbody>
              <tr align="center">
                <td><%=e1.getEid()%></td>
                <td><%=e1.getName()%></td>
				<td><%=e1.getJob()%></td>
				<td><%=e1.getSal()%> 
                <%if(e1.getStatus().equalsIgnoreCase("active")){%>
                <td><span class="badge badge-pill badge-success"><%=e1.getStatus()%></span></td>
                 <%}else{%>
               		<td><span class="badge badge-secondary"><%=e1.getStatus()%></span></td> 
                <%}%>
                <%if(e1.getStatus().equalsIgnoreCase("active")){%>
                <td>
                	<form action="viewAccount.jsp" method="post">
 						<input type="hidden" name="id" value="<%=e1.getEid()%>">
 						<button type="submit" class="btn btn-outline-primary">View</button>             	
                	</form>
                </td>
                <%}%>
              </tr>
              <tr>
            <%}%>
            </tbody>
          </table>
        </div>
      </div>
</body>
</html>