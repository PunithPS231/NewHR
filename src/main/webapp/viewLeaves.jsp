<%@page import="in.hr.servlets.ApplyLeave"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.hr.dto.Employee"%>
<%@page import="in.hr.dao.ApplyDAOImpl"%>
<%@page import="in.hr.dao.ApplyDAO"%>
<%@page import="in.hr.dto.Apply"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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


</head>
<body class="bg-info">

	<%Employee e=(Employee)session.getAttribute("employee");
	if(e!=null){
		ApplyDAO adao=new ApplyDAOImpl();
		ArrayList<Apply> leavesList = adao.getLeaveByEmployee(e.getEid());
		ArrayList<Apply> leaveStatus= adao.getLeave();
		
	%>
	
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
	
	<div class="container profile-container">
	<div class="page-header">
        <a href="dashboard.jsp" class="btn btn-danger">Back to Dashboard</a>
        <h2><i class="fas fa-id-card-alt"></i> Employee Profile</h2>
        <a href="updateAccount.jsp" class="btn btn-outline-warning">Update Account</a>
    </div>
	  
    
     
     
      <div class="card shadow mb-4">
      
      <%if(e.getEid()==1001){%>
      <div class="card-header bg-dark text-white">Leaves Approvals</div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0">
            <thead class="thead-light">
              <tr align="center">
                <th>Leave ID</th>
                <th>Employee ID</th>
                <th>Type</th>
                <th>From</th>
                <th>To</th> 
                <th>Days</th>
                <th>Status</th>
                <th>Approve</th>
                
              </tr>
            </thead>
            <%for(Apply a:leaveStatus){%>
            <tbody>
              <tr align="center">
                <td><%=a.getId()%></td>
                <td><%=a.getEid()%></td>
                <td><%=a.getType()%></td>
				<td><%=a.getStart_date()%></td>
				<td><%=a.getEnd_date()%> 
				<td><%=ApplyLeave.leaveCount%></td>
               <form action="approveLeave" method="post">
                <td>
					<select class="form-control" name="status" id="status">
					<option class="badge badge-pill badge-warning">Pending</option>
					<option class="badge badge-pill badge-success">Approved</option>
					<option class="badge badge-pill badge-danger">Rejected</option>
					</select>
                </td>
                <td>
                <input type="hidden" name="id" value="<%=a.getId()%>">
                <button type="submit" class="btn btn-outline-danger">Update</button> 
                </td>
                </form>
              </tr>
              <tr>
            
            
            </tbody>
            <%}%>
          </table>
        </div>
      
      
      <%}else{%>
        <div class="card-header bg-dark text-white">Your Leaves</div>
        <div class="card-body p-0">
          <table class="table table-bordered mb-0">
            <thead class="thead-light">
              <tr align="center">
                <th>Leave ID</th>
                <th>Type</th>
                <th>From</th>
                <th>To</th> 
                <th>Days</th>
                <th>Status</th>
                <th>Withdraw</th>
                
              </tr>
            </thead>
            <%for(Apply a:leavesList){%>
            <tbody>
              <tr align="center">
                <td><%=a.getId()%></td>
                <td><%=a.getType()%></td>
				<td><%=a.getStart_date()%></td>
				<td><%=a.getEnd_date()%> 
				<td><%=ApplyLeave.leaveCount%></td>
                <%if(a.getStatus().equalsIgnoreCase("Pending")){%>
                <td><span class="badge badge-pill badge-warning"><%=a.getStatus()%></span></td>
                 <%}else if(a.getStatus().equalsIgnoreCase("Approved")){%>
                 <td><span class="badge badge-pill badge-success"><%=a.getStatus()%></span></td>
                 <%}else if(a.getStatus().equalsIgnoreCase("Rejected")){ %>
                 <td><span class="badge badge-pill badge-danger"><%=a.getStatus()%></span></td>
                 <%}else{%>
               		<td><span class="badge badge-secondary"><%=a.getStatus()%></span></td> 
                <%}%>
                <%if(a.getStatus().equalsIgnoreCase("Pending")){%>
                <td>
                	<form action="withdrawLeave" method="post">
 						<input type="hidden" name="id" value="<%=a.getId()%>">
 						<button type="submit" class="btn btn-outline-danger">Withdraw</button>             	
                	</form>
                </td>
                <%}else{%>
                <td><button type="submit" class="btn btn-outline-dark" disabled="disabled">Withdraw</button></td>
                <%}%>
              </tr>
              <tr>
            </tbody>
            <%}%>
          </table>
        </div>
        <%}
        }else{
        	request.setAttribute("error","Session expired!");
        	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
        	rd.forward(request, response);
        }
        %>
      </div>
     
</body>
</html>