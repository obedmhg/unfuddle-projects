<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	<title>Javier Ramos Fotografia</title>
	<meta charset="utf-8">
	<link rel="icon" href="img/favicon.ico" type="image/x-icon">
	<meta name="description" content="Your description">
	<meta name="keywords" content="Your keywords">
	<meta name="author" content="Your name">
	<link rel="stylesheet" href="/site/css/bootstrap.css" type="text/css" media="screen">
	<link rel="stylesheet" href="/site/css/responsive.css" type="text/css" media="screen">
	<link rel="stylesheet" href="/site/css/style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="/site/css/touchTouch.css" type="text/css" media="screen">
	<link rel="stylesheet" href="/site/css/kwicks-slider.css" type="text/css" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="/site/js/jquery.js"></script>
    <script type="text/javascript" src="/site/js/superfish.js"></script>
	<script type="text/javascript" src="/site/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="/site/js/jquery.kwicks-1.5.1.js"></script>
	<script type="text/javascript" src="/site/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/site/js/jquery.cookie.js"></script>    
	<script type="text/javascript" src="/site/js/touchTouch.jquery.js"></script>
	<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

	</head>

	<body> 
<!--============================== header =================================-->
<header>
      <div class="container clearfix">
    <div class="row">
          <div class="span12">
        <div class="navbar navbar_">
              <div class="container">
            <h1 class="brand brand_"><a href="#"><img alt="" src="img/logo.png"> </a></h1>
            <a class="btn btn-navbar btn-navbar_" data-toggle="collapse" data-target=".nav-collapse_">Menu <span class="icon-bar"></span> </a>
            <div class="nav-collapse nav-collapse_  collapse">
                  <ul class="nav sf-menu">
                <li class="active"><a href="index.jsp">Home</a></li>
                <li class="sub-menu"><a href="#">Servicios</a>
                      <ul>
                    <li><a href="/site/bodas.html">Bodas</a></li>
                    <li><a href="/site/casuales.html">Casuales</a></li>
                    <li><a href="/site/familiares.html">Familiares</a></li>
                  </ul>
                    </li>
                <li><a href="gallery.html">Galeria</a></li>
                <li><a href="/download.jsp">Descarga</a></li>
                <li><a href="contact.jsp">Contacto</a></li>
              </ul>
                </div>
          </div>
            </div>
      </div>
        </div>
  </div>
    </header>
<div class="bg-content">
      <div class="container">
    <div class="row">
          <div class="span12"> 
			<form action="/login"  method="post" id="addForm">
		Usuario &nbsp; <input type="text" name="user" id="user"></input><br>
		Password <input type="password" name="password" id="password"></input><br>
		<input type="submit" value="Entrar" id="actionButton"/>
	</form>
			<c:if test="${param.found eq 'false'}">
				Usuario y/o contraseña invalidos, por favor intenta de nuevo.
			</c:if>
      </div>
        </div>
  </div>
      
<!--============================== footer =================================-->
<footer>
      <div class="container clearfix">
    <ul class="list-social pull-right">
          <li><a class="icon-1" href="#"></a></li>
        </ul>
    <div class="privacy pull-left">
  		Javier Ramos Fotografia | Chihuahua, Chihuahua, Mexico
  	</div>
    </footer>
</body>
</html>