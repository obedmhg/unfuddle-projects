<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<!-- Menu -->
	<div id="menu">
		<!-- ENDS menu-holder -->
		<div id="menu-holder">
			<!-- wrapper-menu -->
			<div class="wrapper">
				<!-- Navigation -->
				<ul id="nav" class="sf-menu">
				<c:choose>
					<c:when test='${"index" eq param.from }'>
						<c:set var="homeSelected" value="current-menu-item"/>
					</c:when>
					<c:when test='${"clientes" eq param.from }'>
						<c:set var="clientesSelected" value="current-menu-item"/>
					</c:when>
					<c:when test='${"socialMedia" eq param.from }'>
						<c:set var="socialMediaSelected" value="current-menu-item"/>
					</c:when>
					<c:when test='${"consultoria" eq param.from }'>
						<c:set var="consultoriaSelected" value="current-menu-item"/>
					</c:when>
					<c:when test='${"contacto" eq param.from }'>
						<c:set var="contactoSelected" value="current-menu-item"/>
					</c:when>
				</c:choose>
					<li class="${homeSelected}"><a href="index.jsp">Home<span class="subheader">oCorp</span></a></li>
					<li class="${clientesSelected}"><a href="clientes.jsp">Clientes<span class="subheader">Nuestros Clientes</span></a></li>
					<li class="${socialMediaSelected}"><a href="socialMedia.jsp">Social Media<span class="subheader">Integration</span></a></li>
					<li class="${consultoriaSelected}"><a href="consultoria.jsp">Consultoria<span class="subheader">Tecnologias Web</span></a></li>
					<li  class="${contactoSelected}"><a href="contact.jsp">Contacto<span class="subheader">Aqu&#237;</span></a></li>
				</ul>
				<!-- Navigation -->
			</div>
			<!-- wrapper-menu -->
		</div>
		<!-- ENDS menu-holder -->
	</div>
	<!-- ENDS Menu -->