
<%@ page import="com.ocorp.media.Imagen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagen">
			
				<g:if test="${imagenInstance?.caption}">
				<li class="fieldcontain">
					<span id="caption-label" class="property-label"><g:message code="imagen.caption.label" default="Caption" /></span>
					
						<span class="property-value" aria-labelledby="caption-label"><g:fieldValue bean="${imagenInstance}" field="caption"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.imagen}">
				<li class="fieldcontain">
					<span id="imagen-label" class="property-label"><g:message code="imagen.imagen.label" default="Imagen" /></span>
					<span class="property-value"><img src="/imagen/showImage/${imagenInstance.id}" width="150" height="120"></span>
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="imagen.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${imagenInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.pagina}">
				<li class="fieldcontain">
					<span id="pagina-label" class="property-label"><g:message code="imagen.pagina.label" default="Pagina" /></span>
					
						<span class="property-value" aria-labelledby="pagina-label"><g:link controller="pagina" action="show" id="${imagenInstance?.pagina?.id}">${imagenInstance?.pagina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${imagenInstance?.id}" />
					<g:link class="edit" action="edit" id="${imagenInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
