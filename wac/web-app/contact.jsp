<!DOCTYPE  html>
<html>
	<head>
		<meta charset="utf-8">
		<title>oCorp Web Solutions</title>
		<jsp:include page="includes.jsp"/>
	</head>
	
	<body>

	<jsp:include page="header.jsp"/>    		
	<jsp:include page="menu.jsp">
  			<jsp:param name="from" value='contacto' />
	</jsp:include>
			
			<!-- MAIN -->
			<div id="main">
				<!-- wrapper-main -->
				<div class="wrapper">
					
					<!-- content -->
					<div id="content">
						
						<!-- title -->
						<div id="page-title">
							<span class="title">Contacto</span>
							<span class="subtitle">Nos interesa tu negocio.</span>
						</div>
						<!-- ENDS title -->
							
						<!-- column (left)-->
						<div class="one-column">
							<!-- form -->
							<script type="text/javascript" src="js/form-validation.js"></script>
							<form id="contactForm" action="/ocorpServlet" method="post">
								<fieldset>
									<div>
										<label>Nombre</label>
										<input name="name"  id="name" type="text" class="form-poshytip" title="Tu nombre completo" />
									</div>
									<div>
										<label>Email</label>
										<input name="email" type="email"  id="email"  class="form-poshytip" title="Tu email address" />
									</div>
									<div>
										<label>Comentarios</label>
										<textarea  name="comments"  id="comments" rows="5" cols="20" class="form-poshytip" title="Tus Comentarios"></textarea>
									</div>
									
									<!-- send mail configuration -->
									<input type="hidden" value="obed@ocorpws.com" name="to" id="to" />
									<input type="hidden" value="obed@ocorpws.com" name="from" id="from" />
									<!-- ENDS send mail configuration -->
									
									<p><input type="submit" value="Enviar" name="submit" id="submit" /></p>
								</fieldset>
								<p id="error" class="warning">Message</p>
							</form>
							<p id="success" class="success">Gracias por tus comentarios.</p>
							<!-- ENDS form -->
						</div>
						<!-- ENDS column -->
						
						<!-- column (right)-->
						<div class="one-column">
							<!-- content -->
							<p>
							<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=pit2+chihuahua&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=46.630055,107.138672&amp;ie=UTF8&amp;hq=pit2&amp;hnear=Chihuahua+Municipality,+Chihuahua,+Mexico&amp;t=m&amp;ll=28.676695,-106.076388&amp;spn=0.013178,0.018239&amp;z=15&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=pit2+chihuahua&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=46.630055,107.138672&amp;ie=UTF8&amp;hq=pit2&amp;hnear=Chihuahua+Municipality,+Chihuahua,+Mexico&amp;t=m&amp;ll=28.676695,-106.076388&amp;spn=0.013178,0.018239&amp;z=15" style="color:#0000FF;text-align:left"></a></small>
							</p>
							<p>Proximamente PIT2<br/>
							MX ZIP 31300<br/>
							(52) 6141 82- 5638<br/>
							<a href="mailto:obed@ocorpws.com">obed@ocorpws.com</a></p>
							<!-- ENDS content -->
						</div>
						<!-- ENDS column -->							
		
					</div>
					<!-- ENDS content -->

				</div>
				<!-- ENDS wrapper-main -->
			</div>
			<!-- ENDS MAIN -->
			
		<jsp:include page="footer.jsp"/>  
	</body>
</html>