package com.ocorp;
import java.io.IOException;
import java.util.List;
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
public class Delete extends HttpServlet {	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String password = req.getParameter("password");
		GalleryUrlDao galleryDao = new GalleryUrlDao();
		List<GalleryUrl> gus =  galleryDao.getGAlleryUrl(password);
		for (GalleryUrl gu : gus) {
			galleryDao.deleteGalleryUrl(gu);
		}
		resp.sendRedirect("/admin.jsp");
	}

	
}
