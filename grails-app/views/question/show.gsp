
<%@ page import="com.intelligrape.pmi.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div>
            <br/>
            <div class="pageInfo" role="navigation">
                <nav class="span12 ">
                    <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link> |
                    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                </nav>
            </div>
            <br/>
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <br/>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">

                            
				<g:if test="${question?.sequenceNumber}">
                    <tr>
                    <th><g:message code="question.sequenceNumber.label" default="Sequence Number" /></th>
                    <td>
					
						<g:fieldValue bean="${question}" field="sequenceNumber"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.text}">
                    <tr>
                    <th><g:message code="question.text.label" default="Text" /></th>
                    <td>
					
						<g:fieldValue bean="${question}" field="text"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.detailedDescription}">
                    <tr>
                    <th><g:message code="question.detailedDescription.label" default="Detailed Description" /></th>
                    <td>
					
						<g:fieldValue bean="${question}" field="detailedDescription"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.options}">
                    <tr>
                    <th><g:message code="question.options.label" default="Options" /></th>
                    <td>
					
						<g:each in="${question.options}" var="o">
						  <g:link controller="option" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link>
						</g:each>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.dateCreated}">
                    <tr>
                    <th><g:message code="question.dateCreated.label" default="Date Created" /></th>
                    <td>
					
						<g:formatDate date="${question?.dateCreated}" />
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.lastUpdated}">
                    <tr>
                    <th><g:message code="question.lastUpdated.label" default="Last Updated" /></th>
                    <td>
					
						<g:formatDate date="${question?.lastUpdated}" />
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${question?.questionnaire}">
                    <tr>
                    <th><g:message code="question.questionnaire.label" default="Questionnaire" /></th>
                    <td>
					
						 <g:link controller="questionnaire" action="show" id="${question?.questionnaire?.id}">${question?.questionnaire?.encodeAsHTML()}</g:link>
					
                    </td>
                    </tr>
				</g:if>
			
                 </table>
                </div>
                <div class="form-actions text-right">
                    <g:form url="[resource:question, action:'delete']" method="DELETE">
                            <g:link class="edit btn btn-primary" action="edit" resource="${question}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
			</div>

		</div>
       </div>
	</body>
</html>
