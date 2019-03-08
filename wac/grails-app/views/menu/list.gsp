<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.home.label"/></title>
	</head>
	<body>
		<a href="#list-mapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-mapa" class="content scaffold-list" role="main">
			<h1><g:message code="default.home.label"/></h1>
				<ul style="padding-left: 50px;">
					<li><a href="/pagina/list"><g:message code="wac.links.paginas"/></a></li>
					<li><a href="/post/list"><g:message code="wac.links.posts"/></a></li>
					<li><a href="/slide/list"><g:message code="wac.links.slides"/></a></li>
					<li><a href="/mapa/list"><g:message code="wac.links.mapas"/></a></li>
					<li><a href="/imagen/list"><g:message code="wac.links.galerias"/></a></li>					
				</ul>
				<g:if test="${paginaInstanceList.size > 0}">
					<g:each var="paginaInstance" in="${paginaInstanceList}">
							<div style="float: left">
								<a href="/pagina/elive/${paginaInstance.tituloMenu}">
									<img src="/images/page.png" width="60" height="76"/> 
									<br>${paginaInstance.tituloMenu }
								</a>
							</div>
					</g:each>

					<div class="clear"></div>
					<div style="float: left">
						<a href="/pagina/create"><img src="/images/new_page.png" width="60" height="76"/>
							<br> Nueva
						</a>
					</div>
				</g:if>
				<g:else>
					<a href="/pagina/create"><img src="/images/new_page.png" width="60" height="76"/></a>
				</g:else>
				
		</div>
	</body>
</html>
