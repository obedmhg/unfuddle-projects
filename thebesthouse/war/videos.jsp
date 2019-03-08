<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/scriptaculous.js?load=effects,builder"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<title>The Best House</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="header.jsp">
    <jsp:param name="from" value='videos' />
 </jsp:include>
<div id="page">
<div id="page-bgtop">


<center>
<h2>Alberca de vista infinita</h2>
	<iframe width="560" height="315" src="http://www.youtube.com/embed/8lTVqXJOKUw" frameborder="0" allowfullscreen></iframe>
	<h2>Bubble Bar</h2>
	<iframe width="420" height="315" src="http://www.youtube.com/embed/zryYatnwzOM" frameborder="0" allowfullscreen></iframe>
</center>
      <div style="clear: both; height: 1px"></div>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>
