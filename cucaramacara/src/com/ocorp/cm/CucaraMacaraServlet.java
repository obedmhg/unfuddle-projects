package com.ocorp.cm;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CucaraMacaraServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String name = req.getParameter("nombre");
		String email = req.getParameter("email");
		String comments = req.getParameter("comments");
		resp.sendRedirect("/contact.jsp");
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("obedmhg@gmail.com", "CucaraMacara"));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress("cucaramacarabebe@gmail.com", "Haide"));
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress("haide.avitia@gmail.com", "Haide"));
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress("obedmhg@gmail.com", "Obed"));
            msg.setSubject("Mensaje de " +  name);
            msg.setText(comments + "\n Responder a:" +  email);
            if (email !=  null || email.trim().equals("")) {
            	Transport.send(msg);
            } else {
            	throw new IOException("Email needed");
            }

        } catch (AddressException e) {
            // ...
        } catch (MessagingException e) {
            // ...
        }
	}
}
