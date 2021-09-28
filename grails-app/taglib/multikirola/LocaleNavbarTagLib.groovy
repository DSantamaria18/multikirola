package multikirola

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import org.springframework.context.MessageSource
import org.springframework.web.servlet.support.RequestContextUtils

class LocaleNavbarTagLib implements GrailsConfigurationAware {
    static namespace = "navBar"
    static defaultEncodeAs = [taglib: 'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    MessageSource messageSource

    List<String> languages

    @Override
    void setConfiguration(Config config) {
        languages = config.getProperty('guide.languages', List)
    }

    def localeDropdownListItems = { args ->
        String uri = args.uri

        for (String lang in languages) {
            String languageCode = "language.${lang}"
            def locale = RequestContextUtils.getLocale(request)
            def msg = messageSource.getMessage(languageCode, [] as Object[], null, locale)
            def baseUri = request.forwardURI
            def queryString = request.queryString
            if (queryString == null) queryString = ''
            queryString = queryString.replaceAll(/lang=es'/, '')
            queryString = queryString.replaceAll(/lang=eu/, '')
            queryString = queryString.replaceAll(/&/, '')

            out << "<li><a href='${baseUri}?${queryString}&lang=${lang}'>${msg}</a></li>"
        }
    }
}
