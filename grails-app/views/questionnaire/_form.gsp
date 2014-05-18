<%@ page import="com.intelligrape.pmi.Questionnaire" %>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="questionnaire.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${questionnaireInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="questionnaire.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${questionnaireInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'vertical', 'error')} required">
    <label for="vertical">
        <g:message code="questionnaire.vertical.label" default="Vertical"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="vertical" name="vertical.id" from="${com.intelligrape.pmi.Vertical.list()}" optionKey="id" required=""
              optionValue="name" value="${questionnaireInstance?.vertical?.id}"
              class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'category', 'error')} required">
    <label for="category">
        <g:message code="questionnaire.category.label" default="Category"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="category" from="${com.intelligrape.pmi.enums.QuestionnaireCategory?.values()}"
              keys="${com.intelligrape.pmi.enums.QuestionnaireCategory.values()*.name()}" required=""
              value="${questionnaireInstance?.category?.name()}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'expiryDate', 'error')} ">
    <label for="expiryDate">
        <g:message code="questionnaire.expiryDate.label" default="Expiry Date"/>

    </label>
    <g:datePicker name="expiryDate" precision="day" value="${questionnaireInstance?.expiryDate}" default="none"
                  noSelection="['': '']"/>
</div>


<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'status', 'error')} required">
    <label for="status">
        <g:message code="questionnaire.status.label" default="Status"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="status" from="${com.intelligrape.pmi.enums.QuestionnaireStatus?.values()}"
              keys="${com.intelligrape.pmi.enums.QuestionnaireStatus.values()*.name()}" required=""
              value="${questionnaireInstance?.status?.name()}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: questionnaireInstance, field: 'questions', 'error')} ">
    <label for="questions">
        <g:message code="questionnaire.questions.label" default="Questions"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${questionnaireInstance?.questions ?}" var="q">
            <li><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="question" action="create"
                    params="['questionnaire.id': questionnaireInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
        </li>
    </ul>

</div>






