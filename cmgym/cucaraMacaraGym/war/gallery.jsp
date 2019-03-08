<link rel="stylesheet" type="text/css" href="http://www.ocorpws.com/haideavitia/jquery-photowall.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script type="text/javascript" src="http://www.ocorpws.com/haideavitia/jquery-photowall.js"></script> 

<style type="text/css"> 
html,body {
	background:#000;
}
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
    PhotoWall.init({
        el:                 '#gallery'               // Gallery element
        ,zoom:              true                     // Use zoom
        ,zoomAction:        'mouseenter'             // Zoom on action
        ,zoomTimeout:       500                      // Timeout before zoom
        ,zoomDuration:      100                      // Zoom duration time
        ,zoomImageBorder:   5                         // Zoomed image border size 
        ,showBox:           true                     // Enavle fullscreen mode
        ,showBoxSocial:     false                     // Show social buttons
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
     https://picasaweb.google.com/data/feed/base/user/106472069191061769548/albumid/5920631382330977281?alt=rss&kind=photo&hl=en_US
	$.ajax({                                                                                                 
		url: 'https://picasaweb.google.com/data/feed/api/user/106472069191061769548/albumid/5920631382330977281'
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
});
</script> 


<jsp:include page="header.jsp">
	<jsp:param value="home" name="selectedPage"/>
</jsp:include>
<!-- content -->
		<article id="content">
			<div class="wrapper">
				<div class="box1">
					<div id="gallery"> 
						<div class="body"> 
						</div> 
					</div>  
				</div>	
			</div>
<jsp:include page="footer.jsp">
	<jsp:param value="home" name="selectedPage"/>
</jsp:include>