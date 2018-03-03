package multikirola

import static org.springframework.http.HttpStatus.*

class ActividadMultikirolaController {

    ActividadMultikirolaService actividadMultikirolaService

    def index() {}

    def showEvents(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def eventList = actividadMultikirolaService.findEvents(params.modalidad)

        if (eventList.size() == 0) {
            flash.message = "Lo sentimos, no hay actividades programadas para esta modalidad..."
        }
        [eventList: eventList]
    }
}
