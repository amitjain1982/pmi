
<%@ page import="com.intelligrape.pmi.Questionnaire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionnaire" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionnaire" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'questionnaire.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="expiryDate" title="${message(code: 'questionnaire.expiryDate.label', default: 'Expiry Date')}" />
					
						<g:sortableColumn property="category" title="${message(code: 'questionnaire.category.label', default: 'Category')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'questionnaire.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'questionnaire.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'questionnaire.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionnaireList}" status="i" var="questionnaire">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionnaire.id}">${fieldValue(bean: questionnaire, field: "description")}</g:link></td>
					
						<td><g:formatDate date="${questionnaire.expiryDate}" /></td>
					
						<td>${fieldValue(bean: questionnaire, field: "category")}</td>
					
						<td><g:formatDate date="${questionnaire.dateCreated}" /></td>
					
						<td><g:formatDate date="${questionnaire.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: questionnaire, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionnaireInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
