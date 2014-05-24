<%@ page import="com.intelligrape.pmi.Option" %>



<div class="form-group ${hasErrors(bean: option, field: 'score', 'error')} required">
    <div class="col-sm-2">
	<label for="score control-label">
		<g:message code="option.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:field class="form-control" name="score" value="${fieldValue(bean: option, field: 'score')}" required=""/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: option, field: 'sequenceNumber', 'error')} ">
    <div class="col-sm-2">
	<label for="sequenceNumber control-label">
		<g:message code="option.sequenceNumber.label" default="Sequence Number" />
		
	</label>
        </div>
    <div class="col-sm-10">
	    <g:textField class="form-control" name="sequenceNumber" value="${option?.sequenceNumber}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: option, field: 'name', 'error')} required">
    <div class="col-sm-2">
	<label for="name control-label">
		<g:message code="option.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:textField class="form-control" name="name" required="" value="${option?.name}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: option, field: 'question', 'error')} required">
    <div class="col-sm-2">
	<label for="question control-label">
		<g:message code="option.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:select id="question" name="question.id" from="${com.intelligrape.pmi.Question.list()}" optionKey="id" required="" value="${option?.question?.id}" class="many-to-one form-control"/>
    </div>
</div>

