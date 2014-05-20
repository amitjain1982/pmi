
<%@ page import="com.intelligrape.pmi.Option" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'option.label', default: 'Option')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-option" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-option" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="score" title="${message(code: 'option.score.label', default: 'Score')}" />
					
						<g:sortableColumn property="sequenceNumber" title="${message(code: 'option.sequenceNumber.label', default: 'Sequence Number')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'option.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'option.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'option.name.label', default: 'Name')}" />
					
						<th><g:message code="option.question.label" default="Question" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${optionList}" status="i" var="option">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${option.id}">${fieldValue(bean: option, field: "score")}</g:link></td>
					
						<td>${fieldValue(bean: option, field: "sequenceNumber")}</td>
					
						<td><g:formatDate date="${option.dateCreated}" /></td>
					
						<td><g:formatDate date="${option.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: option, field: "name")}</td>
					
						<td>${fieldValue(bean: option, field: "question")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${optionCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
