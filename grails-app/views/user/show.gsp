<%@ page import="com.intelligrape.pmi.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div>
    <br/>

    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link> |
            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link>
        </nav>
    </div>
    <br/>

    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <br/>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table">

                    <g:if test="${user?.username}">
                        <tr>
                            <th><g:message code="user.username.label" default="Username"/></th>
                            <td>

                                <g:fieldValue bean="${user}" field="username"/>

                            </td>
                        </tr>

                    </g:if>    <g:if test="${com.intelligrape.pmi.UserRole.findByUser(user)}">
                    <tr>
                        <th><g:message code="userRole.role.label" default="Role"/></th>
                        <td>

                            <g:fieldValue bean="${com.intelligrape.pmi.UserRole.findByUser(user).role}" field="authority"/>

                        </td>
                    </tr>
                </g:if>



                    <g:if test="${user?.accountExpired}">
                        <tr>
                            <th><g:message code="user.accountExpired.label" default="Account Expired"/></th>
                            <td>

                                <g:formatBoolean boolean="${user?.accountExpired}"/>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${user?.accountLocked}">
                        <tr>
                            <th><g:message code="user.accountLocked.label" default="Account Locked"/></th>
                            <td>

                                <g:formatBoolean boolean="${user?.accountLocked}"/>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${user?.enabled}">
                        <tr>
                            <th><g:message code="user.enabled.label" default="Enabled"/></th>
                            <td>

                                <g:formatBoolean boolean="${user?.enabled}"/>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${user?.oauthIds}">
                        <tr>
                            <th><g:message code="user.oauthIds.label" default="Oauth Ids"/></th>
                            <td>

                                <g:each in="${user.oauthIds}" var="o">
                                    <g:link controller="OAuthID" action="show"
                                            id="${o.id}">${o?.encodeAsHTML()}</g:link>
                                </g:each>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${user?.passwordExpired}">
                        <tr>
                            <th><g:message code="user.passwordExpired.label" default="Password Expired"/></th>
                            <td>

                                <g:formatBoolean boolean="${user?.passwordExpired}"/>

                            </td>
                        </tr>
                    </g:if>

                </table>
            </div>

            <div class="form-actions text-right">
                <g:form url="[resource: user, action: 'delete']" method="DELETE">
                    <g:link class="edit btn btn-primary" action="edit" resource="${user}"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>
                    <g:actionSubmit class="delete btn btn-danger" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </g:form>
            </div>
        </div>

    </div>
</div>
</body>
</html>
