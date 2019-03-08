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
    PersistenceManager pm = PMF.get().getPersistenceManager();
	String query = "select from " + Slot.class.getName() + " order by date desc range 0,5";
    pm.close();
%>

    <form action="/uploadContent" method="post">
    	<table>
    	<tr><td>Title</td><td><input name="tittle" /></td></tr>

      <tr><td>File</td><td><input type="file" name="myFile"></td></tr>
      <tr><td>Description</td><td><input name="description" /></td></tr>
      </table>
      <div><input type="submit" value="Save Content" /></div>
    </form>

     <form action="/serve" method="get">
      <div><input type="submit" value="Serve" /></div>
    </form>

  </body>
</html>