package com.ocorp.content

class ContentUtils {

	public static String getYoutubeCode(String str){
		String youTubeIFrame = str.replaceAll('http://www.youtube.com/watch[_A-Za-z0-9/=\\-\\?]*' , 
			'<iframe width=\"425\" height=\"349\" src=\"$0\" frameborder=\"0\" allowfullscreen></iframe>')
		youTubeIFrame = youTubeIFrame.replace("com/watch?v=", "com/embed/")
		return youTubeIFrame
	}
	
	public static String getYoutubeCode(String str, String width, String height){
		String youTubeIFrame = str.replaceAll('http://www.youtube.com/watch[_A-Za-z0-9/=\\-\\?]*' ,
			'<iframe width=\"' + width +'\" height=\"' + height + '\" src=\"$0\" frameborder=\"0\" allowfullscreen></iframe>')
		youTubeIFrame = youTubeIFrame.replace("com/watch?v=", "com/embed/")
		return youTubeIFrame
	}
	
	public static String getLinkCode(String str){
		return str.replaceAll('http://.+?(com|net|org)/{0,1}[_A-Za-z0-9/\\?]*',
							'<a href=\"$0\">$0</a>')
	}
	
	public static String getImageCode(String str){
		String strToRep = str.replaceAll('http://.*', '<img src=\"$0\"/>')
		return strToRep
	}
	
	public static String getImageCode(String str, String width, String height){
		String strToRep = str.replaceAll('http://.*', '<img src=\"$0\" width="' + width +'" height="' + height + '" />')
		return strToRep
	}
	
}
