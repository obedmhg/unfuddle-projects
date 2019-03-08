<%@ page import="com.ocorp.slideshow.Slide" %>



<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="slide.caption.label" default="Caption" />
		
	</label>
	<g:textField name="caption" value="${slideInstance?.caption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'imagen', 'error')} ">
	<label for="imagen">
		<g:message code="slide.imagen.label" default="Imagen" />
		
	</label>
	<input type="file" id="imagen" name="imagen" />
	<span class="property-value"><img src="/slide/showImage/${slideInstance.id}" width="150" height="120"></span>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'imageUrl', 'error')} ">
	<label for="imageUrl">
		<g:message code="slide.imageUrl.label" default="Image Url" />
		
	</label>
	<g:textField name="imageUrl" value="${slideInstance?.imageUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'pagina', 'error')} required">
	<label for="pagina">
		<g:message code="slide.pagina.label" default="Pagina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pagina" name="pagina.id" from="${com.ocorp.pagina.Pagina.list()}" optionKey="id" required="" value="${slideInstance?.pagina?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: slideInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="slide.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${slideInstance?.active}" />
</div>

