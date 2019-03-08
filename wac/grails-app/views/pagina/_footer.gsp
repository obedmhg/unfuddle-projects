<!-- FOOTER -->
<div id="footer">
	<!-- wrapper-footer -->
	<div class="wrapper">
		<!-- footer-cols -->
		<ul id="footer-cols">
			<li class="col">
				<ul>
				<li class="page_item">
					<g:each var="paginaIn" in="${paginaInstanceList}">
						<a href="/pagina/show/${paginaIn.tituloMenu}">${paginaIn.tituloMenu} | </a>
					</g:each>
				</li>
				</ul>
			</li>
			
		</ul>
		<!-- ENDS footer-cols -->
	</div>
	<!-- ENDS wrapper-footer -->
</div>
<!-- ENDS FOOTER -->
<!-- Bottom -->
<div id="bottom">
	<!-- wrapper-bottom -->
	<div class="wrapper">
		<div id="bottom-text">${paginaInstance.footer}</div>
		<!-- Social -->
		<ul class="social ">
			<li><a href="http:/www.facebook.com" class="poshytip  facebook" title="Become a fan"></a></li>
			<li><a href="http:/www.twitter.com" class="poshytip twitter" title="Follow our tweets"></a></li>
			<li><a href="http:/www.vimeo.com" class="poshytip vimeo" title="View our videos"></a></li>
			<li><a href="http:/www.youtube.com" class="poshytip youtube" title="View our videos"></a></li>
		</ul>
		<!-- ENDS Social -->
		<div id="to-top" class="poshytip" title="To top"></div>
	</div>
	<!-- ENDS wrapper-bottom -->
</div>
<!-- ENDS Bottom -->
