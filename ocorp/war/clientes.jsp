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
  			<jsp:param name="from" value='clientes' />
	</jsp:include>
			
			<!-- MAIN -->
			<div id="main">
				<!-- wrapper-main -->
				<div class="wrapper">
					
					
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
						
							<!-- post -->
							<div class="post">
								<h1><a name="tbh" href="http://www.tbhconstrucciones.com">TBH Construcciones</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Galeria de Fotos</strong></li>
											<li><strong>Videos</strong></li>
											<li><strong>Integracion con Facebook</strong></li>  
											</li>
										</ul>
										<!-- ENDS meta -->
										<a href="http://www.tbhconstrucciones.com" class="cover"><img src="images/tbh.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Empresa especializada en jardinería, iluminación de exteriores, albercas, fuentes y mas.
										<div class="fb-comments" data-href="http://ocorpws.com/clientes.jsp#tbh" data-num-posts="2" data-width="470"></div>
									</div>	
								</div>
								<!-- ENDS shadow -->
							</div>
							<!-- ENDS post -->
							
							<!-- post -->
							<div class="post">
								<h1><a name="grupoAG">Grupo AG</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Integracion con Facebook</strong> </li>
											<li><strong>Galeria de Fotos</strong></li>
											<li><strong>Slide en home Page</strong></li>
										</ul>
										<!-- ENDS meta -->
										<a href="#" class="cover"><img src="images/02.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Venta y renta de casas y departamentos, tomando en cuenta las necesidades de el cliente, desde presupuesto hasta estilo de vida
										<div class="fb-comments" data-href="http://ocorpws.com/clientes.jsp#grupoAG" data-num-posts="2" data-width="470"></div>
									</div>										
								</div>
								<!-- ENDS shadow -->
							</div>
							<!-- ENDS post -->
														<!-- post -->
							<div class="post">
								<h1><a name="haideavitia">Haide Avitia Portfolio</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Integracion con Facebook</strong> </li>
											<li><strong>Galeria de Fotos</strong></li>
										</ul>
										<!-- ENDS meta -->
										<a href="http://www.ocorpws.com/haideavitia/index.html" class="cover"><img src="images/haideportfolio.png"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Portfolio de la Fotografa Haide Avitia
										<div class="fb-comments" data-href="http://www.ocorpws.com/clientes.jsp#haideavitia" data-num-posts="2" data-width="470"></div>
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
								<h6>Nuestros Clientes</h6>		
								<ul>
									<li class="cat-item"><a href="#tbh" class="poshytip  facebook" title="TBH Construcciones">TBH Construcciones</a></li>
									<li class="cat-item"><a href="#grupoAG" class="poshytip twitter" title="Grupo AG">Grupo AG</a></li>
									<li class="cat-item"><a href="#haideavitia" class="poshytip youtube" title="Haide Avitia Portfolio">Haide Avitia Protfolio</a></li>
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