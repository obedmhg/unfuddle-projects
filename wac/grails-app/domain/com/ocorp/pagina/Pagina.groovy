package com.ocorp.pagina

class Pagina {

	String titulo
	String tituloMenu
	String logoPrincipal
	String footer
	boolean facebookLike
	byte[] logo
		
    @Override
	public String toString() {
		return tituloMenu;
	}

	static constraints = {
		tituloMenu(unique: true, blank:false)
		titulo()
		logoPrincipal(url: true)
		logo(maxSize:1073741824, nullable: true)
		footer()
		facebookLike()
    }
}
