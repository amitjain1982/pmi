<%@ page import="com.intelligrape.pmi.Option" %>



<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'score', 'error')} required">
    <label for="score">
        <g:message code="option.score.label" default="Score"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="score" value="${fieldValue(bean: optionInstance, field: 'score')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="option.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${optionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'question', 'error')} required">
    <label for="question">
        <g:message code="option.question.label" default="Question"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="question" name="question.id" from="${com.intelligrape.pmi.Question.list()}" optionKey="id" required=""
              value="${optionInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: optionInstance, field: 'sequenceNumber', 'error')} required">
    <label for="sequenceNumber">
        <g:message code="option.sequenceNumber.label" default="Sequence Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="sequenceNumber" required="" value="${optionInstance?.sequenceNumber}"/>
</div>

