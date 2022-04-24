package multikirola

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CentroController {

    CentroService centroService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond centroService.list(params), model:[centroCount: centroService.count()]
    }

    def show(Long id) {
        respond centroService.get(id)
    }

    def create() {
        respond new Centro(params)
    }

    def save(Centro centro) {
        if (centro == null) {
            notFound()
            return
        }

        try {
            centro.nombre = centro?.nombre?.toUpperCase()
            centroService.save(centro)
        } catch (ValidationException e) {
            respond centro.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'centro.label', default: 'Centro'), centro.id])
                redirect centro
            }
            '*' { respond centro, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond centroService.get(id)
    }

    def update(Centro centro) {
        if (centro == null) {
            notFound()
            return
        }

        try {
            centroService.save(centro)
        } catch (ValidationException e) {
            respond centro.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'centro.label', default: 'Centro'), centro.id])
                redirect centro
            }
            '*'{ respond centro, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        centroService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'centro.label', default: 'Centro'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'centro.label', default: 'Centro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
