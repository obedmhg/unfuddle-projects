
<jsp:include page="header.jsp">
	<jsp:param value="${param.selectedPage}" name="selectedPage"/>
</jsp:include>


<script type="text/javascript">

$(document).ready(function() {
	$.ajax({                                                                                                 
		url: 'https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.blogger.com/feeds/${param.blogId}/posts/default',
		dataType: 'jsonp',
		success: function(data){
			$.each(data.responseData.feed.entries, function(index, entry) {
				var firstLetter = entry.title.substring(0, 1);
				var rand = Math.floor((Math.random()*10)+1);
				var styleFL = "";
				if (rand>0 && rand < 4) {
					styleFL = 'class="color2"';
				} else if (rand>4 && rand < 7) {
					styleFL = 'class="color3"';
				}
				var title = entry.title.substring(1, entry.title.length);
				var content = '<div class="wrapper"><div class="box1" id="boxConetnt"><div id="post" class="wrapper">' +
					'<h2 '+styleFL+'><strong>'+firstLetter+'</strong>'+title+'</h2>' +
					entry.content +
					'</div> </div> </div>';				
			   	$("#content").prepend(content);
			});
		}	
	});

});
</script>
<!-- content -->
			<article id="content">
				<div class="wrapper">
					<div class="box1" id="boxConetnt">
					</div>	
				</div>
			</article>
<!-- / content -->
<jsp:include page="footer.jsp"></jsp:include>