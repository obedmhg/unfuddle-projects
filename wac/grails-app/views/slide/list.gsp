
<%@ page import="com.ocorp.slideshow.Slide" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'slide.label', default: 'Slide')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-slide" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-slide" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="caption" title="${message(code: 'slide.caption.label', default: 'Caption')}" />
					
						<g:sortableColumn property="imagen" title="${message(code: 'slide.imagen.label', default: 'Imagen')}" />
					
						<g:sortableColumn property="imageUrl" title="${message(code: 'slide.imageUrl.label', default: 'Image Url')}" />
					
						<th><g:message code="slide.pagina.label" default="Pagina" /></th>
					
						<g:sortableColumn property="active" title="${message(code: 'slide.active.label', default: 'Active')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${slideInstanceList}" status="i" var="slideInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${slideInstance.id}">${fieldValue(bean: slideInstance, field: "caption")}</g:link></td>
					
						<td><img src="/slide/showImage/${slideInstance.id}" width="150" height="120"></td>
					
						<td>${fieldValue(bean: slideInstance, field: "imageUrl")}</td>
					
						<td>${fieldValue(bean: slideInstance, field: "pagina")}</td>
					
						<td><g:formatBoolean boolean="${slideInstance.active}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${slideInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
