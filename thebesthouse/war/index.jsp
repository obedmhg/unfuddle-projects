<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>The Best House</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body> 
<jsp:include page="header.jsp">
    <jsp:param name="from" value='index' />
 </jsp:include>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 <link href='http://fonts.googleapis.com/css?family=Londrina+Sketch' rel='stylesheet' type='text/css'>
	<style type="text/css">body { margin-top:30px; } h2 { margin-top:8px; margin-bottom:5px;  }</style>
	<link href="/css/jquery.googleslides.css" rel="stylesheet" type="text/css" />
	<script src="/js/jquery.googleslides.js" type="text/javascript"></script>
 	<script type="text/javascript">
			$(document).ready(function () {
				$("#splash").googleslides({ userid: '109851723085059747454', albumid: '5787317459736467681', imgmax:940, albumlink:false, time:7000});
				$.ajax({                                                                                                 
					url: 'https://picasaweb.google.com/data/feed/api/user/109851723085059747454/albumid/5787347683071983025/?alt=json&fields=entry%28gphoto:id,title,summary,media:group%28media:thumbnail,media:content%29%29&imgmax=720',
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
				            
					        photos[id] = {id:id,img:bsrc,width:bw,height:bh,th:{src:t1src,width:t1w,height:t1h,zoom_src:t2src,zoom_factor:1.5}};
					        
					       	var post = '<div class="post">'+
					            '<h1 class="fb"><a class="fb" href="#">'+title+'</a></h1>'+
					            '<div class="entry">'+
					            '<img height="520" width="630" longdesc="'+title+'" alt="Marmol" src="'+bsrc+'">'+
					            '<div style="clear: both; height: 1px"></div>'+
					            '</div>'+
					          '</div>';
					        $('#content').prepend(post);
					        
					        
				        }	
					    PhotoWall.load(photos);
				    }
				});
				
			});
	</script>
 <div id="splash" style="padding-top: 0px;"></div>
<div id="page">
	<div id="page-bgtop">
		<div id="content">
		</div>
	</div>
	<%@ include file="sideNav.jsp" %>

      <div style="clear: both; height: 1px"></div>
    </div>
  </div>
  <jsp:include page="footer.jsp">
    <jsp:param name="from" value='index' />
 </jsp:include>

</body>
</html>
