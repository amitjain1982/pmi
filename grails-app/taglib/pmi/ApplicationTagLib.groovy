package pmi

class ApplicationTagLib {
    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']


    def displayQuestion = { attrs,body ->
        out << render(template: "/question/displayQuestion", model: [question:attrs.question])

    }






}
