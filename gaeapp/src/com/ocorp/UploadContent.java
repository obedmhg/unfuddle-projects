package com.ocorp;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.ocorp.jdo.PMF;
import com.ocorp.jdo.Slot;

public class UploadContent extends HttpServlet{
	private static final Logger log = Logger.getLogger(SlotServlet.class.getName());


	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String file = req.getParameter("file");
        String title = req.getParameter("title");
        Date date = new Date();
        PersistenceManager pm = PMF.get().getPersistenceManager();
        String savedFile = blobstoreService.createUploadUrl("/upload");
        Slot slot = new Slot(user, savedFile, date, title);
    	String query = "select from " + Slot.class.getName() + " order by date desc range 0,5";
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
        resp.sendRedirect("/content.jsp");
	}



}
