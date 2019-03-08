<!DOCTYPE  html>
<html>
	<head>
		<meta charset="utf-8">
		<title>oCorp Web Solutions</title>
		
		<jsp:include page="includes.jsp"/>
		

	</head>
	
	<body>
	
	<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	

	<jsp:include page="header.jsp"/>    		
	<jsp:include page="menu.jsp">
  			<jsp:param name="from" value='socialMedia' />
	</jsp:include>
			
			<!-- MAIN -->
			<div id="main">
				<!-- wrapper-main -->
				<div class="wrapper">
					
					
					<!-- content -->
					<div id="content">
						
						<!-- title -->
						<div id="page-title">
							<span class="title">Social Media</span>
							<span class="subtitle">Integration.</span>
						</div>
						<!-- ENDS title -->
						
						<!-- Posts -->
						<div id="posts">
						
							<!-- post -->
							<div class="post">
								<h1><a href="#">Facebook</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Facebook page</strong></li>
											<li><strong>Likes en tu sitio</strong></li> 
											<li> <strong>Facebook commments en tu sitio</strong> 
											</li>
										</ul>
										<!-- ENDS meta -->
										<a href="#" class="cover"><img src="images/fb.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Diseñamos, creamos  e integramos tu página de Facebook con tu sito web para estar conectado con una de las principales redes sociales de nuestros tiempos.
										Facebooke Likes, Facebook commments estarán integrados con tu sito web y podrás administrarlo tu mismo.
										<div class="fb-comments" data-href="http://ocorpws.com" data-num-posts="2" data-width="470"></div>
									</div>	
								</div>
								<!-- ENDS shadow -->
							</div>
							<!-- ENDS post -->
							
							<!-- post -->
							<div class="post">
								<h1><a href="#">Twitter</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Twitter account</strong> </li>
											<li><strong>IntegraciÃ³n con tu sitio</strong></li> 
										</ul>
										<!-- ENDS meta -->
										<a href="#" class="cover"><img src="images/twitter.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Creamos tu cuenta de twitter y la integramos con tu sitio, así podrás mandar tweets desde tu sitio cuando quieras, además podrás ver quien te sigue en twitter en tu sitio.
										<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'profile',
  rpp: 4,
  interval: 30000,
  width: 600,
  height: 300,
  theme: {
    shell: {
      background: '#6b6a6b',
      color: '#ebe6eb'
    },
    tweets: {
      background: '#e0dde0',
      color: '#474347',
      links: '#201bb3'
    }
  },
  features: {
    scrollbar: false,
    loop: false,
    live: false,
    behavior: 'all'
  }
}).render().setUser('obedmhg').start();
</script>
									</div>		
								
								</div>
								<!-- ENDS shadow -->
							</div>
							<!-- ENDS post -->
		
						</div>
						<!-- ENDS Posts -->	
						
						
						<!-- sidebar -->
						<ul id="sidebar">
							<!-- init sidebar -->
							<li>
								<h6>Social Media</h6>		
								<ul>
									<li class="cat-item"><a href="http://www.facebook.com" class="poshytip  facebook" title="Become a fan">facebook</a></li>
									<li class="cat-item"><a href="http://www.twitter.com" class="poshytip twitter" title="Follow our tweets">twitter</a></li>
									<li class="cat-item"><a href="http://www.youtube.com" class="poshytip youtube" title="View our videos">Youtube</a></li>
								</ul>
							</li>	
							
							<!-- ENDS init sidebar -->
						</ul>
						<!-- ENDS sidebar -->
						
					</div>
					<!-- ENDS content -->

				</div>
				<!-- ENDS wrapper-main -->
			</div>
			<!-- ENDS MAIN -->
				
		<jsp:include page="footer.jsp"/>
	
	</body>
</html>