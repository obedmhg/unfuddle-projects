<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Señor de la misericordia | Registro de Prebautismales</title>
<link rel="stylesheet" href="css/foundation.css" />
<script src="js/vendor/modernizr.js"></script>
<style>
body {
	background-color: #074e68;
}
</style>
</head>
<body>

	<div class="row">
		<div class="large-12 columns">
			<img
				src="http://srdelamisericordia.com/wp-content/uploads/2014/05/Logo-Sr-de-la-Misericordia-fondo-negro.png"
				alt="" width="160" hiegth="80">
		</div>
	</div>

	<div class="row">
		<div class="large-12 columns">
			<div class="panel">
				<h3>Base de datos de registro de Prebautismales!</h3>
				<c:if test='${sessionScope["logged"] != "true"}'>
					<jsp:forward page="/login.jsp" />
				</c:if>
				<form action="/search" method="post" id="addForm">
					Folio - Nombre - Fecha &nbsp; <input type="text" name="field"
						id="field"></input><br> <input class="small radius button" type="submit" value="Entrar"
						id="actionButton" />
				</form>
			</div>
		</div>
	</div>
	<script src="js/vendor/jquery.js"></script>
	<script src="js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>
