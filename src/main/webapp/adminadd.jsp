<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin View</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
body{
background-image: url('image/grey5.jpeg');
}
.centered-button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

    .hover-effect {
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; 
}

.hover-effect:hover {
    transform: scale(1.1);
    box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.3); 
}
</style>
</head>
<body>
<br><br>
<h1 class="display-3 text-center">Add New Admin</h1><br>
<%@ page import="java.sql.*" %>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
<% if (request.getParameter("id") == null) { %>

			<form method="post" action="admins">
				<div class="mb-3 mt-3">
					<label for="name" class="form-label">Name:</label> <input
						type="text" class="form-control" placeholder="Enter Name"
						name="name">
				</div>
				<div class="mb-3">
					<label for="class" class="form-label">Email:</label> <input
						type="email" class="form-control" placeholder="Enter email"
						name="email">
				</div>

			<div class="mb-3">
					<label for="password" class="form-label">Password:</label> <input
						type="password" class="form-control" placeholder="Enter password"
						name="password">
				</div>
				
<div class="centered-button">


				<button type="submit" class="btn btn-secondary btn-lg hover-effect" name="btn_save"
					name="btn_save" value="save">Save</button>
</div>
			</form>
</div>
</div>
</div>
			<% }
			else {
				
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sem_project", "root", "");
				Statement statement = connection.createStatement();
				
				int admin_id = Integer.valueOf(request.getParameter("id"));
				
				ResultSet resultset = statement.executeQuery("select * from admin_info where id="+admin_id);
				while(resultset.next())
				{
				
				%>

			<form method="post" action="admins">
				<div class="mb-3 mt-3">
					<label for="name" class="form-label">Name:</label> <input
						type="text" class="form-control"
						value="<%= resultset.getString(2) %>" name="name">
				</div>
				<div class="mb-3">
					<label for="email" class="form-label">Email:</label> <input
						type="text" class="form-control"
						value="<%= resultset.getString(3) %>" name="email">
				</div>
				
				<div class="mb-3">
					<label for="password" class="form-label">Password:</label> <input
						type="password" class="form-control"
						value="<%= resultset.getString(4) %>" name="password">
				</div>

				<input type="hidden" name="id_hidden"
					value="<%= resultset.getString(1) %>">
					
					<div class="centered-button">
				<button type="submit" class="btn btn-secondary btn-lg" name="btn_update"
					value="update">Update</button>
</div>
			</form>

			<% }
				} %>



</body>
</html>