package com.ocorp.slideshow

import com.ocorp.pagina.Pagina

class Slide {

	String caption
	String imageUrl
	boolean active = true
	Pagina pagina
	    
	byte[] imagen
	
	static constraints = {
		caption()
		imagen(maxSize:1073741824, nullable: true)
		imageUrl()
		pagina()
		active()
	}
	
}
