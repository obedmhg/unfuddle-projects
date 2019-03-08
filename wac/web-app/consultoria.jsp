<!DOCTYPE  html>
<html>
	<head>
		<title>oCorp Web Solutions</title>
		
			<jsp:include page="includes.jsp"/>

	</head>
	
	<body>

	<jsp:include page="header.jsp"/>    		
	<jsp:include page="menu.jsp">
  			<jsp:param name="from" value='consultoria' />
	</jsp:include>
			
			<!-- MAIN -->
			<div id="main">
				<!-- wrapper-main -->
				<div class="wrapper">
					
					
					<!-- content -->
					<div id="content">
						
						<!-- title -->
						<div id="page-title">
							<span class="title">Consultoria</span>
							<span class="subtitle">Tecnologias Web.</span>
						</div>
						<!-- ENDS title -->
						
						<!-- Posts -->
						<div id="posts">
						
							<!-- post -->
							<div class="post">
								<h1><a href="single.html">Proyectos</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Agile Development</strong></li>
											<li><strong>Best Practices</strong></li>  
										</ul>
										<!-- ENDS meta -->
										<a href="single.html" class="cover"><img src="images/04.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										El desarrollo ágil de software es un marco de trabajo conceptual de la ingeniería de software que promueve iteraciones en el desarrollo a lo largo de todo el ciclo de vida del proyecto.
										Nosotros tenemos la experiencia para ayudar a que tu proyecto web sea un éxito.
									</div>		
								</div>
								<!-- ENDS shadow -->
							</div>
							<!-- ENDS post -->
							
							<!-- post -->
							<div class="post">
								<h1><a href="single.html">Entrenamiento</a></h1>
								
								<!-- shadow -->
								<div class="thumb-shadow">
								
									<!-- post-thumb -->
									<div class="post-thumbnail">
										<!-- meta -->
										<ul class="meta">
											<li><strong>Java</strong> </li>
											<li><strong>Oracle PL/SQL</strong></li> 
											<li><strong>Grails</strong></li>
											<li><strong>Android</strong></li>
											<li><strong>y más..</strong></li>
										</ul>
										<!-- ENDS meta -->
										<a href="single.html" class="cover"><img src="images/javaCode.jpg"  alt="Feature image" /></a>
									</div>
									<!-- ENDS post-thumb -->
									
									<div class="the-excerpt">
										Ofrecemos entrenamiento a empresas en desarrollo, la mayoría de nuestra experiencia se basa en tecnologías Java.
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
								<h6>Consultoria</h6>		
								<ul>
									<li class="cat-item">Administración de proyectos</li>
									<li class="cat-item">Entrenamiento</li>
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