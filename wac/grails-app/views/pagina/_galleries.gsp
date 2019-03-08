<div class="clear"></div>
<g:if test="${imagenInstanceList != null && imagenInstanceList.size != 0}">
	<div class="featured portfolio-list">
	<g:each in="${imagenInstanceList}" status="i" var="imagenInstance">
			<g:if test="${imagenInstance.active}">
        		<figure>
        			<a href="/imagen/showImage/${imagenInstance.id}" rel="prettyPhoto[pp_gal]"  class="thumb" title="${imagenInstance.caption}"><img src="/imagen/showImage/${imagenInstance.id}" width="160" height="120" alt="${imagenInstance.caption}" /></a>	        			
        		</figure>
			</g:if>
	</g:each>
	</div>
</g:if>
