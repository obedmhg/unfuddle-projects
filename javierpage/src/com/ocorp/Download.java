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
public class Download extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String password = req.getParameter("password");
		boolean found = false;
		GalleryUrlDao gd = new GalleryUrlDao();
		for (GalleryUrl gu : gd.getAllGalleryUrl()) {
			if(gu.getPassword().equals(password)) {
				resp.sendRedirect(gu.getGalleryUrl());
			}
		}
		if (!found) {
			resp.sendRedirect("/download.jsp?found=false");
		}
		
	}

	
}
