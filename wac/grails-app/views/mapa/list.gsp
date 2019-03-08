
<%@ page import="com.ocorp.maps.Mapa" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mapa.label', default: 'Mapa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mapa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'mapa.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'mapa.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'mapa.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'mapa.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="googleMapsUrl" title="${message(code: 'mapa.googleMapsUrl.label', default: 'Google Maps Url')}" />
					
						<th><g:message code="mapa.pagina.label" default="Pagina" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mapaInstanceList}" status="i" var="mapaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mapaInstance.id}">${fieldValue(bean: mapaInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: mapaInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: mapaInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: mapaInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: mapaInstance, field: "googleMapsUrl")}</td>
					
						<td>${fieldValue(bean: mapaInstance, field: "pagina")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mapaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
