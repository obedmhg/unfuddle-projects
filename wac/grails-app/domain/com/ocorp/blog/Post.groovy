package com.ocorp.blog

import com.ocorp.pagina.Pagina

class Post {

	String titulo
	String post
	String mediaUrl
	Pagina pagina
	String enlace = "#"
	boolean faceBookComments 
    byte[] media
	
	static constraints = {
		titulo()
		post(widget: 'textarea')
		media(maxSize:1073741824, nullable: true)
		mediaUrl(url: true)
		enlace()
		pagina()
		faceBookComments()
	}
}
