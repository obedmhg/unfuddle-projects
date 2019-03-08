package com.ocorp.pagina

import org.springframework.dao.DataIntegrityViolationException

import com.ocorp.blog.Post
import com.ocorp.slideshow.Slide
import com.ocorp.maps.Mapa
import com.ocorp.media.Imagen

class PaginaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paginaInstanceList: Pagina.list(params), paginaInstanceTotal: Pagina.count()]
    }
	
	def showImage = {
		Pagina imagenInstance = Pagina.get(params.id)
		response.outputStream << imagenInstance.getLogo()
		response.outputStream.flush()
	}


    def create() {
		//Fill default values
		def paginaInstance = new Pagina()
		if (Pagina.count() > 0) {
			Pagina home = Pagina.findByTituloMenu('Home');
			if (home != null) {
				paginaInstance.logoPrincipal = home.logoPrincipal
				paginaInstance.footer = home.footer
				paginaInstance.logo =  home.logo
			}
		}
        [paginaInstance: paginaInstance]
    }

    def save() {
        def paginaInstance = new Pagina(params)
        if (!paginaInstance.save(flush: true)) {
            render(view: "create", model: [paginaInstance: paginaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pagina.label', default: 'Pagina'), paginaInstance.id])
        redirect(action: "show", id: paginaInstance.id)
    }
	
	def elive() {
		Pagina paginaInstance = Pagina.findByTituloMenu(params.id)
		if (!paginaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
			redirect(action: "list")
			return
		}
		def slideInstanceList = Slide.findAllByPagina(paginaInstance)
		def postInstanceList = Post.findAllByPagina(paginaInstance)
		def mapInstanceList = Mapa.findAllByPagina(paginaInstance)
		def imagenInstanceList = Imagen.findAllByPagina(paginaInstance)
		[paginaInstance: paginaInstance, paginaInstanceList: Pagina.list(params), postInstanceList: postInstanceList,
			slideInstanceList: slideInstanceList, mapInstanceList: mapInstanceList, imagenInstanceList: imagenInstanceList]
	}

    def show() {
        Pagina paginaInstance = Pagina.findByTituloMenu(params.id)
        if (!paginaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "list")
            return
        }
		def slideInstanceList = Slide.findAllByPagina(paginaInstance)
		def postInstanceList = Post.findAllByPagina(paginaInstance)
		def mapInstanceList = Mapa.findAllByPagina(paginaInstance)
		def imagenInstanceList = Imagen.findAllByPagina(paginaInstance)
        [paginaInstance: paginaInstance, paginaInstanceList: Pagina.list(params), postInstanceList: postInstanceList, 
			slideInstanceList: slideInstanceList, mapInstanceList: mapInstanceList, imagenInstanceList: imagenInstanceList]
    }

    def edit() {
        def paginaInstance = Pagina.get(params.id)
        if (!paginaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "list")
            return
        }

        [paginaInstance: paginaInstance]
    }

    def update() {
        def paginaInstance = Pagina.get(params.id)
        if (!paginaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (paginaInstance.version > version) {
                paginaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pagina.label', default: 'Pagina')] as Object[],
                          "Another user has updated this Pagina while you were editing")
                render(view: "edit", model: [paginaInstance: paginaInstance])
                return
            }
        }

        paginaInstance.properties = params

        if (!paginaInstance.save(flush: true)) {
            render(view: "edit", model: [paginaInstance: paginaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pagina.label', default: 'Pagina'), paginaInstance.id])
        redirect(action: "list")
    }

    def delete() {
        def paginaInstance = Pagina.get(params.id)
        if (!paginaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "list")
            return
        }

        try {
            paginaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pagina.label', default: 'Pagina'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
