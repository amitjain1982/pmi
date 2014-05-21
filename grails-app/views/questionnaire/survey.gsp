<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Project Maturity Index Survey</title>
</head>

<body>
<h2 style="text-align: center">Project Maturity Index Survey</h2>
<h2 style="text-align: center">${questionnaire.title}</h2>



<g:form name="survey" action="submitSurvey">
    <table>
        <g:each in="${questionnaire.questions.sort {it.sequenceNumber}}" var="question">
            <g:render template="/questionnaire/displayQuestionAndAnswerOptions" model="[question: question]"/>
        </g:each>
    </table>
    <g:submitButton name="Submit" value="Submit"/>
</g:form>

</body>
</html>