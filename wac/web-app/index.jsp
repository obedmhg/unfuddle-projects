<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ocorp.slideshow.Slide" %>
<!DOCTYPE  html>
<html>
	<head>
		<meta charset="utf-8">
		<title>oCorp Web Solutions</title>
	</head>
		<!-- CSS -->
		<link rel="stylesheet" href="/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="/css/social-icons.css" type="text/css" media="screen" />
		<!--[if IE 8]>
			<link rel="stylesheet" type="text/css" media="screen" href="/css/ie8-hacks.css" />
		<![endif]-->
		<!-- ENDS CSS -->	
		
		<!-- GOOGLE FONTS 
		<link href='http:/fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>-->
		
		<!-- JS -->
		<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
		<script type="text/javascript" src="/js/jquery-ui-1.8.13.custom.min.js"></script>
		<script type="text/javascript" src="/js/easing.js"></script>
		<script type="text/javascript" src="/js/jquery.scrollTo-1.4.2-min.js"></script>
		<script type="text/javascript" src="/js/jquery.cycle.all.js"></script>
		<script type="text/javascript" src="/js/custom.js"></script>
		
		<!-- Isotope -->
		<script src="/js/jquery.isotope.min.js"></script>
		
		<!--[if IE]>
			<script src="/http:/html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<!--[if IE 6]>
			<script type="text/javascript" src="/js/DD_belatedPNG.js"></script>
			<script>
	      		/* EXAMPLE */
	      		/DD_belatedPNG.fix('*');
	    	</script>
		<![endif]-->
		<!-- ENDS JS -->
		
		
		<!-- Nivo slider -->
		<link rel="stylesheet" href="/css/nivo-slider.css" type="text/css" media="screen" />
		<script src="/js/nivo-slider/jquery.nivo.slider.js" type="text/javascript"></script>
		<!-- ENDS Nivo slider -->
		
		<!-- tabs -->
		<link rel="stylesheet" href="/css/tabs.css" type="text/css" media="screen" />
		<script type="text/javascript" src="/js/tabs.js"></script>
  		<!-- ENDS tabs -->
  		
  		<!-- prettyPhoto -->
		<script type="text/javascript" src="/js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="/js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="/css/superfish.css" /> 
		<link rel="stylesheet" media="screen" href="/css/superfish-left.css" /> 
		<script type="text/javascript" src="/js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script type="text/javascript" src="/js/superfish-1.4.8/js/superfish.js"></script>
		<script type="text/javascript" src="/js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="/js/poshytip-1.0/src/tip-twitter/tip-twitter.css" type="text/css" />
		<link rel="stylesheet" href="/js/poshytip-1.0/src/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
		<script type="text/javascript" src="/js/poshytip-1.0/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- Tweet -->
		<link rel="stylesheet" href="/css/jquery.tweet.css" media="all"  type="text/css"/> 
		<script src="/js/tweet/jquery.tweet.js" type="text/javascript"></script> 
		<!-- ENDS Tweet -->
		
		<!-- Fancybox -->
		<link rel="stylesheet" href="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
		<script type="text/javascript" src="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<!-- ENDS Fancybox -->
		
	
	<body class="home">	

	<div id="fb-root"></div>
	
	<script>
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "/connect.facebook.net/es_ES/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>

		<!-- HEADER -->
	<div id="header">
		<!-- wrapper-header -->
		<div class="wrapper">
			<a href="index.jsp"><img id="logo" src="img/logo.png" alt="Nova" /></a>
			<!-- search -->
			<div class="top-search">
				
			</div>
			<!-- ENDS search -->
		</div>
		<!-- ENDS wrapper-header -->					
	</div>
	<!-- ENDS HEADER -->
	
	    		
	<!-- Menu -->
	<div id="menu">
		<!-- ENDS menu-holder -->
		<div id="menu-holder">
			<!-- wrapper-menu -->
			<div class="wrapper">
				<!-- Navigation -->
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item""><a href="index.jsp">Home<span class="subheader">oCorp</span></a></li>
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
	
	
		<!-- Slider -->
	<div id="slider-block">
		<div id="slider-holder">
			<div id="slider">
				<a href="#"><img src="images/01.jpg" title="Desarrollo Web" alt="" /></a>
				<a href="clientes.html"><img src="images/02.jpg" title="Nuestros Clientes" alt="" /></a>
				<a href="socialMedia.html"><img src="images/03.jpg" title="Social Media" alt="" /></a>
				<a href="consultoria.html"><img src="images/04.jpg" title="Consultoria" alt="" /></a>
			</div>
		</div>
	</div>
	<!-- ENDS Slider -->
	
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
				<div class="fb-like" data-href="http:/www.ocorpws.com" data-send="true" data-width="450" data-show-faces="true"></div> 
			</div>
		</div>
		<!-- ENDS wrapper-main -->
	</div>
	<!-- ENDS MAIN -->
	<!-- FOOTER -->
			<div id="footer">
				<!-- wrapper-footer -->
				<div class="wrapper">
					<!-- footer-cols -->
					<ul id="footer-cols">
						<li class="col">
							<ul>
								<li class="page_item"><a href="index.jsp">Home</a> | <a href="clientes.jsp">Clientes</a> | <a href="socialMedia.jsp">Social Media</a> |  <a href="consultoria.jsp">Consultoria</a> | <a href="contact.jsp">Contacto</a></li>
							</ul>
						</li>
						
					</ul>
					<!-- ENDS footer-cols -->
				</div>
				<!-- ENDS wrapper-footer -->
			</div>
			<!-- ENDS FOOTER -->
		
			<!-- Bottom -->
			<div id="bottom">
				<!-- wrapper-bottom -->
				<div class="wrapper">
					<div id="bottom-text">2012 oCorp Chihuahua, Chihuahua, México.</div>
					<!-- Social -->
					<ul class="social ">
						<li><a href="http:/www.facebook.com" class="poshytip  facebook" title="Become a fan"></a></li>
						<li><a href="http:/www.twitter.com" class="poshytip twitter" title="Follow our tweets"></a></li>
						<li><a href="http:/www.vimeo.com" class="poshytip vimeo" title="View our videos"></a></li>
						<li><a href="http:/www.youtube.com" class="poshytip youtube" title="View our videos"></a></li>
					</ul>
					<!-- ENDS Social -->
					<div id="to-top" class="poshytip" title="To top"></div>
				</div>
				<!-- ENDS wrapper-bottom -->
			</div>
			<!-- ENDS Bottom -->
	</body>
</html>