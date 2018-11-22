package multikirola

import grails.plugin.springsecurity.SpringSecurityService

class UserDetailsTagLib {
    SpringSecurityService springSecurityService

    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def userName= {attrs, body ->
        User loggedInUser = springSecurityService.currentUser as User
        out << loggedInUser.nombre
    }

}
