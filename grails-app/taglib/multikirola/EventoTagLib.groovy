package multikirola

class EventoTagLib {
    static defaultEncodeAs = [taglib:'text']
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def fichaEvento = {attrs, body ->
        out << render(template: "/fichaEvento", model: [evento: attrs.event])
    }
}
