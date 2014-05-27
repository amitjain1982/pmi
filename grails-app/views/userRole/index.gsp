<%@ page import="com.intelligrape.pmi.UserRole" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<br/>

<div class="pageInfo" role="navigation">
    <nav class="span12 ">
        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
    </nav>
</div>
<br/>

<h1><g:message code="default.list.label" args="[entityName]"/></h1>
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

                    <th class="sorting_asc"><g:message code="userRole.role.label" default="Role"/></th>

                    <th class="sorting_asc"><g:message code="userRole.user.label" default="User"/></th>

                </tr>
                </thead>
                <tbody role="alert" aria-live="polite" aria-relevant="all">
                <g:each in="${userRoleList}" status="i" var="userRole">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: userRole, field: "role")}</td>

                        <td>${fieldValue(bean: userRole, field: "user")}</td>

                    </tr>
                </g:each>

                </tbody>
            </table>
        </div>

        <div class="datatable-footer">
            <g:paginate total="${userRoleCount ?: 0}"/>
        </div>

    </div>
</div>
</body>
</html>
