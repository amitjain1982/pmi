
<%@ page import="com.intelligrape.pmi.UserRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
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

                            
				<g:if test="${userRole?.role}">
                    <tr>
                    <th><g:message code="userRole.role.label" default="Role" /></th>
                    <td>
					
						 <g:link controller="role" action="show" id="${userRole?.role?.id}">${userRole?.role?.encodeAsHTML()}</g:link>
					
                    </td>
                    </tr>
				</g:if>
			
				<g:if test="${userRole?.user}">
                    <tr>
                    <th><g:message code="userRole.user.label" default="User" /></th>
                    <td>
					
						 <g:link controller="user" action="show" id="${userRole?.user?.id}">${userRole?.user?.encodeAsHTML()}</g:link>
					
                    </td>
                    </tr>
				</g:if>
			
                 </table>
                </div>
                <div class="form-actions text-right">
                    <g:form url="[resource:userRole, action:'delete']" method="DELETE">
                            <g:link class="edit btn btn-primary" action="edit" resource="${userRole}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
			</div>

		</div>
       </div>
	</body>
</html>
