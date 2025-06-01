<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmed Events</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
body{
background-image: url('image/gray3.jpeg');
}
.table-custom {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529; 
            background-color: white; 
        }

        .table-custom th,
        .table-custom td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6; 
            text-align: center;
        }

        .table-custom thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6; 
            color: grey; 
        }

        
        .btn-custom {
            margin: 2px;
            color: #212529; 
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
<br>
<br>
<h1 class="display-3 text-center">Confirmed Events</h1><br>
<%@ page import="java.sql.*" %>
<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sem_project", "root", "");
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery("select * from confirm_events");
			%>

			<table class="table table-custom">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Event</th>
						<th>Date</th>
						<th>Needs</th>
						<th>Budget</th>
						<th>Guests</th>
						<th>Event Info</th>
						<th>Action</th>
						
					</tr>
				</thead>
				<tbody>
					<% while(resultset.next()){ %>
					<tr>
						<td><%= resultset.getString(1) %></td>
						<td><%= resultset.getString(2) %></td>
						<td><%= resultset.getString(3) %></td>
						<td><%= resultset.getString(4) %></td>
						<td><%= resultset.getString(5) %></td>
						<td><%= resultset.getString(6) %></td>
						<td><%= resultset.getString(7) %></td>
						<td><%= resultset.getString(8) %></td>
						<td><%= resultset.getString(9) %></td>
		<td><a class="btn btn-danger btn-custom btn-lg hover-effect" href="confirm?id=<%= resultset.getString(1) %>">Delete Event</a></td>
						</tr>
						<% } 
					
					%>
						</tbody>
						</table>
						 <%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<br>
 <div class="d-flex justify-content-center">
<a href="logout" class="btn btn-secondary btn-lg text-center hover-effect">Logout</a><br>
</div>
<%
 
if
(session.getAttribute("session_key")!=null )
{
String session_value= (String)
session.getAttribute("session_key");

}
else
{
response.sendRedirect("adminlogin.jsp");
}
%>
					
</body>
</html>