<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="col-md-6 mb-4">
          <div class="card shadow">
            <div class="card-header bg-dark text-white">Raise the concern</div>
            <div class="card-body">
              <form action="applyLeave" method="post">
                <div class="form-group">
                 <input type="text" name="subject">
                </div>
                <div class="form-group">
                  <label>Reason</label>
                  <textarea class="form-control" name="reason" rows="2"></textarea>
                </div>
                <button type="submit" class="btn btn-success">Apply</button>
              </form>
            </div>
          </div>
        </div>
      </div>
	
</body>
</html>