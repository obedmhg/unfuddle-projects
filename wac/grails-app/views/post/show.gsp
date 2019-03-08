
<%@ page import="com.ocorp.blog.Post" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
				<g:if test="${postInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="post.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${postInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.post}">
				<li class="fieldcontain">
					<span id="post-label" class="property-label"><g:message code="post.post.label" default="Post" /></span>
					
						<span class="property-value" aria-labelledby="post-label"><g:fieldValue bean="${postInstance}" field="post"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.media}">
				<li class="fieldcontain">
					<span id="media-label" class="property-label"><g:message code="post.media.label" default="Media" /></span>
					<span class="property-value" aria-labelledby="mediaUrl-label"><img src="/post/showImage/${postInstance.id}" width="150" height="120"></span>
				</li>
				</g:if>
			
				<g:if test="${postInstance?.mediaUrl}">
				<li class="fieldcontain">
					<span id="mediaUrl-label" class="property-label"><g:message code="post.mediaUrl.label" default="Media Url" /></span>
					
						<span class="property-value" aria-labelledby="mediaUrl-label"><g:fieldValue bean="${postInstance}" field="mediaUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.enlace}">
				<li class="fieldcontain">
					<span id="enlace-label" class="property-label"><g:message code="post.enlace.label" default="Enlace" /></span>
					
						<span class="property-value" aria-labelledby="enlace-label"><g:fieldValue bean="${postInstance}" field="enlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.pagina}">
				<li class="fieldcontain">
					<span id="pagina-label" class="property-label"><g:message code="post.pagina.label" default="Pagina" /></span>
					
						<span class="property-value" aria-labelledby="pagina-label"><g:link controller="pagina" action="show" id="${postInstance?.pagina?.id}">${postInstance?.pagina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.faceBookComments}">
				<li class="fieldcontain">
					<span id="faceBookComments-label" class="property-label"><g:message code="post.faceBookComments.label" default="Face Book Comments" /></span>
					
						<span class="property-value" aria-labelledby="faceBookComments-label"><g:formatBoolean boolean="${postInstance?.faceBookComments}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${postInstance?.id}" />
					<g:link class="edit" action="edit" id="${postInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
