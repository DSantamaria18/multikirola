package multikirola

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CursoController {

    CursoService cursoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond cursoService.list(params), model:[cursoCount: cursoService.count()]
    }

    def show(Long id) {
        respond cursoService.get(id)
    }

    def create() {
        respond new Curso(params)
    }

    def save(Curso curso) {
        if (curso == null) {
            notFound()
            return
        }

        try {
            curso.nombre = curso.nombre.toUpperCase()
            cursoService.save(curso)
        } catch (ValidationException e) {
            respond curso.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), curso.id])
                redirect curso
            }
            '*' { respond curso, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond cursoService.get(id)
    }

    def update(Curso curso) {
        if (curso == null) {
            notFound()
            return
        }

        try {
            cursoService.save(curso)
        } catch (ValidationException e) {
            respond curso.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), curso.id])
                redirect curso
            }
            '*'{ respond curso, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        cursoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
