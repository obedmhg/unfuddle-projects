
<jsp:include page="header.jsp">
	<jsp:param value="contact" name="selectedPage"/>
</jsp:include>
<!-- content -->
		<article id="content">
			<div class="wrapper">
				<div class="box1">
					<div class="line1 wrapper">
						<section class="col1">
							<h2><strong>N</strong>uestra<span>Direccion</span></h2>
							<strong class="address">
								Pais:<br>
								Ciudad:<br>
								Direccion:<br><br>
								C.P.:<br>
								Telephone:<br>
								E-Mail:
							</strong>
							México<br>
							Chihuahua<br>
							Plaza Bahias y Perifierico de la juventud<br>
							31160<br>
							614-260-7230<br>
							<a href="mailto:">cucaramacarabebe@gmail.com</a>
						</section>
						<section class="col2 pad_left1">
							<h2 class="color2"><strong>C</strong>omo<span>Llegar</span></h2>
							<p class="pad_bot1">
								En Plaza Bahias en el periferico de la juevntud. 
							</p>
							<iframe width="580" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=217604528853714389070.0004d7ea6251754fc0c06&amp;ie=UTF8&amp;ll=28.68094,-106.136223&amp;spn=0,0&amp;t=m&amp;output=embed"></iframe><br /><small>View <a href="https://maps.google.com/maps/ms?msa=0&amp;msid=217604528853714389070.0004d7ea6251754fc0c06&amp;ie=UTF8&amp;ll=28.68094,-106.136223&amp;spn=0,0&amp;t=m&amp;source=embed" style="color:#0000FF;text-align:left">Cucara Macara Gym</a></small>
						</section>
					</div>
				</div>	
			</div>
			<div class="wrapper">
				<div class="pad_left2 relative">
					<h4 class="color3"><span>Contacto</span></h4>
					<form id="commentform" action="/cucaramacaragym" method="post">
						<div>
							<div class="wrapper"><span>Nombre:</span><br>
							<input  required="required" name="nombre"  id="nombre" type="text" class="form-poshytip" title="Tu nombre completo" /></div>
							<div class="wrapper"><span>email:</span><br>
							<input type="text" class="form-poshytip"  name="email"  id="email" title="Tu email"></div>
							<div class="wrapper"><span>Telefono:</span><br>
							<input type="text" class="form-poshytip"  name="tel"  id="Tel" title="Tu Telefono"></div>
							<div class="textarea_box"   title="Tu mensaje"><span>Tu Mesaje:</span><br>
							<textarea type="textarea" name="comments"  id="comments" cols="1" rows="2"></textarea></div>
							<a href="#" class="button2 color3" onClick="document.getElementById('commentform').submit()">Enviar</a>
							<a href="#" class="button2 color3" onClick="document.getElementById('commentform').reset()">Borrar</a>
						</div>
					</form>
				</div>
			</div>
		</article>
<!-- / content -->
<jsp:include page="footer.jsp">
	<jsp:param value="contact" name="selectedPage"/>
</jsp:include>