import com.intelligrape.pmi.Answer
import com.intelligrape.pmi.AnswerSheet
import com.intelligrape.pmi.BootstrapService
import com.intelligrape.pmi.Collabortaor
import com.intelligrape.pmi.Option
import com.intelligrape.pmi.Project
import com.intelligrape.pmi.Question
import com.intelligrape.pmi.Questionnaire
import com.intelligrape.pmi.Role
import com.intelligrape.pmi.User
import com.intelligrape.pmi.UserRole
import com.intelligrape.pmi.Vertical
import com.intelligrape.pmi.enums.AnswerSheetStatus
import com.intelligrape.pmi.enums.QuestionnaireCategory
import com.intelligrape.pmi.enums.QuestionnaireStatus
import groovy.util.logging.Log4j

@Log4j
class BootStrap {

    BootstrapService bootstrapService

    def init = { servletContext ->

        bootstrapService.initialize()
    }

    def destroy = {
    }
}
