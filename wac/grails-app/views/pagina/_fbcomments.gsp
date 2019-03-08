

<g:if test="${paginaInstance.facebookLike}">
	<div class="fb-like" data-href="http://www.ocorpws.com"
		data-send="true" data-width="450" data-show-faces="true"></div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".fb-like").attr("data-href", $(location).attr('href'));
		});
	</script>
</g:if>
