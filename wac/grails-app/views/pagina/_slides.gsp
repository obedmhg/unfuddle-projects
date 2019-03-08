	<!-- Nivo slider -->
	<link rel="stylesheet" href="/css/nivo-slider.css" type="text/css" media="screen" />
	<script src="/js/nivo-slider/jquery.nivo.slider.js" type="text/javascript"></script>
	<!-- ENDS Nivo slider -->


	<g:if test="${slideInstanceList != null && slideInstanceList.size != 0}">
		<!-- Slider -->
		<div id="slider-block">
			<div id="slider-holder">
				<div id="slider">
				<g:each in="${slideInstanceList}" status="i" var="slideInstance">
					<g:if test="${slideInstance.active}">
						<g:if test="${slideInstance.imagen != null && slideInstance.imagen.length > 0}">
							<img src="/slide/showImage/${slideInstance.id}" width="904" height="390" >												
						</g:if>
						<g:else>
							<a href="#"><img src="${slideInstance.imageUrl}" title="${slideInstance.caption}" alt="${slideInstance.caption}" width="904" height="390" /></a>
						</g:else>
	     				
					</g:if>
				</g:each>
				</div>
			</div>
		</div>
		<!-- ENDS Slider -->
	</g:if>	