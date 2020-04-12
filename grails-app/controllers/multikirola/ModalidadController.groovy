package multikirola

import grails.core.GrailsApplication
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartRequest
import static org.springframework.http.HttpStatus.*

class ModalidadController {

    ModalidadService modalidadService
    GrailsApplication grailsApplication

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", uploadImage: 'POST']

    def uploadImage() {
        def file = request.getFile('imagen')
        if (file.empty) {
            flash.message = "No has seleccionado ningún fichero"
        } else {
            String originalFilename = file.getOriginalFilename()
            String fileName = "${params.id}.jpg"
            String imageUploadPath = grailsApplication.config.getProperty('imgUploadFolder')
            File folder = new File(imageUploadPath)
            try {
                if (isJpgImg(originalFilename)) {
                    folder.listFiles().each {
                        if (it.name == fileName) {
                            it.delete()
                        }
                    }
                    file.transferTo(new File(folder.getAbsolutePath() + File.separatorChar + fileName))
                    flash.message = "Imagen actualizada correctamente"
                } else {
                    flash.message = "Debes seleccionar un fichero JPG"
                }
            }
            catch (Exception e) {
                flash.message = "Se ha producido un error!!!"
            }
        }
        redirect(view: 'index')
    }

    private boolean isJpgImg(final String img) {
        return img[-3..-1] == 'jpg'
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond modalidadService.list(params), model: [modalidadCount: modalidadService.count()]
    }

    def show(Long id) {
        respond modalidadService.get(id)
    }

    def renderModalidadImage() {
        String img = params.img

        File IMAGES_DIR = new File(grailsApplication.config.getProperty('imgUploadFolder'))
        File image = new File(IMAGES_DIR.getAbsolutePath() + File.separator + params.img)
        if (!image.exists()) {
            String defaultImg = grailsApplication.config.getProperty('defaultModalidadImg')
            image = new File(IMAGES_DIR.getAbsolutePath() + File.separator + defaultImg)
        }

        response.setContentType("application/jpg")
        OutputStream out = response.getOutputStream();
        out.write(image.bytes);
        out.close();
    }

    def edit(Long id) {
        respond modalidadService.get(id)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'modalidad.label', default: 'Modalidad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
