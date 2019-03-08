<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Cucara Macara | Baby Stuff</title>
	
	<meta name="description" content="Cucara Macara ropa personalizada para tu Bebe con su nombre, su personaje favorito. Enviamos a toda la republica Mexicana." />
	<meta name="keywords" content="ropa de bebe, bebes, baby, babies, bebe" />
	<meta name="robots" value="index, follow" />
	<meta name="brand" content="Cucaramacara" />


	<meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" name="viewport" />	
	<meta name="viewport" content="width=device-width" />
	
    <link rel="stylesheet" href="./css/jquery.rating.css" />
	<link rel="stylesheet" href="./css/style.css" />	
	

	<script src="/js/libs/modernizr-2.5.3.min.js"></script>
		
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	
	<script src="/js/jquery.isotope.min.js"></script>	
		
</head>

<body onload="load()">

<script type="text/javascript">
$(document).ready(function() {
	$.ajax({ url: 'http://picasaweb.google.com/data/feed/api/user/104072732899717980890?alt=json-in-script',
	    success: fnShowAlbums,
	    dataType: 'jsonp'
	});
	//Callback function to show albums
	function fnShowAlbums(data, status) {
	    var albums = data.feed.entry;
	    $.each(albums, function() {
	        // Create album element
	        var albumId = this.gphoto$id.$t;
	        var cssClass = "home";
	        if ('${param.categoryName}' == this.title.$t ) {
	        	cssClass = "homeSelected";
	        }
	        $("#cmMenu").prepend('<li><a class="'+cssClass+'" href="./category.jsp?categoryId=' + albumId + '&categoryName='+this.title.$t+'">'+ this.title.$t +'</a> </li>');
	    });
	}
});

</script>
	<div id="notification_bar"></div>
	<header>
		<div id="header_content">
			<div id="logo"><h1><a href="./">Cucara Macara - Baby Stuff</a></h1></div>
		</div>		
	</header>
	<div id="content" class="width_setter group" role="main">
		<nav>	
			<ul id="cmMenu">
				<li><a class="home" href="./colors.jsp">Colores</a> </li>
				<li><a class="home" href="./contact.jsp">Contacto</a> </li>
			</ul>
		</nav>