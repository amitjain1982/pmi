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


    }


    User createAdmin(Role role) {
        User admin = new User(username: "amit@intelligrape.com", password: "temp")
        admin.save()
        UserRole adminRole = new UserRole(user: admin, role: role)
        adminRole.save()
        return admin
    }


    Role createAdminRole() {
        Role adminRole = new Role(authority: RoleType.ROLE_ADMIN.name)
        adminRole.save()
        return adminRole
    }


    Role createUserRole() {
        Role userRole = new Role(authority: RoleType.ROLE_USER.name)
        userRole.save()
        return userRole
    }


    void addVertical() {
        Vertical grails = new Vertical(name: 'GRAILS')
        grails.save()
        Vertical  node= new Vertical(name: 'NODE.JS')
        node.save()
        Vertical cq = new Vertical(name: 'CQ')
        cq.save()
        Vertical  aws= new Vertical(name: 'AWS')
        aws.save()
        Vertical  bigData= new Vertical(name: 'BIG DATA')
        bigData.save()
        Vertical  mobileApps= new Vertical(name: 'MOBILE APPS')
        mobileApps.save()
    }

    Project addProject() {
        Project project = new Project(name: 'PMI', vertical: Vertical.findByName('GRAILS'), description: "Project Maturity Index")
        project.save()
        return project
    }

    Questionnaire addQuestionare() {
        Questionnaire q1 = new Questionnaire(title: 'Grails practices', vertical: Vertical.findByName('GRAILS'), category: QuestionnaireCategory.PROJECT, status: QuestionnaireStatus.CREATED, description: 'desc of questionnaire', expiryDate: new Date('2014/05/25'))
        q1.save()
        return q1
    }

    void addQuestion(Questionnaire questionnaire) {
        Question question = new Question(sequenceNumber: '1', text: "Do you make unit test cases for your project?", detailedDescription: "Testing ques 1", questionnaire: questionnaire)
        question.save()
        addOption(question, 'a', 'Never', 0)
        addOption(question, 'b', 'Rarely', 1)
        addOption(question, 'c', 'Most of the times', 3)
        addOption(question, 'd', 'Always', 4)
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
