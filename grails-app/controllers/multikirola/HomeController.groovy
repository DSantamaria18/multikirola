package multikirola

import grails.core.GrailsApplication

class HomeController {

    ActividadMultikirolaService actividadMultikirolaService
    GrailsApplication grailsApplication

    def index() {
        def eventList = actividadMultikirolaService.findNextEvents(6)
        render(view: "index", model: [eventList: eventList])
    }

    def renderActivityImage() {
        String img = params.img

        File IMAGES_DIR = new File(grailsApplication.config.getProperty('imgUploadFolder'))
        File image = new File(IMAGES_DIR.getAbsolutePath() + File.separator + params.img)
        if (!image.exists()) {
            response.status = 404
        } else {
            response.setContentType("application/jpg")
            OutputStream out = response.getOutputStream();
            out.write(image.bytes);
            out.close();
        }
    }
}
