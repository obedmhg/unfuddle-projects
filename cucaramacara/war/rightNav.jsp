<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<script type="text/javascript">

$(document).ready(function() {
	
	$.ajax({ url: 'http://picasaweb.google.com/data/feed/api/user/104072732899717980890?alt=json-in-script',
	    success: fnShowAlbums,
	    dataType: 'jsonp'
	});

	//Callback function to show albums
	function fnShowAlbums(data, status) {
	    var albums = data.feed.entry;
	    
	    var album = albums[Math.floor(Math.random()*albums.length)];

	    var albumId = album.gphoto$id.$t;
        if (albumId != ${param.categoryId}) {
        	showOtherCategory(albumId);
        	$("#otherCategory").append("De " + album.title.$t);
        	return false;
        }
	    $.each(albums, function() {
	        // Create album element
	        var albumId = this.gphoto$id.$t;
	        if (albumId != ${param.categoryId}) {
	        	showOtherCategory(albumId);
	        	$("#otherCategory").append("De " + this.title.$t);
	        	return false;
	        }
	    });
	}
	    
	function showOtherCategory (categoryId) {
		$.ajax({                                                                                                 
			url: 'https://picasaweb.google.com/data/feed/api/user/104072732899717980890/albumid/'+categoryId+'/?alt=json&fields=entry%28gphoto:id,title,summary,media:group%28media:thumbnail,media:content%29%29&imgmax=720',
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
		            
		            
			        photos[id] = {id:id,img:bsrc,width:bw,height:bh,th:{src:t1src,width:t1w,height:t1h,zoom_src:t2src,zoom_factor:1.5}};
			        		         
					var product = '<li class="product_container">'+
					'<div class="image">'+
					'<a href="/pdp.jsp?imageUrl='+ bsrc +'&details=' + title +'&categoryId='+${param.categoryId}+'">'+
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
						'<a class="addToCart" href="/pdp.jsp?imageUrl='+ bsrc +'&details=' + title +'&categoryId='+${param.categoryId}+'">Ver Detalles!</a>'+
						'</div>'+
					'</div>'+
					'</li>';
					$("#featured_products").prepend(product);
		        }	
		    }
		});	
		}
});

</script>

		<section id="right_column">
				<div id="sortSection">
					<header>Ordenar por:</header>
					<div class="section">
						<ul id="sort-by">
						  <li><a href="#sale">Precio</a></li>
						  <li><a href="#title">Nombre</a></li>
						</ul>
					</div>
				</div>
			</section>
				<div id="options">
				<section id="right_column">
					<header id="otherCategory"></header>
					<div id="options">
						<div class="section">
							 <ul id="featured_products" class="group">
							 </ul>
						</div>									
					</div>
				</section>	
			</div>
		
		
<script>
function load(){
	var details = '${param.details}';
	if (details != '') {
		$("#sortSection").hide();	
	} else {
		var container = $('#container');
	    container.isotope({
			  getSortData : {
			    sale : function ( $elem ) {
			      return $elem.find('.sale').text();
			    },
			    title : function ( $elem ) {
			      return $elem.find('.title').text();
			    }
			  }
			});
		
		$('#sort-by a').live("click", function(){
			  var sortName = $(this).attr('href').slice(1);
			  $('#container').isotope({ sortBy : sortName });
			  return false;
			});		
	}
};
</script>