package com.ocorp.content

class ContentTagLib {

	def getAsMedia = {attrs ->
		def media = attrs.media
		def width = attrs.width
		def height = attrs.height
 
		out << getMediaHmtlCode(media,width,height)
	}
	
	def getMediaHmtlCode (String media, String width, String height) {
		def
			String newMedia = "";
			if(media.contains("youtube.com")){
				newMedia = ContentUtils.getYoutubeCode(media);
				if (width != null && height!= null) {
					newMedia = ContentUtils.getYoutubeCode(media, width, height);
			   } else {
				   newMedia = ContentUtils.getYoutubeCode(media);
			   }
			}else if (media.endsWith(".jpg") ||
				  media.endsWith(".png") ||
				 media.endsWith(".gif")){
				 if (width != null && height!= null) {
					 newMedia = ContentUtils.getImageCode(media, width, height);
				} else {
					newMedia = ContentUtils.getImageCode(media);
				}
				
			} else{
				newMedia = ContentUtils.getLinkCode(media);
			}
			return newMedia
	}
	
	def showImage = {attrs ->
		def media = attrs.media
		response.contentType = 'image/png'
		out << media
		out.flush()
	}
	
}
