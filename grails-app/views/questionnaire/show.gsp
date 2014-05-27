<%@ page import="com.intelligrape.pmi.Questionnaire" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'questionnaire.label', default: 'Questionnaire')}"/>
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

                    <g:if test="${questionnaire?.title}">
                        <tr>
                            <th><g:message code="questionnaire.title.label" default="Title"/></th>
                            <td>

                                <g:fieldValue bean="${questionnaire}" field="title"/>

                            </td>
                        </tr>
                    </g:if>


                    <g:if test="${questionnaire?.description}">
                        <tr>
                            <th><g:message code="questionnaire.description.label" default="Description"/></th>
                            <td>

                                <g:fieldValue bean="${questionnaire}" field="description"/>

                            </td>
                        </tr>
                    </g:if>


                    <g:if test="${questionnaire?.vertical}">
                        <tr>
                            <th><g:message code="questionnaire.vertical.label" default="Vertical"/></th>
                            <td>

                                <g:link controller="vertical" action="show"
                                        id="${questionnaire?.vertical?.id}">${questionnaire?.vertical?.name}</g:link>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${questionnaire?.category}">
                        <tr>
                            <th><g:message code="questionnaire.category.label" default="Category"/></th>
                            <td>

                                <g:fieldValue bean="${questionnaire}" field="category"/>

                            </td>
                        </tr>
                    </g:if>



                    <g:if test="${questionnaire?.expiryDate}">
                        <tr>
                            <th><g:message code="questionnaire.expiryDate.label" default="Expiry Date"/></th>
                            <td>

                                <g:formatDate date="${questionnaire?.expiryDate}"/>

                            </td>
                        </tr>
                    </g:if>


                    <g:if test="${questionnaire?.dateCreated}">
                        <tr>
                            <th><g:message code="questionnaire.dateCreated.label" default="Date Created"/></th>
                            <td>

                                <g:formatDate date="${questionnaire?.dateCreated}"/>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${questionnaire?.lastUpdated}">
                        <tr>
                            <th><g:message code="questionnaire.lastUpdated.label" default="Last Updated"/></th>
                            <td>

                                <g:formatDate date="${questionnaire?.lastUpdated}"/>

                            </td>
                        </tr>
                    </g:if>
                    <g:if test="${questionnaire?.status}">
                        <tr>
                            <th><g:message code="questionnaire.status.label" default="Status"/></th>
                            <td>

                                <g:fieldValue bean="${questionnaire}" field="status"/>

                            </td>
                        </tr>
                    </g:if>

                    <g:if test="${questionnaire?.questions}">
                        <tr>
                            <th><g:message code="questionnaire.questions.label" default="Questions"/></th>
                            <td>
                                <table class="table-condensed">
                                    <g:each in="${questionnaire.questions.sort { it.sequenceNumber }}" var="question">
                                        <g:render template="/question/displayQuestion" model="[question: question]"/>
                                    </g:each>
                                </table>

                            </td>
                        </tr>
                    </g:if>

                    <tr>
                        <td></td>
                        <td><g:link name="addQuestionLink" controller="question" action="create"
                                    params="['questionnaireId': questionnaire?.id]">Add Question</g:link></td>

                    </tr>

                </table>
            </div>

            <div class="form-actions text-right">
                <g:form url="[resource: questionnaire, action: 'delete']" method="DELETE">
                    <g:link class="edit tip btn btn-primary" resource="${questionnaire}" action="edit"
                            params="['questionnaire.id': questionnaire.id]"><g:message
                            code="default.button.edit.label" default="Edit"/></g:link>

                    <g:actionSubmit class="btn btn-danger" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </g:form>
            </div>
        </div>

    </div>
</div>
</body>
</html>
