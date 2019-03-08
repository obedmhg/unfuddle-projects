<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/scriptaculous.js?load=effects,builder"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
<link href="css/cloud-zoom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/JavaScript" src="js/cloud-zoom.1.0.2.min.js"></script>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/main.css" type="text/css" media="screen" />
<title>The Best House</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="from" value='productos' />
 </jsp:include>
<div id="page">
<div id="page-bgtop">
	<div class="thumb" >	
       <a href='images/productos/riego.jpg' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/riego-small.jpg" alt='' title="Sistemas de Riego" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Sistemas de riego
	</div>
	</div>
	<div style="clear: both; height: 1px"></div>
	<div class="thumb">	
       <a href='images/productos/iluminacion.jpg' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/iluminacion-small.jpg" alt='' title="Iluminaci&oacute;n Led" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Iluminaci&oacute;n Led
	</div>
	</div>
<div style="clear: both; height: 1px"></div>
	<div class="thumb">	
       <a href='images/productos/albercas.JPG' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/albercas-small.JPG" alt='' title="Albercas" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Albercas
	</div>
	</div>
<div style="clear: both; height: 1px"></div>
	<div class="thumb">	
       <a href='images/productos/fuentes.jpg' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/fuentes-small.jpg" alt='' title="Fuentes" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Fuentes
	</div>
	</div>
<div style="clear: both; height: 1px"></div>
	<div class="thumb">	
       <a href='images/productos/patios.jpg' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/patios-small.jpg" alt='' title="Decoraci&oacute;n de patios" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Decoraci&oacute;n de patios
	</div>
	</div>
	<div style="clear: both; height: 1px"></div>
	<div class="thumb">	
       <a href='images/productos/jardineria.jpg' class = 'cloud-zoom' id='zoom1'
          rel="adjustX: 10, adjustY:-4, zoomWidth:600, zoomHeight:600">
          <img src="images/productos/jardineria-small.jpg" alt='' title="Jardineria" width="400" height="400"/>
      </a>
	<div class="phototitle">
		Jardineria
	</div>
	</div>
<div style="clear: both; height: 1px"></div>


      <div style="clear: both; height: 1px"></div>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
