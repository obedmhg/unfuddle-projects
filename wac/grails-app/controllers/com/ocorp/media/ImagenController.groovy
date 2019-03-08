package com.ocorp.media

import org.springframework.dao.DataIntegrityViolationException

class ImagenController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imagenInstanceList: Imagen.list(params), imagenInstanceTotal: Imagen.count()]
    }
	
	def showImage = {
		Imagen imagenInstance = Imagen.get(params.id)
		if(imagenInstance != null) {
			response.outputStream << imagenInstance.getImagen()
			response.outputStream.flush()
		}
	}

    def create() {
        [imagenInstance: new Imagen(params)]
    }

	/**
	 * It will save a gallery or a single image, the gallery will have the same caption for each picture
	 * @return
	 */
    def save() {
		def imagenInstance
		request.getMultiFileMap().get('imagen').each {
			imagenInstance = new Imagen(params)
			imagenInstance.imagen = it.bytes
	        if (!imagenInstance.save(flush: true)) {
				print 'here2'
	            render(view: "create", model: [imagenInstance: imagenInstance])
	            return
	        }
		}
		flash.message = message(code: 'default.created.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
        redirect(action: "show", id: imagenInstance.id)
    }

    def show() {
        def imagenInstance = Imagen.get(params.id)
        if (!imagenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "list")
            return
        }

        [imagenInstance: imagenInstance]
    }

    def edit() {
        def imagenInstance = Imagen.get(params.id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "list")
            return
        }

        [imagenInstance: imagenInstance]
    }

    def update() {
        def imagenInstance = Imagen.get(params.id)
        if (!imagenInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (imagenInstance.version > version) {
                imagenInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'imagen.label', default: 'Imagen')] as Object[],
                          "Another user has updated this Imagen while you were editing")
                render(view: "edit", model: [imagenInstance: imagenInstance])
                return
            }
        }

        def prevMedia = imagenInstance.getImagen()
		imagenInstance.properties = params
		if (prevMedia !=  null && (params.imagen == null || params.imagen.bytes.length == 0)) {
			imagenInstance.setImagen(prevMedia)
		}

		if (!imagenInstance.save(flush: true)) {
			render(view: "edit", model: [postInstance: imagenInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
        redirect(action: "show", id: imagenInstance.id)
    }

    def delete() {
        def imagenInstance = Imagen.get(params.id)
        if (!imagenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "list")
            return
        }

        try {
            imagenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
