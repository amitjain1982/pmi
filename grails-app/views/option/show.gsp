
<%@ page import="com.intelligrape.pmi.Option" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'option.label', default: 'Option')}" />
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

                            
				<g:if test="${option?.score}">
                    <tr>
                    <th><g:message code="option.score.label" default="Score" /></th>
                    <td>
					
						<g:fieldValue bean="${option}" field="score"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${option?.sequenceNumber}">
                    <tr>
                    <th><g:message code="option.sequenceNumber.label" default="Sequence Number" /></th>
                    <td>
					
						<g:fieldValue bean="${option}" field="sequenceNumber"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${option?.dateCreated}">
                    <tr>
                    <th><g:message code="option.dateCreated.label" default="Date Created" /></th>
                    <td>
					
						<g:formatDate date="${option?.dateCreated}" />
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${option?.lastUpdated}">
                    <tr>
                    <th><g:message code="option.lastUpdated.label" default="Last Updated" /></th>
                    <td>
					
						<g:formatDate date="${option?.lastUpdated}" />
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${option?.name}">
                    <tr>
                    <th><g:message code="option.name.label" default="Name" /></th>
                    <td>
					
						<g:fieldValue bean="${option}" field="name"/>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${option?.question}">
                    <tr>
                    <th><g:message code="option.question.label" default="Question" /></th>
                    <td>
					
						 <g:link controller="question" action="show" id="${option?.question?.id}">${option?.question?.encodeAsHTML()}</g:link>
					
                    </td>
                    </tr>
				</g:if>
			
                 </table>
                </div>
                <div class="form-actions text-right">
                    <g:form url="[resource:option, action:'delete']" method="DELETE">
                            <g:link class="edit btn btn-primary" action="edit" resource="${option}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
			</div>

		</div>
       </div>
	</body>
</html>
