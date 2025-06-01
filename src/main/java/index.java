
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import java.io.PrintWriter;
import java.io.IOException;
@WebServlet("/link")
//back end of login.html

public class index extends HttpServlet{
	
protected void service(HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException{
	String admin = req.getParameter("admin");
	String user = req.getParameter("user");
	
	if(admin!=null) {
		RequestDispatcher rd = req.getRequestDispatcher("/adminlogin.jsp");
		rd.forward(req, resp);
	}
	
	else {
		RequestDispatcher rd = req.getRequestDispatcher("/welcome_user.html");
		rd.include(req,resp);
		}
	}
}
