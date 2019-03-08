
<%@ page import="com.ocorp.slideshow.Slide" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'slide.label', default: 'Slide')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-slide" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-slide" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list slide">
			
				<g:if test="${slideInstance?.caption}">
				<li class="fieldcontain">
					<span id="caption-label" class="property-label"><g:message code="slide.caption.label" default="Caption" /></span>
					
						<span class="property-value" aria-labelledby="caption-label"><g:fieldValue bean="${slideInstance}" field="caption"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slideInstance?.imagen}">
				<li class="fieldcontain">
					<span id="imagen-label" class="property-label"><g:message code="slide.imagen.label" default="Imagen" />
					</span>
					<span class="property-value" aria-labelledby="imageUrl-label"><img src="/slide/showImage/${slideInstance.id}" width="150" height="120"></span>
					
				</li>
				</g:if>
			
				<g:if test="${slideInstance?.imageUrl}">
				<li class="fieldcontain">
					<span id="imageUrl-label" class="property-label"><g:message code="slide.imageUrl.label" default="Image Url" /></span>
					
						<span class="property-value" aria-labelledby="imageUrl-label"><g:fieldValue bean="${slideInstance}" field="imageUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${slideInstance?.pagina}">
				<li class="fieldcontain">
					<span id="pagina-label" class="property-label"><g:message code="slide.pagina.label" default="Pagina" /></span>
					
						<span class="property-value" aria-labelledby="pagina-label"><g:link controller="pagina" action="show" id="${slideInstance?.pagina?.id}">${slideInstance?.pagina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${slideInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="slide.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${slideInstance?.active}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${slideInstance?.id}" />
					<g:link class="edit" action="edit" id="${slideInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
