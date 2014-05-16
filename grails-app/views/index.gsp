<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to PMI</title>
</head>

<body>
<h6 class="heading-hr"><i class="icon-pencil"></i>Available Controllers</h6>
<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
    <p><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></p>
</g:each>
</body>
</html>
