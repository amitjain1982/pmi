<%@ page import="com.intelligrape.pmi.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <br/>
    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link> |
        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </nav>
    </div>
    <br/>
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <br/>
		<div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${question}">
			<ul class="errors" role="alert">
				<g:eachError bean="${question}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:question, action:'update']" method="PUT"  class="form-horizontal form-bordered">
            <div class="panel panel-default">
                <div class="panel-body">
				<g:hiddenField name="version" value="${question?.version}" />
					<g:render template="form"/>
                    </div>
                <div class="form-actions text-right">
					<g:actionSubmit class="save btn btn-primary" action="update btn btn-primary" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</div>
                </div>
			</g:form>
		</div>
	</body>
</html>
