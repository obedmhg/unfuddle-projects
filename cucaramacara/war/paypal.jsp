<html>
<head>
<title>Cucara Macara Paypal</title>
</head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>

function payWithPaypal() {
		
	$.ajax({                                                                                                 
		url: 'https://picasaweb.google.com/data/feed/api/user/104072732899717980890/albumid/${param.categoryId}/?alt=json&fields=entry%28gphoto:id,title,summary,media:group%28media:thumbnail,media:content%29%29&imgmax=720',
		dataType: 'jsonp',
		success: function(data){
		    var photos = {}
	        if(!data.feed.entry) return;
		    for(var i in data.feed.entry) {
		        var e     = data.feed.entry[i].media$group;	            
	            var bsrc  = e.media$content[0].url;
	            var title = data.feed.entry[i].summary.$t;
	            var details = title.split("|");
	            var productUrl = "${param.productUrl}";
	            productUrl = productUrl.replace('s1280','s720');
	            var price = details[3];
	            if (bsrc == productUrl) {
	            	$("#productName").attr("value", details[0] + " - " + details[1]);
	            	$("#price").attr("value", details[3]);
	            	document.forms['paypalForm'].submit();
	            }
	        }	
	    }
	});
}

</script>

<body onload="payWithPaypal();">
<form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
 <input type="hidden" name="cmd" value="_xclick" />
 <input type="hidden" name="business" value="haide_1351878279_biz@gmail.com" />
 <input type="hidden" name="password" value="1351878298" />
 <input type="hidden" name="custom" value="1123" />
 <input type="hidden" name="item_name" id="productName" value="" />
 <input type="hidden" name="amount" id="price" value=""/>
 <input type="hidden" name="rm" value="1" />
 <input id="currency_code" name="currency_code" value="MXN" type="hidden"/> 
 <input type="hidden" name="return" value="https://cucaramacarabebe.com/orderConfirmation.jsp" />
 <input type="hidden" name="cancel_return" value="https://cucaramacarabebe.com/errorPaypal.jsp" />
 <input type="hidden" name="cert_id" value="AUZ17j2qAVoMBnSnxPvW3mG4hv-QAAfRBBEvvFXlJlM2DcvndQ3PhYad" />
</form>
</body>
</html>