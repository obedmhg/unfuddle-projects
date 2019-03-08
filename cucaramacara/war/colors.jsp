<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"/>

		<link rel="stylesheet" href="/css/nivo-zoom.css" type="text/css" media="screen" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
		<script src="/js/jquery.nivo.zoom.pack.js" type="text/javascript"></script>
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
	var environments = 'https://picasaweb.google.com/data/feed/api/user/106472069191061769548/albumid/5821185833903127377'
		 +'/?alt=json&fields=entry(gphoto:id,title,media:group(media:thumbnail,media:'
		 +'content))&imgmax=720';
	$.ajax({                                                                                                 
		url: environments,
		dataType: 'jsonp',
		success: function(data){
		    var photos = {}
	        if(!data.feed.entry) return;
	        for(var i in data.feed.entry) {
	        	 var e     = data.feed.entry[i].media$group;
	        	 var url  = e.media$content[0].url;
	        	 var turl = e.media$thumbnail[2].url;
	        	 var id = data.feed.entry[i].title.$t;
	        	$('#colors').prepend('<a href="'+url+'" class="nivoZoom"> <img src="'+turl+'" width="120" height="160"/> <div class="nivoCaption">Disponible en: <div id="tallas">9M</div> </div> </a>');
	        }	
	    }
	});
});

$(window).load(function() {
	$('body').nivoZoom();

});

$(document).ready(function() {
	$('#colors a').click(function(){
		return false;
	});
});

</script>

		
		<center>
			<div class="title_bar">Catalogo de Colores</div>		
			<div id="container" class="group">
				<div id="colors">
				</div>
			</div>
				
		
			<div class="fb-like" data-href="http://cucaramacarabebe.com" data-send="true" data-width="450" data-show-faces="true"></div>
		</center>
		
<jsp:include page="footer.jsp"/>
