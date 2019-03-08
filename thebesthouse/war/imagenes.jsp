<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" media="screen" href="css/photoslider.css" />    
<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" />
<title>The Best House</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script type="text/javascript" src="js/jquery-photowall.js"></script>
<script type="text/javascript" src="js/jquery.simplemodal.js"></script>
<link rel="stylesheet" href="/js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen" />

<script type="text/javascript" src="js/messi.js"></script>
<link rel="stylesheet" href="/css/messi.css" type="text/css" media="screen" />
 
<link href='http://fonts.googleapis.com/css?family=Amatic+SC' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="jquery-photowall.css">
<style type="text/css"> 

#gallery {

}
* {
   padding:0;
   margin: 0;
   outline: none !important; 
}
h1 { 
font-family: 'Amatic SC', cursive;
font-size:250%
 font-weight: 400; color:#fff; }
</style> 
<script type="text/javascript">
$(document).ready(function(){
	
		// Load dialog on click
		$('#basic-modal .basic').click(function (e) {
			$('#basic-modal-content').modal();

			return false;
		});
	
	
	if (navigator.appName != 'Microsoft Internet Explorer') {
	    PhotoWall.init({
	        el:                 '#gallery'               // Gallery element
	        ,zoom:              true                     // Use zoom
	        ,zoomAction:        'mouseenter'             // Zoom on action
	        ,zoomTimeout:       500                      // Timeout before zoom
	        ,zoomDuration:      100                      // Zoom duration time
	        ,zoomImageBorder:   5                         // Zoomed image border size 
	        ,showBox:           true                     // Enavle fullscreen mode
	        ,showBoxSocial:     true                     // Show social buttons
	        ,padding:           5                        // padding between images in gallery
	        ,lineMaxHeight:     150                      // Max set height of pictures line
	        ,lineMaxHeightDynamic: true                  // Dynamic lineMaxHeight. If set to True,
	                                                     // then line height will be changing on 
	                                                     // resize, coressponding to 
	                                                     // baseScreenHeight param
	        ,baseScreenHeight:  600                      // Base screen size from wich calculating dynamic lineMaxHeight  
	    });
		// Max image width form Picasa
		// 94, 110, 128, 200, 220, 288, 320, 400, 512, 576, 640, 720, 800, 912, 
		// 1024, 1152, 1280, 1440, 1600
	     
		$.ajax({                                                                                                 
			url: 'https://picasaweb.google.com/data/feed/api/user/109851723085059747454/albumid/5787321425894269505'
				 +'/?alt=json&fields=entry(gphoto:id,title,media:group(media:thumbnail,media:'
				 +'content))&imgmax=720',
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
		            
		            
			        photos[id] = {id:id,img:bsrc,width:bw,height:bh,th:{src:t1src,width:t1w,height:t1h,zoom_src:t2src,zoom_factor:1.5}};
			        
		        }	
			    PhotoWall.load(photos);
		    }
		});
	} else {

		$.ajax({                                                                                                 
			url: 'https://picasaweb.google.com/data/feed/api/user/106472069191061769548/albumid/5754014471818330897'
				 +'/?alt=json&fields=entry(gphoto:id,title,media:group(media:thumbnail,media:'
				 +'content))&imgmax=720',
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
			        
			        var t2w   = Math.round(t1w * .6);
			        var t2h   = Math.round(t1h * .6);
	
			        var t2src = e.media$content[0].url+'/../../w'+t2w+'-h'+t2h+'/';
		            
		            var bsrc  = e.media$content[0].url;
		            var bw    = e.media$content[0].width;
		            var bh    = e.media$content[0].height;
		            
		            $("#ieGallery").prepend('<a href="#"  class="thumb" title="${imagenInstance.caption}"><img class="image" src="'+t2src+'" alt="'+bsrc+'"/></a>');
			        
		        }	
			    
		    }
		});
		
		 $(".image").live("click", function() {
				Messi.img(this.alt);
		});
						
	}
});
</script> 
</head>
<body onload='FOTO.Slider.reload("default");'>
   <div class="photoslider" id="default"></div>  
     


<jsp:include page="header.jsp">
    <jsp:param name="from" value='imagenes' />
 </jsp:include>
<div id="page">
<div id="page-bgtop">


	
<div id="gallery"> 
	<div class="body"> 
	</div> 
</div>

<g:if test="${imagenInstanceList != null && imagenInstanceList.size != 0}">
	<div id="ieGallery" class="featured portfolio-list">
	</div>
</g:if>

      <div style="clear: both; height: 1px"></div>
    </div>
  </div>

  
  <%@ include file="footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		var ids = new Array(0,1,2);
		FOTO.Slider.importBucketFromIds('default',ids);
		FOTO.Slider.reload('default');
		FOTO.Slider.preloadImages('default');
		FOTO.Slider.enableSlideshow('default');
	});
</script>


</body>
</html>
