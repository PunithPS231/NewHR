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
      padding-top :75px;
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
  <div class="login-box">
    <div class="brand"><img class="logo" alt="" src="images/logo.png"></div>
    <h3>Employee Login</h3>
    <%if(request.getAttribute("success")!=null){%>
    <div class="alert alert-success" align="center">
    <%=request.getAttribute("success")%>
    </div>
    <%}%>
    <%if(request.getAttribute("error")!=null){%>
    <div class="alert alert-danger" align="center">
    <%=request.getAttribute("error")%>
    </div>
    <%}%>
        <form action="login" method="post">
      <div class="form-group">
        <input type="email" class="form-control" id="mail" name="mail" required placeholder="Enter the mail ID">
      </div>
      
      <div class="form-group">
        <input type="password" class="form-control" id="password" name="password" required placeholder="Enter the password">
       </div>
      <div class="form-group">
        <button type="submit" class="btn btn-login btn-block bg-info text-light"><b>Login</b></button>
      </div>  
    </form>
    <a href="forgotPassword.jsp">Forgot password?</a>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
