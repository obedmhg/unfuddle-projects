<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="./css/formStyle.css" />

<jsp:include page="header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
    var elements = document.getElementsByTagName("INPUT");
    for (var i = 0; i < elements.length; i++) {
        elements[i].oninvalid = function(e) {
            e.target.setCustomValidity("");
            if (!e.target.validity.valid) {
                e.target.setCustomValidity("Necesitamos tu " + e.target.name + " para contactarte :).");
            }
        };
        elements[i].oninput = function(e) {
            e.target.setCustomValidity("");
        };
    }
    
    $('#contactForm').submit(function() {
    	  if($('#email').val() == '') {
    		  alert("Necesitamos tu email para contactarte :).");
    	  }
    });
    
})

</script>

	<section id="left_column">
		<header>
			<h1>Contacto</h1>
		</header>
		<div class="clearfix"></div>
			<div class="one-column">
				<form id="contactForm" action="/cucaramacara" method="post">
						<fieldset>
							<div>
								Nombre <br>
								<input  required="required" name="nombre"  id="nombre" type="text" class="form-poshytip" title="Tu nombre completo" />
							</div>
							<div>
								Email <br>
								<input  required="required" name="email" type="email"  id="email"  class="form-poshytip" title="Tu email address" />
							</div>
							
							<c:choose>
								<c:when test="${param.productUrl ne null}">
									<div>
									Comentarios <br>
									<textarea required="required"  name="comments"  id="comments" rows="10" cols="20" class="form-poshytip" title="Tus Comentarios">Hola Cucara Macara:

Me gustaria comprar este producto ${param.productUrl}

										</textarea>
									</div>
								</c:when>
								<c:otherwise>
									<div>
									Comentarios <br>
									<textarea  name="comments"  id="comments" rows="5" cols="20" class="form-poshytip" title="Tus Comentarios"></textarea>
									</div>
																	
								</c:otherwise>
							</c:choose>
																					
							<p><input type="submit" value="Enviar" class="addToCart" name="submit" id="submit" /></p>
						</fieldset>
					</form>
				</div>
	</section>
	<div><div align="center"><img src="http://i.imgur.com/akuJg.png" /><br />
	
	<a href="http://www.facebook.com/cucaramacarabebe" target="_blank">Siguenos en <img src="http://ottopilotmedia.com/wp-content/uploads/2012/07/facebook-icon.jpg"  width="45" height="45"/></a>
	
		
<jsp:include page="footer.jsp"/>
