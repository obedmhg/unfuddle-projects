	<!-- HEADER -->
	<div id="header">
		<!-- wrapper-header -->
		<div class="wrapper">
			<g:if test="${paginaInstance.logo != null && paginaInstance.logo.length > 0}">
				<img src="/pagina/showImage/${paginaInstance.id}">												
			</g:if>
			<g:else>
				<a href="#"><img id="logo" src="${paginaInstance.logoPrincipal}" alt="${paginaInstance.tituloMenu}" /></a>
			</g:else>
			
			<!-- search -->
			<div class="top-search">
				
			</div>
			<!-- ENDS search -->
		</div>
		<!-- ENDS wrapper-header -->					
	</div>
	<!-- ENDS HEADER -->