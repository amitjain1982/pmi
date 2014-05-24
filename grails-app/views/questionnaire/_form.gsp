<%@ page import="com.intelligrape.pmi.Questionnaire" %>

<div class="form-group ${hasErrors(bean: questionnaire, field: 'title', 'error')} required">
    <div class="col-sm-2">
        <label for="title control-label">
            <g:message code="questionnaire.title.label" default="Title" />
            <span class="required-indicator">*</span>
        </label>
    </div>
    <div class="col-sm-10">
        <g:textField class="form-control" name="title" required="" value="${questionnaire?.title}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionnaire, field: 'description', 'error')} ">
    <div class="col-sm-2">
	<label for="description control-label">
		<g:message code="questionnaire.description.label" default="Description" />
		
	</label>
        </div>
    <div class="col-sm-10">
	    <g:textField class="form-control" name="description" value="${questionnaire?.description}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionnaire, field: 'vertical', 'error')} required">
    <div class="col-sm-2">
        <label for="vertical control-label">
            <g:message code="questionnaire.vertical.label" default="Vertical" />
            <span class="required-indicator">*</span>
        </label>
    </div>
    <div class="col-sm-10">
        <g:select id="vertical" name="vertical.id" from="${com.intelligrape.pmi.Vertical.list()}" optionKey="id" optionValue="name" required="" value="${questionnaire?.vertical?.id}" class="many-to-one form-control"/>
    </div>
</div>


<div class="form-group ${hasErrors(bean: questionnaire, field: 'category', 'error')} required">
    <div class="col-sm-2">
	<label for="category control-label">
		<g:message code="questionnaire.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:select name="category" class="many-to-one form-control" from="${com.intelligrape.pmi.enums.QuestionnaireCategory?.values()}" keys="${com.intelligrape.pmi.enums.QuestionnaireCategory.values()*.name()}" required="" value="${questionnaire?.category?.name()}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionnaire, field: 'expiryDate', 'error')} ">
    <div class="col-sm-2">
        <label for="expiryDate control-label">
            <g:message code="questionnaire.expiryDate.label" default="Expiry Date" />
        </label>
    </div>
    <div class="col-sm-10">
        <g:datePicker name="expiryDate" class="date"/>
    </div>
</div>


<div class="form-group ${hasErrors(bean: questionnaire, field: 'status', 'error')} required">
    <div class="col-sm-2">
        <label for="status control-label">
            <g:message code="questionnaire.status.label" default="Status" />
            <span class="required-indicator">*</span>
        </label>
    </div>
    <div class="col-sm-10">
        <g:select name="status" class="many-to-one form-control" from="${com.intelligrape.pmi.enums.QuestionnaireStatus?.values()}" keys="${com.intelligrape.pmi.enums.QuestionnaireStatus.values()*.name()}" required="" value="${questionnaire?.status?.name()}"/>
    </div>
</div>

