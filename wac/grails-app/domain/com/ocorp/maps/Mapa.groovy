package com.ocorp.maps

import com.ocorp.pagina.Pagina

class Mapa {

	String googleMapsUrl
	String titulo
	String direccion
	String telefono
	String email
	Pagina pagina
	
    static constraints = {
		titulo()
		direccion()
		telefono()
		email()
		googleMapsUrl(url: true)
		pagina()
    }
}
