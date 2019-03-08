package com.ocorp;

import java.io.IOException;
import javax.servlet.http.*;

import com.ocorp.jdo.DataUtil;

@SuppressWarnings("serial")
public class OneReasonForServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		DataUtil util = new DataUtil();
		util.createCategory();
		
	}
}
