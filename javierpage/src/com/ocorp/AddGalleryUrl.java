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
public class AddGalleryUrl extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String password = req.getParameter("password");
		String url = req.getParameter("url");
		resp.sendRedirect("/admin.jsp");

		GalleryUrl galleryUrl = new GalleryUrl();

		GalleryUrlDao galleryDao = new GalleryUrlDao();

		galleryUrl.setPassword(password);
		galleryUrl.setGalleryUrl(url);

		galleryDao.createGalleryUrl(galleryUrl);

		System.out.println(galleryDao.getAllGalleryUrl());

	}

	
}
