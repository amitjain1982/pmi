package com.intelligrape.pmi



import grails.test.mixin.*
import spock.lang.*

@TestFor(AnswerSheetController)
@Mock(AnswerSheet)
class AnswerSheetControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.answerSheetList
        model.answerSheetCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.answerSheet != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def answerSheet = new AnswerSheet()
        answerSheet.validate()
        controller.save(answerSheet)

        then: "The create view is rendered again with the correct model"
        model.answerSheet != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        answerSheet = new AnswerSheet(params)

        controller.save(answerSheet)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/answerSheet/show/1'
        controller.flash.message != null
        AnswerSheet.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def answerSheet = new AnswerSheet(params)
        controller.show(answerSheet)

        then: "A model is populated containing the domain instance"
        model.answerSheet == answerSheet
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def answerSheet = new AnswerSheet(params)
        controller.edit(answerSheet)

        then: "A model is populated containing the domain instance"
        model.answerSheet == answerSheet
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/answerSheet/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def answerSheet = new AnswerSheet()
        answerSheet.validate()
        controller.update(answerSheet)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.answerSheet == answerSheet

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        answerSheet = new AnswerSheet(params).save(flush: true)
        controller.update(answerSheet)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/answerSheet/show/$answerSheet.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/answerSheet/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def answerSheet = new AnswerSheet(params).save(flush: true)

        then: "It exists"
        AnswerSheet.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(answerSheet)

        then: "The instance is deleted"
        AnswerSheet.count() == 0
        response.redirectedUrl == '/answerSheet/index'
        flash.message != null
    }
}
