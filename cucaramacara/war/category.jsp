<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"/>

		<!-- Modal code -->
		<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
		<script type='text/javascript' src='js/basic.js'></script>
		<link rel="stylesheet" href="/css/basic.css" />
		<div id="basic-modal-content"></div>

<script type="text/javascript">

$(document).ready(function() {
	$.ajax({                                                                                                 
		url: 'https://picasaweb.google.com/data/feed/api/user/104072732899717980890/albumid/${param.categoryId}/?alt=json&fields=entry%28gphoto:id,title,summary,media:group%28media:thumbnail,media:content%29%29&imgmax=400',
		dataType: 'jsonp',
		success: function(data){
		    var photos = {}
	        if(!data.feed.entry) return;
		    for(var i in data.feed.entry) {
		        var e     = data.feed.entry[i].media$group;
		        var id    = data.feed.entry[i].gphoto$id.$t;
		        
		        var t1h   = e.media$thumbnail[2].height;
		        var t1w   = e.media$thumbnail[2].width;
		        var t1src = e.media$thumbnail[2].url
		        
		        var t2w   = Math.round(t1w * 1.5);
		        var t2h   = Math.round(t1h * 1.5);

		        var t2src = e.media$content[0].url+'/../../w'+t2w+'-h'+t2h+'/';
	            
	            var bsrc  = e.media$content[0].url;
	            var bw    = e.media$content[0].width;
	            var bh    = e.media$content[0].height;
	            var title = data.feed.entry[i].summary.$t;
	            
	            var details = title.split("|"); 
	            
	            var pdpUrl = bsrc.replace('s400', 's1280');
				
		        var imageBehaivor = '<a onClick="quickView(\'/quickView.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=${param.categoryId}\');" href="#">';
		        //if (screen.width < 480) {
		        	imageBehaivor = '<a href="/pdp.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=${param.categoryId}">';	
		        //}
	            
				var product = 
					'<div class="element">'+
				'<div class="image">'+
				imageBehaivor +
					'<img alt="'+details[0]+'" src="'+bsrc+'" />'+
					'<div class="price">'+
						'<div class="sale">$'+jQuery.trim(details[3])+'</div>'+
						'<div class="has-sale">$'+jQuery.trim(details[2])+'</div>'+
					'</div>'+
					'</a>'+
				'</div>'+
				'<div class="content">'+
					'<div class="title">'+details[0]+'</div>'+
					'<p>'+details[1]+'</p>'+
				'</div>'+
				'<div class="productActions productActions1050">'+
					'<div class="add_to_cart ">'+
							'<a class="addToCart" href="/pdp.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=${param.categoryId}">Ver Detalles!</a>'+
					'</div>'+
				'</div>'+
				'</div>';
				$("#container").prepend(product);
	        }	
	    }
	});

});
</script>

		<section id="left_column">
	
			<header>
				<h1 id="categoryCount">
					
				</h1>
			</header>
			
			<div id="container" class="group">
				
			</div>
		</section>
		
		<jsp:include page="rightNav.jsp"/>
		
<jsp:include page="footer.jsp"/>
