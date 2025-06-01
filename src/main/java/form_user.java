
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/form")
public class form_user extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/sem_project";
			String username = "root";
			String password = "";
			Connection con = DriverManager.getConnection(dbURL, username, password);
			
if (req.getParameter("btn_save")!=null && req.getParameter("btn_save").equals("save")) {
	String name = req.getParameter("name");
	String email = req.getParameter("email");
	String event = req.getParameter("event");
	String date = req.getParameter("date");
	String needs = req.getParameter("needs");
	String budget = req.getParameter("budget");
	String count = req.getParameter("count");
	String info = req.getParameter("info");
	
String qry_insert = "INSERT INTO user_events (name,email,event,date,needs,budget,count,info) VALUES (?,?,?,?,?,?,?,?)";
	PreparedStatement statement = con.prepareStatement(qry_insert);
	statement.setString(1, name);
	statement.setString(2, email);
	statement.setString(3, event);
	statement.setString(4, date);
	statement.setString(5, needs);
	statement.setString(6, budget);
	statement.setString(7, count);
	statement.setString(8, info);
	
	int rowsInserted = statement.executeUpdate();
	if (rowsInserted > 0) {

		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		pw.print("<script>alert('Thanks For Choosing Us!')</script>");
		RequestDispatcher rd = req.getRequestDispatcher("/form_user.html");
		rd.include(req, resp);

	} else {

		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		pw.print("<script>alert('Oops! Something Went Wrong.')</script>");
		RequestDispatcher rd = req.getRequestDispatcher("/form_user.html");
		rd.include(req, resp);
	}
}
		}
		 catch (SQLException | ClassNotFoundException e) {

				e.printStackTrace();
			}
	}
	
}
			