import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/crud")
public class admincrud extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/sem_project";
            String username = "root";
            String password = "";
            Connection con = DriverManager.getConnection(dbURL, username, password);

            if (req.getParameter("id") != null) {
                int del_id = Integer.valueOf(req.getParameter("id"));
                Statement statement = con.createStatement();

                int rs = statement.executeUpdate("delete from user_events where id=" + del_id);
                if (rs > 0) {
                    resp.sendRedirect(req.getContextPath() + "/adminmain.jsp");
                }

            } else {

                String name = req.getParameter("name");
                PreparedStatement selectStmt = con.prepareStatement("SELECT * FROM user_events WHERE name = ?");
                selectStmt.setString(1, name);
                ResultSet rs = selectStmt.executeQuery();
                
                PreparedStatement deleteStmt = con.prepareStatement("DELETE FROM user_events WHERE name = ?");
                deleteStmt.setString(1, name);
                deleteStmt.executeUpdate(); 

                PreparedStatement statement = con.prepareStatement(
"INSERT INTO confirm_events (name, email, event, date, needs, budget, count, info) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

                while (rs.next()) {
                    // Fetching data 
                    String email = rs.getString("email");
                    String event = rs.getString("event");
                    String date = rs.getString("date");
                    String needs = rs.getString("needs");
                    String budget = rs.getString("budget");
                    String count = rs.getString("count");
                    String info = rs.getString("info");

                    // Set values to insert 
                    statement.setString(1, name);
                    statement.setString(2, email);
                    statement.setString(3, event);
                    statement.setString(4, date);
                    statement.setString(5, needs);
                    statement.setString(6, budget);
                    statement.setString(7, count);
                    statement.setString(8, info);

                    // Execute insert statement
                    statement.executeUpdate();
                }
                int rowsInserted = statement.executeUpdate();
				if (rowsInserted > 0) {
					RequestDispatcher rd = req.getRequestDispatcher("/confirmevents.jsp");
					rd.include(req, resp);
                
            }
            }
        }
         catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions properly in a real-world scenario
        }
    }
}

