<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Caveat:wght@400;500&family=Kanit:wght@300&family=Lobster&display=swap" rel="stylesheet">

<style>
body{
background-image: url('image/gray1.avif');
 color: black;
 font-family: 'Kanit', sans-serif; 
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
<%@ page import="java.sql.*" %>

<br>
<br>

<h1 class="display-3 text-center">Sign Up</h1>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
        
<form method="post" action="adminsignup.jsp">
    <div class="mb-3 mt-3">
        <label for="name" class="form-label">Username:</label>
        <input type="text" class="form-control" placeholder="Username here" name="name">
    </div>

    <div class="mb-3">
        <label for="password" class="form-label">Password:</label>
        <input type="password" class="form-control" placeholder="Password here" name="password">
    </div>

    <div class="mb-3">
        <label for="password2" class="form-label">Confirm Password:</label>
        <input type="password" class="form-control" placeholder="Confirm Password here" name="password2">
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" placeholder="Email here" name="email">
    </div>
<div class="d-flex justify-content-center align-items-center" style="height: auto;">

    <button type="submit" class="btn btn-secondary btn-lg hover-effect " name="signup" value="signup">Sign Up</button>
    
    </div>
    </div>
    </div>
    </div>
</form>

<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("password2");

    if (password.equals(confirmPassword)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sem_project", "root", "");
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO admin_info (name, email, password) VALUES (?, ?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("adminlogin.jsp");
            } else {
%>
                <h1>Error in sign up</h1>
<%
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    else{%>
    	 <h3>Passwords are not same, retry!</h3>
   <% }
}
%>

</body>
</html>
