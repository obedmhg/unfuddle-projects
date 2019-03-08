package com.ocorp.media

import com.ocorp.pagina.Pagina

class Imagen {

	String caption
	Pagina pagina
	boolean active = true
	byte[] imagen
	
	static constraints = {
		caption()
		imagen(maxSize:1073741824, nullable: true)
		active()
		active()
	}
	
}
