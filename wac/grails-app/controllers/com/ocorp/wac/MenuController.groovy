package com.ocorp.wac

import com.ocorp.pagina.Pagina

class MenuController {

    def index() {
		redirect(action: "list", params: params)
	}
	
	def list(){
		[paginaInstanceList: Pagina.list(), paginaInstanceTotal: Pagina.count()]
	}
}
