<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"/>

<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>


<script type="text/javascript">
$(document).ready(function() {
	//$(".addToCart").attr('href', '/paypal.jsp?categoryId=${param.categoryId}&productUrl=${param.imageUrl}');
	$(".addToCart").attr('href', '/contact.jsp?productUrl='+window.location);
});
</script>

	<c:set var="details" value="${fn:split(param.details, '|')}"/>
			
		<section id="left_column">
		
			<div id="product_content" class="product_container">
				<c:if test="${fn:length(details) > 1}">
					<h2>${details[0]}</h2>
				</c:if>
				
				<div id="maker">Haide&#39;s Factory</div>
				
				<div id="price">
					<c:if test="${fn:length(details) > 1}">
						<div class="sale">${details[3]}</div>
						<div class="has-sale">${details[2]}</div>
					</c:if>
				</div>
				
				<div class="product-options hidden">
	
	<div id="product-option-data" hidden="hidden" data-product-option-pricing="[]" data-product-options="[]"></div>
	<ul>
		
	</ul>
	
	<span class="error centered" style="display: none;">All options are required</span>
</div>								
				
				<form method="POST" action="/paypal">
					<c:if test="${fn:length(details) > 1}">
						<div id="description">${details[1]}</div>
					</c:if>
					<div class="productActions1056">
						<div class="add_to_cart ">
							<a class="addToCart" href="/contact.jsp?productUrl=">Comprar!</a>
						</div>
					</div>
				
				</form>
				<p>
					Comparte con tus amigos:
                    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                        <a class="addthis_button_preferred_1"></a>
                        <a class="addthis_button_preferred_2"></a>
                        <a class="addthis_button_preferred_3"></a>
                        <a class="addthis_button_preferred_4"></a>
                        <a class="addthis_button_compact"></a>
                        <a class="addthis_counter addthis_bubble_style"></a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-5006d3e47d6ace5d"></script>
                </p>
			</div>
		 	
			<div id="product_main_image">
				<a class="jqzoom" id="zoom1" rel="gal1" href="${param.imageUrl}">
		            <img alt="" align="left" id="main_image" src="${param.imageUrl}" />
		        </a>
			</div>
			
			<div id="product_thumbs_container">
				<ul id="product_thumbs" class="clearfix">
					<li>
						<a href="javascript:;" class="zoomThumbActive" rel="{ gallery: &#39;gal1&#39;, smallimage: &#39;${param.imageUrl}&#39;, largeimage: &#39;${param.imageUrl}&#39; }">
							<img alt="Bottle Closeup" src="${param.imageUrl}" />
						</a>
					</li>
				</ul>
			</div>			
			<div class="clearfix"></div>
				<script type="text/javascript">
					$(document).ready(function() {
						$(".fb-comments").attr("data-href", $(location).attr('href'));
					});
				</script>
                <div id="customer-reviews-container">
                	<div class="fb-comments" data-href="href" data-num-posts="2" data-width="470"></div>
                </div>	
             		
		</section>
	
		<jsp:include page="rightNav.jsp"/>
		
<jsp:include page="footer.jsp"/>