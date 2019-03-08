<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <link href="default.css" rel="stylesheet" type="text/css" />
  <div id="menu">
    <ul>
      <% if (request.getParameter("from").equals("index")){%>
      	<li class="active"> <a href="#">Home</a></li>
      <% } else {%>
      		<li><a href="index.jsp">Home</a></li>
      <% } %>
      <% if (request.getParameter("from").equals("productos")){%>
      	<li class="active"> <a href="#">Productos</a></li>
      <% } else {%>
      		<li><a href="productos.jsp">Productos</a></li>
      <% } %>
      <% if (request.getParameter("from").equals("imagenes")){%>
      	<li class="active"> <a href="#">Imagenes</a></li>
      <% } else {%>
      		<li><a href="imagenes.jsp">Imagenes</a></li>
      <% } %>
      <% if (request.getParameter("from").equals("videos")){%>
      	<li class="active"> <a href="#">Videos</a></li>
      <% } else {%>
      		<li><a href="videos.jsp">Videos</a></li>
      <% } %>
       <% if (request.getParameter("from").equals("contacto")){%>
      	<li class="active"> <a href="#">Contacto</a></li>
      <% } else {%>
      		<li><a href="contacto.jsp">Contacto</a></li>
      <% } %>
    </ul>
  </div>