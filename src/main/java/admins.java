import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admins")
public class admins extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/sem_project";
			String username = "root";
			String password = "";
			Connection con = DriverManager.getConnection(dbURL, username, password);
			
		

			if (req.getParameter("id") == null && req.getParameter("btn_save")!=null && req.getParameter("btn_save").equals("save")) {

				
				String name = req.getParameter("name");
				String email = req.getParameter("email");
				String pass = req.getParameter("password");
					
								
				
				String qry_insert = "INSERT INTO admin_info (name, email,password) VALUES (?, ?, ?)";
				PreparedStatement statement = con.prepareStatement(qry_insert);
				statement.setString(1, name);
				statement.setString(2, email);
				statement.setString(3, pass);

				int rowsInserted = statement.executeUpdate();
				if (rowsInserted > 0) {

					RequestDispatcher rd = req.getRequestDispatcher("/admins.jsp");
					rd.include(req, resp);

				} else {

					resp.setContentType("text/html");
					PrintWriter pw = resp.getWriter();
					pw.print("<script>alert('Error in adding admin')</script>");
					RequestDispatcher rd = req.getRequestDispatcher("/adminadd.jsp");
					rd.include(req, resp);
				}
			}
			
			else {
				if (req.getParameter("btn_update")!=null && req.getParameter("btn_update").equals("update"))
				{
					//System.out.println("update");
					
					int id = Integer.valueOf(req.getParameter("id_hidden"));
					
					String name = req.getParameter("name");
					String email = req.getParameter("email");
					String pass = req.getParameter("password");
					
					String update_qry="update admin_info set name=?, email=?, password=? where id=?";
					
					PreparedStatement statement = con.prepareStatement(update_qry);
					statement.setString(1, name);
					statement.setString(2, email);
					statement.setString(3, pass);
					statement.setInt(4, id);
					int rs = statement.executeUpdate();
					if (rs > 0) {
						resp.sendRedirect(req.getContextPath() + "/admins.jsp");
					}
					
				}
				
				
				else {
					int del_id = Integer.valueOf(req.getParameter("id"));
					Statement statement = con.createStatement();

					int rs = statement.executeUpdate("delete from admin_info where id=" + del_id);
					if (rs > 0) {
						resp.sendRedirect(req.getContextPath() + "/admins.jsp");
					}

				}
			}

		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}
	}
}
