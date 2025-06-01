<%@page import="in.hr.dao.EmployeeDAOImpl"%>
<%@page import="in.hr.dao.EmployeeDAO"%>
<%@page import="in.hr.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>New Employee | NewHR</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
   
    .login-container {
      padding-top :25px;
      min-height: 50vh;
      display: flex;
      justify-content: center;
      
    }
    .login-box {
      background-color: #ffffff;
      padding: 50px 30px;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }
    .login-box h3 {
      font-weight: 600;
      margin-bottom: 30px;
      text-align: center;
      color: #343a40;
    }
  
    .brand {
      
      font-size: 24px;
      font-weight: bold;
      color: #007bff;
      text-align: center;
    }
    
    .logo {
		width:120px;
		height:160px;    
    }
  </style>
</head>
<body class="bg-info">
 	
<div class="container login-container">
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
  <div class="login-box">
    <div class="brand"><img class="logo" alt="" src="images/logo.png"></div>
    <h3>Update Account</h3>
   	<%Employee e=(Employee)session.getAttribute("employee");
   		EmployeeDAO edao=new EmployeeDAOImpl();
   		Employee e1=new Employee();
   		if(request.getParameter("id")!=null){
   			System.out.println(request.getParameter("id"));
   			e1=edao.getEmployee(Integer.parseInt(request.getParameter("id")));
   		}else{
   			e1=e;   
   		}%>
   	
    <form action="updateAccount" method="post">
      <div class="form-group">
        <input type="text" class="form-control" id="name" name="name" required value="<%=e1.getName()%>">
      </div>
      
      <div class="form-group">
      	
      	<input type="tel" class="form-control" id="phone" name="phone" required value="<%=e1.getPhone()%>" min="10" maxlength="10">
       </div>
         <div class="form-group">
      	<input type="email" class="form-control" id="mail" name="mail" required value="<%=e1.getMail()%>">
       </div>
       <%if(e.getEid()==1001){%>
     	 <div class="form-row">
   		 <select class="custom-select col-md-6 mb-3" name="job" required>
      		<option><%=e1.getJob()%></option>
      		<option>Accountant</option>
     	    <option>Business Analyst</option>
      		<option>Developer</option>
       		<option>Manager</option>
        	<option>Salesman</option>
    	</select>
    	<div class="col-md-6 mb-3">
      	<input type="number" class="form-control" id="sal" name="sal" required placeholder="Enter the Salary" min="10000" max="500000">
       </div>
  </div>
  
      <div class="form-group">
        <select class="custom-select col-md-6 mb-3" name="status" required>
      		<option class="badge badge-pill badge-primary"><%=e1.getStatus()%></option>
      		<option class="badge badge-pill badge-success">Active</option>
     	    <option class="badge badge-pill badge-danger">Inactive</option>
    	</select>
      </div> 
      <%}%>
      <div class="form-group">
        <button  type="submit" class="btn btn-login btn-block bg-info text-light"><b>Update Account</b></button>
      </div> 
      <div class="form-group">
        <a href="dashboard.jsp" class="btn btn-login btn-block bg-danger text-light"><b>Back</b></a>
      </div> 
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
