
<%@ page import="com.ocorp.pagina.Pagina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagina.label', default: 'Pagina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagina" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tituloMenu" title="${message(code: 'pagina.tituloMenu.label', default: 'Titulo Menu')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'pagina.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="logoPrincipal" title="${message(code: 'pagina.logoPrincipal.label', default: 'Logo Principal')}" />
					
						<g:sortableColumn property="logo" title="${message(code: 'pagina.logo.label', default: 'Logo')}" />
					
						<g:sortableColumn property="footer" title="${message(code: 'pagina.footer.label', default: 'Footer')}" />
					
						<g:sortableColumn property="facebookLike" title="${message(code: 'pagina.facebookLike.label', default: 'Facebook Like')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paginaInstanceList}" status="i" var="paginaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="edit" id="${paginaInstance.id}">${fieldValue(bean: paginaInstance, field: "tituloMenu")}</g:link></td>
					
						<td>${fieldValue(bean: paginaInstance, field: "titulo")}</td>
					
						<td><img id="logo" src="${paginaInstance.logoPrincipal}" /></td>
					
						<td><img src="/pagina/showImage/${paginaInstance.id}" width="150" height="120"></td>
					
						<td>${fieldValue(bean: paginaInstance, field: "footer")}</td>
					
						<td><g:formatBoolean boolean="${paginaInstance.facebookLike}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${paginaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
