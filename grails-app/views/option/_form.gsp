<%@ page import="com.intelligrape.pmi.Option" %>



<div class="fieldcontain ${hasErrors(bean: option, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="option.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" value="${fieldValue(bean: option, field: 'score')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: option, field: 'sequenceNumber', 'error')} ">
	<label for="sequenceNumber">
		<g:message code="option.sequenceNumber.label" default="Sequence Number" />
		
	</label>
	<g:textField name="sequenceNumber" value="${option?.sequenceNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: option, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="option.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${option?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: option, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="option.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${com.intelligrape.pmi.Question.list()}" optionKey="id" required="" value="${option?.question?.id}" class="many-to-one"/>
</div>

