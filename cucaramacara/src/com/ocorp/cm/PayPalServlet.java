package com.ocorp.cm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayPalServlet extends HttpServlet {
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String productName = req.getParameter("productName");
		String price = req.getParameter("price");
		String destination = "./paypal.jsp?productName=" + productName + "&price=" + price.trim();
		System.out.println(destination);
		resp.sendRedirect(resp.encodeRedirectURL(destination));
	}
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String productName = req.getParameter("productName");
		String price = req.getParameter("price");
		String destination = "./paypal.jsp?productName=" + productName + "&price=" + price.trim();
		System.out.println(destination);
		resp.sendRedirect(resp.encodeRedirectURL(destination));
	}
}
