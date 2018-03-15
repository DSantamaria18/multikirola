package multikirola

class HomeController {

    ActividadMultikirolaService actividadMultikirolaService

    def index() {
        def eventList = actividadMultikirolaService.findNextEvents()
        render(view: "index", model:[eventList: eventList])
    }
}
