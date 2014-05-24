
<%@ page import="com.intelligrape.pmi.Questionnaire" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <br/>
    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </nav>
    </div>
    <br/>
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <br/>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="panel panel-default">
        <div class="datatable"><divrole="grid">
            <div class="datatable-header">
            </div>

            <div class="datatable-scroll">
                <table class="table table-bordered dataTable">
                    <thead>
                    <tr role="row">
                        
                        <g:sortableColumn class="sorting_asc" property="description" title="${message(code: 'questionnaire.description.label', default: 'Description')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="expiryDate" title="${message(code: 'questionnaire.expiryDate.label', default: 'Expiry Date')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="category" title="${message(code: 'questionnaire.category.label', default: 'Category')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="dateCreated" title="${message(code: 'questionnaire.dateCreated.label', default: 'Date Created')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="lastUpdated" title="${message(code: 'questionnaire.lastUpdated.label', default: 'Last Updated')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="status" title="${message(code: 'questionnaire.status.label', default: 'Status')}" />
                        


                    </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
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
            </div>

            <div class="datatable-footer">
                <g:paginate total="${questionnaireCount ?: 0}" />
            </div>

        </div>
    </div>
	</body>
</html>
