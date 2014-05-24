
<%@ page import="com.intelligrape.pmi.Option" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'option.label', default: 'Option')}" />
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
                        
                        <g:sortableColumn class="sorting_asc" property="score" title="${message(code: 'option.score.label', default: 'Score')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="sequenceNumber" title="${message(code: 'option.sequenceNumber.label', default: 'Sequence Number')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="dateCreated" title="${message(code: 'option.dateCreated.label', default: 'Date Created')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="lastUpdated" title="${message(code: 'option.lastUpdated.label', default: 'Last Updated')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="name" title="${message(code: 'option.name.label', default: 'Name')}" />
                        
                        <th class="sorting_asc"><g:message code="option.question.label" default="Question" /></th>
                        


                    </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
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
            </div>

            <div class="datatable-footer">
                <g:paginate total="${optionCount ?: 0}" />
            </div>

        </div>
    </div>
	</body>
</html>
