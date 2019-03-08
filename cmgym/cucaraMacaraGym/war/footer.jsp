<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- footer -->
		<footer>
			<div class="wrapper">
				<nav>
					<ul id="footer_menu">
						<c:choose>
							<c:when test="${param.selectedPage eq 'home'}">
								<li class="active"><a href="index.jsp">Inicio</a></li>
							</c:when>
							<c:otherwise>
								<li ><a href="index.jsp">Inicio</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.selectedPage eq 'babyGym'}">
								<li class="active"><a href="#">Play Gym</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="contentPage.jsp?blogId=4493793314452683100&selectedPage=babyGym">Play Gym</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.selectedPage eq 'yoga'}">
								<li class="active"><a id="Blue" href="#">Yoga Para Mamis</a></li>
							</c:when>
							<c:otherwise>
								<li><a id="Blue" href="contentPage.jsp?blogId=5217291634640394224&selectedPage=yoga">Yoga Para Mamis</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.selectedPage eq 'musica'}">
								<li class="active"><a id="Green" href="#">Musica</a></li>
							</c:when>
							<c:otherwise>
								<li><a id="Green" href="contentPage.jsp?blogId=4794712200683669633&selectedPage=musica">Musica</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.selectedPage eq 'arte'}">
								<li class="active"><a id="Green" href="#">Arte</a></li>
							</c:when>
							<c:otherwise>
								<li><a id="Green" href="contentPage.jsp?blogId=8953307483407478126&selectedPage=arte">Arte</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${param.selectedPage eq 'contact'}">
								<li class="active"><a href="#">Contacto</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="contact.jsp">Contacto</a></li>
							</c:otherwise>
						</c:choose>
						
						<li><a id="Green" href="http://www.cucaramacarabebe.com">Tienda</a></li>
						
					</ul>
				</nav>
				<a href="http://www.facebook.com/cucaramacarababy" target="_blank"><img id="facebook" src="/images/facebook.png"/></a>
				<div class="tel"><span>614</span>260 72 30</div>
			</div>
			<div id="footer_text">
				Cucara Macara Gym | Chihuahua, Chihuahua
			</div>
		</footer>
<!-- / footer -->
	</div>
</div>
<script type="text/javascript">Cufon.now();</script>
<script>
$(window).load(function(){
	$('.slider')._TMS({
		preset:'zabor',
		easing:'easeOutQuad',
		duration:800,
		pagination:true,
		banners:true,
		waitBannerAnimation:false,
		slideshow:6000,
		bannerShow:function(banner){
			banner
				.css({right:'-700px'})
				.stop()
				.animate({right:'0'},600, 'easeOutExpo')
		},
		bannerHide:function(banner){
			banner
				.stop()
				.animate({right:'-700'},600,'easeOutExpo')
		}
	})
	$('.pagination li').hover(function(){
		if (!$(this).hasClass('current')) {
			$(this).find('a').stop().animate({backgroundPosition:'0 0'},600,'easeOutExpo', function(){$(this).parent().css({backgroundPosition:'-20px 0'})});
		}
	},function(){
		if (!$(this).hasClass('current')) {
			$(this).css({backgroundPosition:'0 0'}).find('a').stop().animate({backgroundPosition:'-250px 0'},600,'easeOutExpo');
		}
	})
})
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36313284-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>