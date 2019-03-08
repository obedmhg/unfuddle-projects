<%@ page import="com.ocorp.media.Imagen" %>



<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="imagen.caption.label" default="Caption" />
		
	</label>
	<g:textField name="caption" value="${imagenInstance?.caption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'imagen', 'error')} ">
	<label for="imagen">
		<g:message code="imagen.imagen.label" default="Imagen" />
		
	</label>
	<input type="file" id="imagen" name="imagen" multiple="multiple"/>
	<span class="property-value"><img src="/imagen/showImage/${imagenInstance.id}" width="150" height="120"></span>
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="imagen.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${imagenInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'pagina', 'error')} required">
	<label for="pagina">
		<g:message code="imagen.pagina.label" default="Pagina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pagina" name="pagina.id" from="${com.ocorp.pagina.Pagina.list()}" optionKey="id" required="" value="${imagenInstance?.pagina?.id}" class="many-to-one"/>
</div>

