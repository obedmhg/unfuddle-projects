<%@ page import="com.ocorp.maps.Mapa" %>



<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="mapa.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${mapaInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="mapa.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${mapaInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="mapa.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${mapaInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="mapa.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${mapaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'googleMapsUrl', 'error')} ">
	<label for="googleMapsUrl">
		<g:message code="mapa.googleMapsUrl.label" default="Google Maps Url" />
		
	</label>
	<g:field type="url" name="googleMapsUrl" value="${mapaInstance?.googleMapsUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapaInstance, field: 'pagina', 'error')} required">
	<label for="pagina">
		<g:message code="mapa.pagina.label" default="Pagina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pagina" name="pagina.id" from="${com.ocorp.pagina.Pagina.list()}" optionKey="id" required="" value="${mapaInstance?.pagina?.id}" class="many-to-one"/>
</div>

