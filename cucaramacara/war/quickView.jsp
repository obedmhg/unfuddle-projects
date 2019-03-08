<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
							<a class="addToCart" href="/pdp.jsp?imageUrl=${param.imageUrl}&details=${param.details}&categoryId=${param.categoryId}">Ver Detalles!</a>
						</div>
					</div>
				
				</form>
				<p>
                </p>
			</div>
		 	
			<div id="product_main_image">
				<a href="/pdp.jsp?imageUrl=${param.imageUrl}&details=${param.details}&categoryId=${param.categoryId}">
		            <img alt="" align="left" id="main_image" src="${param.imageUrl}" />
		        </a>
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