<%@ page import="com.intelligrape.pmi.Project" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Project Maturity Index Survey</title>
</head>

<body>
<h2 style="text-align: center">Project Maturity Index Survey</h2>

<h2 style="text-align: center">${questionnaire.title}</h2>

<g:form id="surveyForm" controller="AnswerSheet" action="submitSurvey">
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
    <g:textField name="comment" maxlength="256"/>

    <br>
    <g:hiddenField name="status" value="${com.intelligrape.pmi.enums.AnswerSheetStatus.COMPELETED}"/>

    <br>

    <div id="buttonDiv">
        <span><input type="button" name="submit" value="Submit" onclick="requiredAllAnswers()"/></span>
        <span><input type="button" name="reset" value="Reset" onclick="resetForm()"/></span>
    </div>
</g:form>
</body>o-
</html>


<script>


    function resetForm() {

        $('form input').val('')

    }


    function requiredAllAnswers() {
        var s = $('#surveyForm input[type=radio]:checked').length
        alert(s)
        %{--if($('form input[type=radio]').size()!=${questionnaire.questions.size()})--}%
        %{--alert("All fields are required");--}%
        $('form').submit()
//        return false

    }







</script>