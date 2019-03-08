package com.ocorp.maps

import org.springframework.dao.DataIntegrityViolationException

class MapaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mapaInstanceList: Mapa.list(params), mapaInstanceTotal: Mapa.count()]
    }

    def create() {
        [mapaInstance: new Mapa(params)]
    }

    def save() {
        def mapaInstance = new Mapa(params)
		mapaInstance.setTitulo(params.titulo)
        if (!mapaInstance.save(flush: true)) {
            render(view: "create", model: [mapaInstance: mapaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'mapa.label', default: 'Mapa'), mapaInstance.id])
        redirect(action: "show", id: mapaInstance.id)
    }

    def show() {
        def mapaInstance = Mapa.get(params.id)
        if (!mapaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "list")
            return
        }

        [mapaInstance: mapaInstance]
    }

    def edit() {
        def mapaInstance = Mapa.get(params.id)
        if (!mapaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "list")
            return
        }

        [mapaInstance: mapaInstance]
    }

    def update() {
        def mapaInstance = Mapa.get(params.id)
        if (!mapaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (mapaInstance.version > version) {
                mapaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mapa.label', default: 'Mapa')] as Object[],
                          "Another user has updated this Mapa while you were editing")
                render(view: "edit", model: [mapaInstance: mapaInstance])
                return
            }
        }

        mapaInstance.properties = params

        if (!mapaInstance.save(flush: true)) {
            render(view: "edit", model: [mapaInstance: mapaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'mapa.label', default: 'Mapa'), mapaInstance.id])
        redirect(action: "show", id: mapaInstance.id)
    }

    def delete() {
        def mapaInstance = Mapa.get(params.id)
        if (!mapaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "list")
            return
        }

        try {
            mapaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mapa.label', default: 'Mapa'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
