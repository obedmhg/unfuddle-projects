package com.ocorp;
import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class LogIn extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		
		if (user.equals("admin") && password.equals("hechos242")) {
			req.getSession().setAttribute("logged", "true");
			resp.sendRedirect("/search.jsp");
		} else {
			resp.sendRedirect("/login.jsp?found=false");
		}
	}

	
}
