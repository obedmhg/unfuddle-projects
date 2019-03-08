<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/scriptaculous.js?load=effects,builder"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
  <script type="text/javascript" src="https://raw.github.com/HPNeo/gmaps/master/gmaps.js"></script>
  <script type="text/javascript" src="http://hpneo.github.com/gmaps/prettify/prettify.js"></script>
  <link href='http://hpneo.github.com/gmaps/styles.css' rel='stylesheet' type='text/css' />
  <link href='http://hpneo.github.com/gmaps/prettify/prettify.css' rel='stylesheet' type='text/css' />

<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<title>The Best House</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
    var map;
    $(document).ready(function(){
      prettyPrint();
      map = new GMaps({
        div: '#map',
        lat: 28.660067,
        lng: -106.11746
      });
      map.addMarker({
        lat: 28.6589373,
        lng: -106.1199814,
        title: 'Marker with InfoWindow',
        infoWindow: {
          content: ' <img src="http://www.tbhconstrucciones.com/images/logo.png"/>'
        }
      });
    });
  </script>
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="from" value='contacto' />
 </jsp:include>

<div id="page">
<div id="page-bgtop">

	<center>
	<b>Contacto</b><br>
	<div style="width: 600px;">
	<ul class="contactInfo">
		<li class="address">Av Fco Villa 3923 Local 2 Plaza Gaviotas , Lomas del Sol, Chihuahua, Chihuahua, Mexico. </li>
		<li class="mobile">
			614-1-75-2895	
		</li>
		<li class="email">
			<a href="mailto:contacto@thebesthouseinc.com?&subject=Contacto"> omar@tbhconstrucciones.com</a>	
		</li>	
	</ul>
	</div>
	<div id="body">
    <div class="row">
      <div class="span11">
        <div class="popin">
          <div id="map"></div>
        </div>
      </div>
    </div>
    Escanea con tu smartphone.
    <div style="clear: both; height: 1px"></div>
    <img width="175" height="175" src="http://qr.kaywa.com/img.php?s=8&d=http%3A%2F%2Fwww.tbhconstrucciones.com%2Findex.jsp" alt="QRCode"/>
  </div>
    <div style="clear: both; height: 1px"></div>
    </div>
  </div>
  
  </center>
  <%@ include file="footer.jsp" %>

</body>
</html>