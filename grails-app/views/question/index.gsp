
<%@ page import="com.intelligrape.pmi.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="sequenceNumber" title="${message(code: 'question.sequenceNumber.label', default: 'Sequence Number')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'question.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="detailedDescription" title="${message(code: 'question.detailedDescription.label', default: 'Detailed Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'question.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'question.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="question.questionnaire.label" default="Questionnaire" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "sequenceNumber")}</g:link></td>
					
						<td>${fieldValue(bean: questionInstance, field: "text")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "detailedDescription")}</td>
					
						<td><g:formatDate date="${questionInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${questionInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: questionInstance, field: "questionnaire")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
