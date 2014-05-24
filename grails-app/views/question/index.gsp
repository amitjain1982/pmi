<%@ page import="com.intelligrape.pmi.Question" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}"/>
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

                    <g:sortableColumn class="sorting_asc" property="sequenceNumber"
                                      title="${message(code: 'question.sequenceNumber.label', default: 'Sequence Number')}"/>

                    <g:sortableColumn class="sorting_asc" property="text"
                                      title="${message(code: 'question.text.label', default: 'Text')}"/>

                    <g:sortableColumn class="sorting_asc" property="detailedDescription"
                                      title="${message(code: 'question.detailedDescription.label', default: 'Detailed Description')}"/>

                    <g:sortableColumn class="sorting_asc" property="dateCreated"
                                      title="${message(code: 'question.dateCreated.label', default: 'Date Created')}"/>

                    <g:sortableColumn class="sorting_asc" property="lastUpdated"
                                      title="${message(code: 'question.lastUpdated.label', default: 'Last Updated')}"/>

                    <th class="sorting_asc"><g:message code="question.questionnaire.label"
                                                       default="Questionnaire"/></th>

                </tr>
                </thead>
                <tbody role="alert" aria-live="polite" aria-relevant="all">
                <g:each in="${questionList}" status="i" var="question">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${question.id}">${fieldValue(bean: question, field: "sequenceNumber")}</g:link></td>

                        <td>${fieldValue(bean: question, field: "text")}</td>

                        <td>${fieldValue(bean: question, field: "detailedDescription")}</td>

                        <td><g:formatDate date="${question.dateCreated}"/></td>

                        <td><g:formatDate date="${question.lastUpdated}"/></td>

                        <td>${fieldValue(bean: question, field: "questionnaire")}</td>

                    </tr>
                </g:each>

                </tbody>
            </table>
        </div>

        <div class="datatable-footer">
            <g:paginate total="${questionCount ?: 0}"/>
        </div>

    </div>
</div>
</body>
</html>

<div class="col-sm-10">
<div class="row"><div class="col-sm-6">
    <input type="text"/>
    </div>
    <div class="col-sm-2">
        score select box
    </div>
    <div class="col-sm-2">
        icons
    </div>
</div>
    <span
        class="ui-spinner ui-widget ui-widget-content ui-corner-all"><input type="text"
                                                                            class="form-control ui-spinner-input"
                                                                            id="spinner-decimal" name="spinner-decimal"
                                                                            value="5.06" aria-valuenow="5.06"
                                                                            autocomplete="off" role="spinbutton"><a
            class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1"><span
                class="ui-icon ui-icon-triangle-1-n">▲</span></a><a
            class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1"><span
                class="ui-icon ui-icon-triangle-1-s">▼</span></a></span></div>

    <div class="col-sm-6"><div class="select2-container select" id="s2id_culture" style="width: 200px;"><a
            href="javascript:void(0)" onclick="return false;" class="select2-choice select2-default" tabindex="-1"><span
                class="select2-chosen">Change format</span><abbr class="select2-search-choice-close"></abbr>   <span
                class="select2-arrow"><b></b></span></a><input class="select2-focusser select2-offscreen" type="text"
                                                               id="s2id_autogen1">

        <div class="select2-drop select2-display-none"><div
                class="select2-search select2-search-hidden select2-offscreen"><input type="text" autocomplete="off"
                                                                                      autocorrect="off"
                                                                                      autocapitalize="off"
                                                                                      spellcheck="false"
                                                                                      class="select2-input"></div>   <ul
                class="select2-results"></ul></div></div><select data-placeholder="Change format" id="culture"
                                                                 class="select select2-offscreen" tabindex="-1"><option
                value=""></option> <option value="en-EN">English</option> <option value="de-DE">German</option> <option
                value="ja-JP">Japanese</option></select></div></div></div>