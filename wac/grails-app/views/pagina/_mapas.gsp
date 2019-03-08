<!-- gMaps -->
  <script type="text/javascript" src="/js/gmaps/googlemaps.js"></script>
  <script type="text/javascript" src="/js/gmaps/gmaps.js"></script>
  <script type="text/javascript" src="/js/gmaps/prettify.js"></script>
  <link href='/js/gmaps/styles.css' rel='stylesheet' type='text/css' />
  <link href='/js/gmaps/prettify.css' rel='stylesheet' type='text/css' />
<!-- ENDS gMaps -->
		<!-- Isotope -->
		<script src="/js/jquery.isotope.min.js"></script>
		<!-- Fancybox -->
		<link rel="stylesheet" href="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
		<script type="text/javascript" src="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<!-- ENDS Fancybox -->
		
		
		  		<!-- prettyPhoto -->
		<script type="text/javascript" src="/js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="/js/prettyPhoto/css/prettyPhoto.css" type="text/css" media="screen" />
		<!-- ENDS prettyPhoto -->

<g:if test="${mapInstanceList != null && mapInstanceList.size != 0}">
	<div class="clear"></div>
	<g:each in="${mapInstanceList}" status="i" var="mapInstance">
		<div class="mapDireccion" style="display: none;">
			${mapInstance.direccion}
		</div>
		<div class="googleMapsUrl" style="display: none;">
			${mapInstance.googleMapsUrl}
		</div>
	</g:each>
	<div style="display: none;"></div>
	<script type="text/javascript">
		var map;
		$(document).ready(function() {
			prettyPrint();
			var gmapsUrlDiv = $('.googleMapsUrl').get(0);
			var gmapsUrl = gmapsUrlDiv.innerHTML;
			var llUrl = gmapsUrl.split('?ll=')[1];
			var lat = llUrl.split(',')[0];
			var lon = llUrl.split(',')[1].split('&')[0];
			map = new GMaps({
				div : '#map',
				zoom : 11,
				lat : lat,
				lng : lon
			});
			var mapCount = $('.mapDireccion').size();
			for (i = 0; i < mapCount; i++) {
				var image = $('.mapIcon').get(i);
				var direccion = $('.mapDireccion').get(i);
				var gmapsUrlDiv = $('.googleMapsUrl').get(i);
				var gmapsUrl = gmapsUrlDiv.innerHTML;
				var llUrl = gmapsUrl.split('?ll=')[1];
				var lat = llUrl.split(',')[0];
				var lon = llUrl.split(',')[1].split('&')[0];
				map.addMarker({
					lat : lat,
					lng : lon,
					title : 'Marker with InfoWindow',
					infoWindow : {
						content : direccion.innerHTML
					}
				});
			}
		});
	</script>

	<div id="bodyMaps">
		<div class="row">
			<div class="span11">
				<div class="popin">
					<div id="map"></div>
				</div>
			</div>
		</div>
	</div>
</g:if>
