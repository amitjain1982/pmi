
<%@ page import="com.intelligrape.pmi.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
                        
                        <g:sortableColumn class="sorting_asc" property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
                        
                        <g:sortableColumn class="sorting_asc" property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
                        


                    </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <g:each in="${userList}" status="i" var="user">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            
                            <td><g:link action="show" id="${user.id}">${fieldValue(bean: user, field: "username")}</g:link></td>
                            
                            <td>${fieldValue(bean: user, field: "password")}</td>
                            
                            <td><g:formatBoolean boolean="${user.accountExpired}" /></td>
                            
                            <td><g:formatBoolean boolean="${user.accountLocked}" /></td>
                            
                            <td><g:formatBoolean boolean="${user.enabled}" /></td>
                            
                            <td><g:formatBoolean boolean="${user.passwordExpired}" /></td>
                            
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </div>

            <div class="datatable-footer">
                <g:paginate total="${userCount ?: 0}" />
            </div>

        </div>
    </div>
	</body>
</html>
