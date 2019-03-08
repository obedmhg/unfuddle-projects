		<!-- Tweet --> 
		<script src="/js/tweet/jquery.tweet.js" type="text/javascript"></script> 
		<!-- ENDS Tweet -->


		<!-- poshytip -->
		<link rel="stylesheet" href="/js/poshytip-1.0/src/tip-twitter/tip-twitter.css" type="text/css" />
		<link rel="stylesheet" href="/js/poshytip-1.0/src/tip-yellowsimple/tip-yellowsimple.css" type="text/css" />
		<script type="text/javascript" src="/js/poshytip-1.0/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- superfish --> 
		<script type="text/javascript" src="/js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script type="text/javascript" src="/js/superfish-1.4.8/js/superfish.js"></script>
		<script type="text/javascript" src="/js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
<g:if test="${postInstanceList != null && postInstanceList.size != 0}">
	<!-- Posts -->
	<div id="posts">
		<g:each in="${postInstanceList}" status="i" var="postInstance">
			<!-- post -->
			<div class="post">
				<h1>
					<a name="${postInstance.titulo}" href="${postInstance.enlace}">
						${postInstance.titulo}
					</a>
				</h1>
				<!-- shadow -->
				<div class="thumb-shadow">
					<!-- post-thumb -->
					<div class="post-thumbnail">
						<!-- meta -->
						<ul class="meta">
							<li><strong>
									${postInstance.post}
							</strong></li>
						</ul>
						<!-- ENDS meta -->
						<a href="${postInstance.enlace}" class="cover"> <g:if
								test="${postInstance.media != null && postInstance.media.length > 0}">
								<img src="/post/showImage/${postInstance.id}" width="600"
									height="270" />
							</g:if> <g:else>
								<g:getAsMedia media="${postInstance.mediaUrl}" width="600"
									height="270" />
							</g:else>
						</a>
					</div>
					<!-- ENDS post-thumb -->
					<div class="the-excerpt">
						<g:if test="${postInstance.faceBookComments}">
							<div class="fb-comments" data-href="" data-num-posts="2"
								data-width="470"></div>
							<script type="text/javascript">
											$(document).ready(function() {
												$(".fb-comments").attr("data-href", $(location).attr('href') + "#" + "${postInstance.titulo}");
											});
										</script>
						</g:if>
					</div>
				</div>
				<!-- ENDS shadow -->
			</div>
			<!-- ENDS post -->
		</g:each>
	</div>
	<ul id="sidebar">
		<!-- init sidebar -->
		<li>
			<h6>
				${paginaInstance.titulo}
			</h6>
			<ul>
				<g:each in="${postInstanceList}" status="i" var="postInstance">
					<li class="cat-item"><a href="#${postInstance.titulo}"
						class="poshytip" title="${postInstance.titulo}">
							${postInstance.titulo}
					</a></li>
				</g:each>
			</ul>
		</li>
		<!-- ENDS init sidebar -->
	</ul>
</g:if>