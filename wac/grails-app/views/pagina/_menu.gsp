	<!-- Menu -->
	<div id="menu">
		<!-- ENDS menu-holder -->
		<div id="menu-holder">
			<!-- wrapper-menu -->
			<div class="wrapper">
				<!-- Navigation -->
				<ul id="nav" class="sf-menu">
					<g:each var="paginaIn" in="${paginaInstanceList}">
						<g:if test="${paginaIn.tituloMenu ==  paginaInstance.tituloMenu}">
							<li class="current-menu-item"><a href="/pagina/show/${paginaIn.tituloMenu}">${paginaIn.tituloMenu}</a></li>
						</g:if>
						<g:else>
     						<li><a href="/pagina/show/${paginaIn.tituloMenu}">${paginaIn.tituloMenu}</a></li>
						</g:else>
					</g:each>					
				</ul>
				<!-- Navigation -->
			</div>
			<!-- wrapper-menu -->
		</div>
		<!-- ENDS menu-holder -->
	</div>
	<!-- ENDS Menu -->