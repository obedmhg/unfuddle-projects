<%@ page import="com.ocorp.blog.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="post.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${postInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'post', 'error')} ">
	<label for="post">
		<g:message code="post.post.label" default="Post" />
		
	</label>
	<g:textArea name="post" cols="40" rows="5" value="${postInstance?.post}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'media', 'error')} ">
	<label for="media">
		<g:message code="post.media.label" default="Media" />
		
	</label>
	<input type="file" id="media" name="media" />
	<input type="hidden" id="prevMedia" value="${postInstance?.media}" />
	<span class="property-value" aria-labelledby="mediaUrl-label"><img src="/post/showImage/${postInstance.id}" width="150" height="120"></span>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'mediaUrl', 'error')} ">
	<label for="mediaUrl">
		<g:message code="post.mediaUrl.label" default="Media Url" />
		
	</label>
	<g:field type="url" name="mediaUrl" value="${postInstance?.mediaUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'enlace', 'error')} ">
	<label for="enlace">
		<g:message code="post.enlace.label" default="Enlace" />
		
	</label>
	<g:textField name="enlace" value="${postInstance?.enlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'pagina', 'error')} required">
	<label for="pagina">
		<g:message code="post.pagina.label" default="Pagina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pagina" name="pagina.id" from="${com.ocorp.pagina.Pagina.list()}" optionKey="id" required="" value="${postInstance?.pagina?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'faceBookComments', 'error')} ">
	<label for="faceBookComments">
		<g:message code="post.faceBookComments.label" default="Face Book Comments" />
		
	</label>
	<g:checkBox name="faceBookComments" value="${postInstance?.faceBookComments}" />
</div>

