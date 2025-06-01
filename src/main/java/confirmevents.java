import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/confirm")
public class confirmevents extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/sem_project";
            String username = "root";
            String password = "";
            Connection con = DriverManager.getConnection(dbURL, username, password);
            String eventId = req.getParameter("id");

            if(eventId != null && !eventId.isEmpty()) {
            	Statement statement = con.createStatement();

				int rs = statement.executeUpdate("delete from confirm_events where id=" + eventId);
				if (rs > 0) {
					resp.sendRedirect(req.getContextPath() + "/confirmevents.jsp");
				}

            }
}
        catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}
    }
}
