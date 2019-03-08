
<jsp:include page="header.jsp">
	<jsp:param value="babyGym" name="selectedPage"/>
</jsp:include>


<script type="text/javascript">

$(document).ready(function() {
	//8953307483407478126
	$.ajax({                                                                                                 
		url: 'https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.blogger.com/feeds/4493793314452683100/posts/default',
		dataType: 'jsonp',
		success: function(data){
			$.each(data.responseData.feed.entries, function(index, entry) {
				var firstLetter = entry.title.substring(0, 1);
				var title = entry.title.substring(1, entry.title.length);
				var content = '<div class="wrapper">' +
					'<h2><strong>'+firstLetter+'</strong>'+title+'</h2>' +
					entry.content +
					'</div>  <hr style="height: 1px; width: 90%; color: #ADA8AA; background-color:#ADA8AA; " />';				
			   	$("#boxConetnt").prepend(content);
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
				<div class="wrapper">
					<div class="box2">
						<div class="wrapper">
							<section class="col1">
								<ul class="list1">
									<li><a href="#">Sed ut perspiciatis unde omnis</a></li>
									<li class="color2"><a href="#">Iste natus error sit voluptatem accus</a></li>
									<li class="color3"><a href="#">Antium doloremque totam remiam</a></li>
								</ul>	
							</section>
							<section class="col1 pad_left1">
								<ul class="list1">
									<li><a href="#">Eaque ipsa quae ab illo inventore</a></li>
									<li class="color2"><a href="#">Veritatis et quasi architecto beatae</a></li>
									<li class="color3"><a href="#">Dicta sunt explicabo enim ipsam</a></li>
								</ul>
							</section>
							<section class="col1 pad_left1">
								<ul class="list1">
									<li><a href="#">Voluptatem quia voluptas sit</a></li>
									<li class="color2"><a href="#">Aspernatur aut odit aut fugit sed quia</a></li>
									<li class="color3"><a href="#">Consequuntur magni dolores eos</a></li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</article>
<!-- / content -->
<jsp:include page="footer.jsp"></jsp:include>