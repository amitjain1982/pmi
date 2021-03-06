<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <br/>
    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
        <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link>
        </nav>
    </div>
    <br/>
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <br/>
		<div>
			<div class="page-title"><g:message code="default.create.label" args="[entityName]" /></div>
			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
                <ul class="errors" role="alert">
                    <g:eachError bean="\${${propertyName}}" var="error">
                        <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
			<g:form url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %> class="form-horizontal form-bordered">
            <div class="panel panel-default">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <g:render template="form"/>
                </div>
                <div class="form-actions text-right">
                    <g:submitButton name="create" class="save btn btn-primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </div>
			</g:form>
		</div>
	</body>
</html>
