package com.ocorp;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.*;

import com.ocorp.dao.GalleryUrlDao;
import com.ocorp.jdo.GalleryUrl;

@SuppressWarnings("serial")
public class LogIn extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		
		if (user.equals("admin") && password.equals("photos4you")) {
			req.getSession().setAttribute("logged", "true");
			resp.sendRedirect("/admin.jsp");
		} else {
			resp.sendRedirect("/login.jsp?found=false");
		}
	}

	
}
