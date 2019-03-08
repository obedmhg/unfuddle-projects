<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"/>

		<!-- Modal code -->
		<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
		<script type='text/javascript' src='js/basic.js'></script>
		<link rel="stylesheet" href="/css/basic.css" />
		<div id="basic-modal-content"></div>


<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script type="text/javascript">

$(document).ready(function() {
	$.ajax({                                                                                                 
		url: 'https://picasaweb.google.com/data/feed/api/user/104072732899717980890/albumid/5805519703666988449/?alt=json&fields=entry%28gphoto:id,title,summary,media:group%28media:thumbnail,media:content%29%29&imgmax=400',
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
	            
		        photos[id] = {id:id,img:bsrc,width:bw,height:bh,th:{src:t1src,width:t1w,height:t1h,zoom_src:t2src,zoom_factor:1.5}};
		        
		        var imageBehaivor = '<a onClick="quickView(\'/quickView.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=5805519703666988449\');" href="#">';
		        //if (screen.width < 480) {
		        	imageBehaivor = '<a href="/pdp.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=5805519703666988449">';	
		        //}
		        		        
				var product = '<li class="product_container">'+
				'<div class="image">'+
					imageBehaivor +
					'<img alt="'+details[0]+'" src="'+bsrc+'" />'+
					'<div class="price">'+
						'<div class="sale">$'+details[3]+'</div>'+
						'<div class="has-sale">$'+details[2]+'</div>'+
					'</div>'+
					'</a>'+
				'</div>'+
				'<div class="content">'+
					'<div class="title">'+details[0]+'</div>'+
					'<p>'+details[1]+'</p>'+
				'</div>'+
				'<div class="productActions productActions1050">'+
					'<div class="add_to_cart ">'+
						'<a class="addToCart" href="/pdp.jsp?imageUrl='+ pdpUrl +'&details=' + title +'&categoryId=5805519703666988449">Ver Detalles!</a>'+
					'</div>'+
				'</div>'+
				'</li>';
				$("#products").prepend(product);
	        }	
	    }
	});	
	
});
</script>

		<div id="banners">
			<jsp:include page="slider.jsp"/>			
		</div>
		<div class="title_bar">Cucara Macara - Baby Stuff</div>		
		<ul id="products" class="group">
		</ul>
				
		<center>
			<div class="fb-like" data-href="http://cucaramacarabebe.com" data-send="true" data-width="450" data-show-faces="true"></div>
		</center>
		
<jsp:include page="footer.jsp"/>
