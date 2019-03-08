<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE  html>
<html>
	<head>
		<meta charset="utf-8">
		<title>oCorp Web Solutions</title>
		<jsp:include page="includes.jsp"/>
	</head>
	
	<body class="home">

	<div id="fb-root"></div>
	
	<script>
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>

	<jsp:include page="header.jsp"/>    		
	<jsp:include page="menu.jsp">
  			<jsp:param name="from" value='index' />
	</jsp:include>
	<jsp:include page="slider.jsp"/>
	
	<!-- MAIN -->
	<div id="main">
		<!-- wrapper-main -->
		<div class="wrapper">					
			<!-- headline -->
			<div class="clear"></div>
			<div id="headline">
				<span class="main">oCorp Web Solutions</span>
				<span class="sub">Nuestro objetivo; Soluciones web para su negocio.</span>
				<br>
				<div class="fb-like" data-href="http://www.ocorpws.com" data-send="true" data-width="450" data-show-faces="true"></div> 
			</div>
		</div>
		<!-- ENDS wrapper-main -->
	</div>
	<!-- ENDS MAIN -->
	<jsp:include page="footer.jsp"/>
	</body>
</html>