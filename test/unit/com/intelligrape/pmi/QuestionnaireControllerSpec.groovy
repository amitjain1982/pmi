package com.intelligrape.pmi



import grails.test.mixin.*
import spock.lang.*

@TestFor(QuestionnaireController)
@Mock(Questionnaire)
class QuestionnaireControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.questionnaireList
            model.questionnaireCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.questionnaire!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def questionnaire = new Questionnaire()
            questionnaire.validate()
            controller.save(questionnaire)

        then:"The create view is rendered again with the correct model"
            model.questionnaire!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            questionnaire = new Questionnaire(params)

            controller.save(questionnaire)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/questionnaire/show/1'
            controller.flash.message != null
            Questionnaire.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def questionnaire = new Questionnaire(params)
            controller.show(questionnaire)

        then:"A model is populated containing the domain instance"
            model.questionnaire == questionnaire
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def questionnaire = new Questionnaire(params)
            controller.edit(questionnaire)

        then:"A model is populated containing the domain instance"
            model.questionnaire == questionnaire
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/questionnaire/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def questionnaire = new Questionnaire()
            questionnaire.validate()
            controller.update(questionnaire)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.questionnaire == questionnaire

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            questionnaire = new Questionnaire(params).save(flush: true)
            controller.update(questionnaire)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/questionnaire/show/$questionnaire.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/questionnaire/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def questionnaire = new Questionnaire(params).save(flush: true)

        then:"It exists"
            Questionnaire.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(questionnaire)

        then:"The instance is deleted"
            Questionnaire.count() == 0
            response.redirectedUrl == '/questionnaire/index'
            flash.message != null
    }
}
