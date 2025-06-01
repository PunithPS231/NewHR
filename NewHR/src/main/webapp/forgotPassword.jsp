<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login | NewHR</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
   
    .login-container {
      padding-top :65px;
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
<%if(request.getAttribute("error")!=null){ %>
<div class="alert alert-danger" align="center">
<%=request.getAttribute("error") %>
</div>
<%}%>
<div class="container login-container">
  <div class="login-box">
    <div class="brand"><img class="logo" alt="" src="images/logo.png"></div>
    <h3>Forgot Password</h3>
    <form action="forgotPassword" method="post">
    <div class="form-group">
        <input type="tel" class="form-control" id="phone" name="phone" required placeholder="Enter the phone number" min="10" maxlength="10">
      </div>
      <div class="form-group">
        <input type="email" class="form-control" id="email" name="mail" required placeholder="Enter the mail ID:">
      </div>
      <div class="form-group">
        <input type="password" class="form-control" id="password" name="password" required placeholder="Set a new password">
      </div>
      <div class="form-group">
        <input type="password" class="form-control" id="confirm" name="confirm" required placeholder="Confirm the password">
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-login btn-block bg-info text-light"><b>Update Password</b></button>
      </div> 
      <div class="form-group">
        <a href="login.jsp" class="btn btn-login btn-block bg-danger text-light"><b>Back</b></a>
      </div> 
    </form>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

