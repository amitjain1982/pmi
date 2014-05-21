<%@ page import="com.intelligrape.pmi.Project" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Project Maturity Index Survey</title>
</head>

<body>
<h2 style="text-align: center">Project Maturity Index Survey</h2>

<h2 style="text-align: center">${questionnaire.title}</h2>

<g:form name="survey" action="submitSurvey">
    <g:hiddenField name="project.id" value="${Project.get('1').id}"/>
    <g:hiddenField name="questionnaire.id" value="${questionnaire.id}"/>

    <table>
        <g:each in="${questionnaire.questions.sort { it.sequenceNumber }}" var="question" status="index">
            <g:render template="/questionnaire/displayQuestionAndAnswerOptions"
                      model="['question': question, 'index': index]"/>
        </g:each>
    </table>


    <br>
    <label for="comment">Additional Comments</label>
    <g:textField name="comment" maxlength="200"/>

    <br>
    <g:hiddenField name="status" value="${com.intelligrape.pmi.enums.AnswerSheetStatus.COMPELETED}"/>

    <br>
    <g:submitButton name="Submit" value="Submit"/>

</g:form>

</body>
</html>