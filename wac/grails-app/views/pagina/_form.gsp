<%@ page import="com.ocorp.pagina.Pagina" %>



<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'tituloMenu', 'error')} required">
	<label for="tituloMenu">
		<g:message code="pagina.tituloMenu.label" default="Titulo Menu" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tituloMenu" required="" value="${paginaInstance?.tituloMenu}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="pagina.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${paginaInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'logoPrincipal', 'error')} ">
	<label for="logoPrincipal">
		<g:message code="pagina.logoPrincipal.label" default="Logo Principal" />
		
	</label>
	<g:field type="url" name="logoPrincipal" value="${paginaInstance?.logoPrincipal}"/>
	<img id="logo" src="${paginaInstance.logoPrincipal}" />
</div>

<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="pagina.logo.label" default="Logo" />
		
	</label>
	<input type="file" id="logo" name="logo" />
</div>

<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'footer', 'error')} ">
	<label for="footer">
		<g:message code="pagina.footer.label" default="Footer" />
		
	</label>
	<g:textField name="footer" value="${paginaInstance?.footer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paginaInstance, field: 'facebookLike', 'error')} ">
	<label for="facebookLike">
		<g:message code="pagina.facebookLike.label" default="Facebook Like" />
		
	</label>
	<g:checkBox name="facebookLike" value="${paginaInstance?.facebookLike}" />
</div>

