package com.ocorp;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.ocorp.jdo.Slot;
import com.ocorp.jdo.PMF;

@SuppressWarnings("serial")
public class SlotServlet extends HttpServlet {

	private static final Logger log = Logger.getLogger(SlotServlet.class.getName());


	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String content = req.getParameter("content");
        Date date = new Date();
        Slot slot = new Slot(user, content, date, "");
        PersistenceManager pm = PMF.get().getPersistenceManager();
    	String query = "select from " + Slot.class.getName() ;
        List<Slot> slots = (List<Slot>) pm.newQuery(query).execute();
        for(Slot s: slots){
        	System.out.println(s.getContent());
        }

        req.setAttribute("slotsArray", slots);
        try {
            pm.makePersistent(slot);
        } finally {
            pm.close();
        }
        resp.sendRedirect("/slot.jsp");
	}
}
