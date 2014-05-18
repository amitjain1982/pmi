<%@ page import="com.intelligrape.pmi.Questionnaire" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-questionnaire" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                    default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-questionnaire" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list questionnaire">

        <g:if test="${questionnaireInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="questionnaire.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${questionnaireInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.expiryDate}">
            <li class="fieldcontain">
                <span id="expiryDate-label" class="property-label"><g:message code="questionnaire.expiryDate.label"
                                                                              default="Expiry Date"/></span>

                <span class="property-value" aria-labelledby="expiryDate-label"><g:formatDate
                        date="${questionnaireInstance?.expiryDate}"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.category}">
            <li class="fieldcontain">
                <span id="category-label" class="property-label"><g:message code="questionnaire.category.label"
                                                                            default="Category"/></span>

                <span class="property-value" aria-labelledby="category-label"><g:fieldValue
                        bean="${questionnaireInstance}" field="category"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="questionnaire.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${questionnaireInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="questionnaire.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${questionnaireInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.questions}">
            <li class="fieldcontain">
                <span id="questions-label" class="property-label"><g:message code="questionnaire.questions.label"
                                                                             default="Questions"/></span>

                <g:each in="${questionnaireInstance.questions}" var="q">
                    <span class="property-value" aria-labelledby="questions-label"><g:link controller="question"
                                                                                           action="show"
                                                                                           id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>
        <li class="fieldcontain">
            <span id="Addquestion" class="property-value"><g:link controller="question" action="create"
                    params="['questionnaire.id': questionnaireInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'question.label', default: 'Question')])}</g:link>
        </li>

        <g:if test="${questionnaireInstance?.status}">
            <li class="fieldcontain">
                <span id="status-label" class="property-label"><g:message code="questionnaire.status.label"
                                                                          default="Status"/></span>

                <span class="property-value" aria-labelledby="status-label"><g:fieldValue
                        bean="${questionnaireInstance}" field="status"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="questionnaire.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionnaireInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${questionnaireInstance?.vertical}">
            <li class="fieldcontain">
                <span id="vertical-label" class="property-label"><g:message code="questionnaire.vertical.label"
                                                                            default="Vertical"/></span>

                <span class="property-value" aria-labelledby="vertical-label"><g:link controller="vertical"
                                                                                      action="show"
                                                                                      id="${questionnaireInstance?.vertical?.id}">${questionnaireInstance?.vertical?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: questionnaireInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${questionnaireInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
