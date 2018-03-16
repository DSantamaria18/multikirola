package multikirola

class HomeController {

    ActividadMultikirolaService actividadMultikirolaService

    def index() {
        def eventList = actividadMultikirolaService.findNextEvents(6)
        render(view: "index", model:[eventList: eventList])
    }
}
