<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="wrapper">
	<h1><a href="index.jsp" id="logo"></a></h1>
	<nav>
		<ul id="top_nav">
			<li><a href="index.jsp"><img src="images/top_icon1.gif" alt=""></a></li>
			<li class="end"><a href="contact.jsp"><img src="images/top_icon3.gif" alt=""></a></li>
		</ul>
	</nav>
	<nav>
		<ul id="menu">
			<c:choose>
				<c:when test="${param.selectedPage eq 'home'}">
					<li id="menu_active"><a href="index.jsp">Inicio</a></li>
				</c:when>
				<c:otherwise>
					<li ><a href="index.jsp">Inicio</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.selectedPage eq 'babyGym'}">
					<li id="menu_active"><a id="Red" href="#">Play Gym</a></li>
				</c:when>
				<c:otherwise>
					<li><a id="Red" href="contentPage.jsp?blogId=4493793314452683100&selectedPage=babyGym">Play Gym</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${param.selectedPage eq 'yoga'}">
					<li id="menu_active"><a id="Blue" href="#">Yoga Para Mamis</a></li>
				</c:when>
				<c:otherwise>
					<li><a id="Blue" href="contentPage.jsp?blogId=5217291634640394224&selectedPage=yoga">Yoga Para Mamis</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${param.selectedPage eq 'musica'}">
					<li id="menu_active"><a id="Green" href="#">Musica</a></li>
				</c:when>
				<c:otherwise>
					<li><a id="Green" href="contentPage.jsp?blogId=4794712200683669633&selectedPage=musica">Musica</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${param.selectedPage eq 'arte'}">
					<li id="menu_active"><a id="Red" href="#">Arte</a></li>
				</c:when>
				<c:otherwise>
					<li><a id="Red" href="contentPage.jsp?blogId=8953307483407478126&selectedPage=arte">Arte</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${param.selectedPage eq 'contact'}">
					<li id="menu_active"><a href="#">Contacto</a></li>
				</c:when>
				<c:otherwise>
					<li><a id="Pink" href="contact.jsp">Contacto</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>