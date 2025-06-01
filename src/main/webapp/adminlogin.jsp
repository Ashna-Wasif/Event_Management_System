<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
body{

background-image: url('image/gray_login.jpg');
 color: black;
}
   .centered-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .signup-link {
            color: white;
            text-decoration: none;
        }

        
        .signup-button {
            background-color: #6c757d; 
            border-color: #6c757d; 
        }

        .signup-button:hover {
            background-color: #495057; 
            border-color: #495057; 
        }
         .hover-effect {
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* Transition for scale and shadow */
}

.hover-effect:hover {
    transform: scale(1.1);
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.3); 
}
</style>
</head>
<body>
<%@ page import="java.sql.*"%>
<br>
<br>

<h1 class="display-3 text-center">Login</h1>
<h6 class="text-center">As an Admin</h6>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
<form method="post" action="adminlogin.jsp">
				<div class="mb-3 mt-3">
					<label for="name" class="form-label">Username:</label>
					 <input type="text" class="form-control" placeholder="Username here" name="name">
				</div>
				
				<div class="mb-3">
					<label for="password" class="form-label">Password:</label> 
					<input	type="password" class="form-control" placeholder="Password here" name="password">
				</div>
				<div class="centered-button">
				<button type="submit" class="btn btn-secondary btn-lg hover-effect" name="login"
					name="login" value="login">Login</button>
</div>
			</form>
			
			</div>
			</div>
			</div>
			<br>
			<p class="text-center">First Time Here?</p>
			<div class="centered-button">
			<button class="btn btn-secondary btn-lg hover-effect"> <a href="./adminsignup.jsp" class="signup-link">Create An Account</a></button> </div>
			
	<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    String username = request.getParameter("name");
    String password = request.getParameter("password");

    if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sem_project", "root", "");
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM admin_info WHERE name=? AND password=?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()) {
            	
            	HttpSession sessions=request.getSession();
            	sessions.setAttribute("session_key", username);
                // Redirect to form_user.html 
                response.sendRedirect("adminmain.jsp");
            } else {
%>
                <h3 style="color: red">Login Failed</h3>
<%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
%>
   
    
</body>
</html>