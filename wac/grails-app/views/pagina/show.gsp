<%@ page import="com.ocorp.pagina.Pagina" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>${paginaInstance.titulo}</title>
	</head>
		<!-- CSS -->
		<link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/css/social-icons.css" type="text/css" media="screen" />
		
		<!-- JS -->
		<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="/js/jquery-ui-1.8.13.custom.min.js"></script>
		<script type="text/javascript" src="/js/easing.js"></script>
		<script type="text/javascript" src="/js/jquery.scrollTo-1.4.2-min.js"></script>
		<script type="text/javascript" src="/js/jquery.cycle.all.js"></script>
		<script type="text/javascript" src="/js/custom.js"></script>		

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

	<g:render template="header"  model="[paginaInstance: paginaInstance]"/>
	<g:render template="menu"  model="[paginaInstance: paginaInstance]"/>
	
	<!-- MAIN -->
	<div id="main">
		<!-- wrapper-main -->
		<div class="wrapper">
			<div id="headline">
				<span class="main">${paginaInstance.titulo}</span>
			</div>					
			<div id="content">
				<g:render template="slides" model="[slideInstanceList: slideInstanceList]"/>
				<g:render template="posts"  model="[postInstanceList: postInstanceList]"/>
				<g:render template="mapas"  model="[mapInstanceList: mapInstanceList]"/>
				<g:render template="galleries"  model="[imagenInstanceList: imagenInstanceList]"/>
				<g:render template="fbcomments"  model="[paginaInstance: paginaInstance]"/>
			</div>
	</div>
		<!-- ENDS wrapper-main -->
	</div>
	<!-- ENDS MAIN -->
	<g:render template="footer"  model="[paginaInstance: paginaInstance]"/>
	</body>
</html>