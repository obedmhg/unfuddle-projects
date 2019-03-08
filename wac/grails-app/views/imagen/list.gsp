
<%@ page import="com.ocorp.media.Imagen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imagen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="caption" title="${message(code: 'imagen.caption.label', default: 'Caption')}" />
					
						<g:sortableColumn property="imagen" title="${message(code: 'imagen.imagen.label', default: 'Imagen')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'imagen.active.label', default: 'Active')}" />
					
						<th><g:message code="imagen.pagina.label" default="Pagina" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imagenInstanceList}" status="i" var="imagenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imagenInstance.id}">${fieldValue(bean: imagenInstance, field: "caption")}</g:link></td>
					
						<td><img src="/imagen/showImage/${imagenInstance.id}" width="150" height="120"></td>
					
						<td><g:formatBoolean boolean="${imagenInstance.active}" /></td>
					
						<td>${fieldValue(bean: imagenInstance, field: "pagina")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imagenInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
