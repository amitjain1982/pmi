<%@ page import="com.intelligrape.pmi.UserRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <br/>
    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
            <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link> |
        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </nav>
    </div>
    <br/>
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <br/>
		<div>
            <div class="page-title"><g:message code="default.edit.label" args="[entityName]" /></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userRole}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userRole}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userRole, action:'update']" method="PUT"  class="form-horizontal form-bordered">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
				<g:hiddenField name="version" value="${userRole?.version}" />
					<g:render template="form"/>
                    </div>
                <div class="form-actions text-right">
					<g:actionSubmit class="save btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</div>
                </div>
			</g:form>
		</div>
	</body>
</html>
