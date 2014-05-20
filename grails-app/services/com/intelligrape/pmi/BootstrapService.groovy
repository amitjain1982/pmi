package com.intelligrape.pmi

import com.intelligrape.pmi.enums.AnswerSheetStatus
import com.intelligrape.pmi.enums.QuestionnaireCategory
import com.intelligrape.pmi.enums.QuestionnaireStatus
import grails.transaction.Transactional
import com.intelligrape.pmi.enums.RoleType

@Transactional
class BootstrapService {

    void initialize() {

        Role adminRole = createAdminRole()
        createUserRole()

        User admin = createAdmin(adminRole)

        addVertical()

        Project project = addProject()

        Questionnaire questionnaire = addQuestionare()

        addQuestion(questionnaire)

        addCollaborator(project)

//        addAnswerSheet(project, questionnaire)

    }


    User createAdmin(Role adminRole) {
        User admin = new User(username: "amit@intelligrape.com", password: "temp")
        admin.save()
        UserRole userRole = new UserRole(user: admin, role: adminRole)
        userRole.save()
        return admin
    }


    Role createAdminRole() {
        Role adminRole = new Role(authority: RoleType.ROLE_USER.name)
        adminRole.save()
        return adminRole
    }


    Role createUserRole() {
        Role user = new Role(authority: RoleType.ROLE_ADMIN.name)
        user.save()
        return user
    }


    void addVertical() {
        Vertical grails = new Vertical(name: 'grails')
        grails.save()
    }

    Project addProject() {
        Project project = new Project(name: 'pmi', vertical: Vertical.findByName('grails'), description: "Project Maturity Index")
        project.save()
        return project
    }

    Questionnaire addQuestionare() {
        Questionnaire q1 = new Questionnaire(title: 'Grails practices', vertical: Vertical.findByName('grails'), category: QuestionnaireCategory.PROJECT, status: QuestionnaireStatus.CREATED, description: 'desc of questionnaire', expiryDate: new Date('2014/05/25'))
        q1.save()
        return q1
    }

    void addQuestion(Questionnaire questionnaire) {
        Question question = new Question(sequenceNumber: '1', text: "do you make unit test cases for your project?", detailedDescription: "Testing ques 1", questionnaire: questionnaire)
        question.save()
        addOption(question, 'a', 'Never', 0)
        addOption(question, 'b', 'Rarely', 2)
        addOption(question, 'c', 'Most of the times', 4)
        addOption(question, 'd', 'Always', 5)
    }

    void addAnswerSheet(Project project, Questionnaire questionnaire) {
        AnswerSheet answerSheet = new AnswerSheet(totalScore: 50.0, status: AnswerSheetStatus.COMPELETED, attemptedBy: Collabortaor.findByName('Amit'), dateAttempted: new Date('2014/05/15'), project: project, questionnaire: questionnaire)
        answerSheet.save()
        addAnswer(answerSheet)
    }

    void addAnswer(AnswerSheet anwerSheet) {
        Answer answer = new Answer(question: Question.findBySequenceNumber('1'), optionSelected: Option.findBySequenceNumber('a'), answerSheet: anwerSheet)
        answer.save()
    }

    void addOption(Question question, String sequenceNumber, String name, Double score) {
        new Option(sequenceNumber: sequenceNumber, name: name, score: score, question: question).save()
    }

    void addCollaborator(Project project) {
        Collabortaor collabortor = new Collabortaor(name: 'Amit', email: 'amit@intellligrape.com', isProjectOwner: true, project: project)
        collabortor.save()
    }

}
