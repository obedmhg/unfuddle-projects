<%@ page import="com.ocorp.blog.Post" %>
<!doctype html>
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
	

	<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	

		<!-- HEADER -->
	<div id="header">
		<!-- wrapper-header -->
		<div class="wrapper">
			<a href="index.jsp"><img id="logo" src="/img/logo.png" alt="Nova" /></a>
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
					<li ><a href="index.jsp">Home<span class="subheader">oCorp</span></a></li>
					<li class="current-menu-item"><a href="clientes.jsp">Clientes<span class="subheader">Nuestros Clientes</span></a></li>
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
	
	<!-- MAIN -->
	<div id="main">
		<!-- wrapper-main -->
		<div class="wrapper">					
			<!-- headline -->
			<div class="clear"></div>
			<!-- content -->
					<div id="content">
						
						<!-- title -->
						<div id="page-title">
							<span class="title">Nuestros Clientes</span>
							<span class="subtitle">Satisfechos</span>
						</div>
						<!-- ENDS title -->						
						<!-- Posts -->
						<div id="posts">
							<g:each in="${postInstanceList}" status="i" var="postInstance">						
									<!-- post -->
									<div class="post">
										<h1><a href="${postInstance.enlace}">${postInstance.titulo}</a></h1>
										<!-- shadow -->
										<div class="thumb-shadow">									
											<!-- post-thumb -->
											<div class="post-thumbnail">
												<!-- meta -->
												<ul class="meta">
													<li><strong>${postInstance.post}</strong></li>
												</ul>
												<!-- ENDS meta -->
												<a href="${postInstance.enlace}" class="cover"><img src="${postInstance.media}" width="600" height="270" alt="Feature image" /></a>
											</div>
											<!-- ENDS post-thumb -->
											<div class="the-excerpt">
												${postInstance.post}
												<g:if test="${postInstance.faceBookComments}">
													<div class="fb-comments" data-href="http://ocorpws.com/clientes.jsp#tbh" data-num-posts="2" data-width="470"></div>
												</g:if>
											</div>	
										</div>
										<!-- ENDS shadow -->
									</div>
									<!-- ENDS post -->
							</g:each>
						</div>
						<!-- sidebar -->
						<ul id="sidebar">
							<!-- init sidebar -->
							<li>
								<h6>Nuestros Clientes</h6>		
								<ul>
									<g:each in="${postInstanceList}" status="i" var="postInstance">
										<li class="cat-item"><a href="#" class="poshytip" title="${postInstance.titulo}">${postInstance.titulo}</a></li>
									</g:each>
								</ul>
							</li>	
							
							<!-- ENDS init sidebar -->
						</ul>
						<!-- ENDS sidebar -->
						
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
					<div id="bottom-text">2012 oCorp Chihuahua, Chihuahua, MÃ©xico.</div>
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