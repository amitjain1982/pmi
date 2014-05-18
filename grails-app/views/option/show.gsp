
<%@ page import="com.intelligrape.pmi.Option" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'option.label', default: 'Option')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-option" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-option" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list option">
			
				<g:if test="${optionInstance?.score}">
				<li class="fieldcontain">
					<span id="score-label" class="property-label"><g:message code="option.score.label" default="Score" /></span>
					
						<span class="property-value" aria-labelledby="score-label"><g:fieldValue bean="${optionInstance}" field="score"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="option.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${optionInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="option.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${optionInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="option.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${optionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="option.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${optionInstance?.question?.id}">${optionInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${optionInstance?.sequenceNumber}">
				<li class="fieldcontain">
					<span id="sequenceNumber-label" class="property-label"><g:message code="option.sequenceNumber.label" default="Sequence Number" /></span>
					
						<span class="property-value" aria-labelledby="sequenceNumber-label"><g:fieldValue bean="${optionInstance}" field="sequenceNumber"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:optionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${optionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
