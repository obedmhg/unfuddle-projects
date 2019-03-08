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
				<h3>Base de datos de registro de Prebautismales</h3>
				<div class="row">
					
					<div class="large-1 small-4 columns">&nbsp;</div>
					<div class="large-11 small-8 columns end">
						&nbsp;
						<c:if test="${param.found eq 'false'}">
							<div style="color: red;">
							Usuario y/o contraseña invalidos, por favor intenta de nuevo.
							</div>
						</c:if>
					</div>
				</div>
				<div class="row">
					<form action="/login" method="post" id="addForm">
						<div class="large-1 small-4 columns">Usuario</div>
						<div class="large-11 small-8 columns end">
							<input type="text" name="user" id="user"></input>
						</div>
						<div class="large-1 small-4 columns">Password</div>
						<div class="large-11 small-8 columns end">
							<input type="password" name="password" id="password"></input><br>
						</div>
						<div class="large-1 small-4 columns">&nbsp;</div>
						<div class="large-11 small-8 columns end">
							<input class="small radius button" type="submit" value="Entrar"
								id="actionButton" />
						</div>
					</form>

				</div>
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
