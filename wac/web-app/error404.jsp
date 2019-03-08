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
	<jsp:include page="menu.jsp"/>
	<br>
	<center>
		<img src="https://a248.e.akamai.net/assets.github.com/images/modules/404/parallax_errortext.png?1338956357"/>
		<img src="https://a248.e.akamai.net/assets.github.com/images/modules/404/parallax_octocat.png?1338945074"/>
		<br>404 page images from <a href="https://github.com/">https://github.com/</a>
	</center>
	
	<jsp:include page="footer.jsp"/>
	</body>
</html>