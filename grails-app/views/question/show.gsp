
<%@ page import="com.intelligrape.pmi.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${question?.sequenceNumber}">
				<li class="fieldcontain">
					<span id="sequenceNumber-label" class="property-label"><g:message code="question.sequenceNumber.label" default="Sequence Number" /></span>
					
						<span class="property-value" aria-labelledby="sequenceNumber-label"><g:fieldValue bean="${question}" field="sequenceNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${question?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="question.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${question}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${question?.detailedDescription}">
				<li class="fieldcontain">
					<span id="detailedDescription-label" class="property-label"><g:message code="question.detailedDescription.label" default="Detailed Description" /></span>
					
						<span class="property-value" aria-labelledby="detailedDescription-label"><g:fieldValue bean="${question}" field="detailedDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${question?.options}">
				<li class="fieldcontain">
					<span id="options-label" class="property-label"><g:message code="question.options.label" default="Options" /></span>
					
						<g:each in="${question.options}" var="o">
						<span class="property-value" aria-labelledby="options-label"><g:link controller="option" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${question?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="question.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${question?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${question?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="question.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${question?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${question?.questionnaire}">
				<li class="fieldcontain">
					<span id="questionnaire-label" class="property-label"><g:message code="question.questionnaire.label" default="Questionnaire" /></span>
					
						<span class="property-value" aria-labelledby="questionnaire-label"><g:link controller="questionnaire" action="show" id="${question?.questionnaire?.id}">${question?.questionnaire?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:question, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${question}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
