
<%@ page import="com.ocorp.maps.Mapa" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mapa.label', default: 'Mapa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mapa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mapa">
			
				<g:if test="${mapaInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="mapa.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${mapaInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="mapa.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${mapaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapaInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="mapa.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${mapaInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="mapa.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${mapaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapaInstance?.googleMapsUrl}">
				<li class="fieldcontain">
					<span id="googleMapsUrl-label" class="property-label"><g:message code="mapa.googleMapsUrl.label" default="Google Maps Url" /></span>
					
						<span class="property-value" aria-labelledby="googleMapsUrl-label"><g:fieldValue bean="${mapaInstance}" field="googleMapsUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapaInstance?.pagina}">
				<li class="fieldcontain">
					<span id="pagina-label" class="property-label"><g:message code="mapa.pagina.label" default="Pagina" /></span>
					
						<span class="property-value" aria-labelledby="pagina-label"><g:link controller="pagina" action="show" id="${mapaInstance?.pagina?.id}">${mapaInstance?.pagina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mapaInstance?.id}" />
					<g:link class="edit" action="edit" id="${mapaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
