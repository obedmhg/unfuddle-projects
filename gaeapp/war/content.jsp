<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.ocorp.jdo.Slot" %>
<%@ page import="com.ocorp.jdo.PMF" %>

<html>
   <head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
  </head>

  <body>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    if (user != null) {
%>
<p>Hello, <%= user.getNickname() %>! (You can
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">sign out</a>.)</p>
<%
    } else {
%>
<p>Hello!
<a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>
to include your name with Slots you post.</p>
<%
    }
%>

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
	String query = "select from " + Slot.class.getName() + " order by date desc range 0,5";
    List<Slot> slots = (List<Slot>) pm.newQuery(query).execute();
    if (slots.isEmpty()) {
%>
<p>The slot has no messages.</p>
<%
    } else {
        for (Slot g : slots) {
            if (g.getAuthor() == null) {
%>
<p>An anonymous person wrote:</p>
<%
            } else {
%>
<p><b><%= g.getAuthor().getNickname() %></b> wrote:</p>
<%
            }
%>
<blockquote>
<c:out value='test'/>
<% out.println(g.getContent()); %>
</blockquote>
<%
        }
    }
    pm.close();
%>

This is the new code
<c:forEach var='slot' items='${slotsArray}'>
	<br>${slot.content}
</c:forEach>

    <form action="/slot" method="post">
      <div><textarea name="content" rows="3" cols="60"></textarea></div>
      <div><input type="submit" value="Post Slot" /></div>
    </form>

    <form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
        <input type="file" name="myFile">
        <input type="submit" value="Submit">
    </form>


     <form action="/serve" method="get">
      <div><input type="submit" value="Serve" /></div>
    </form>

  </body>
</html>