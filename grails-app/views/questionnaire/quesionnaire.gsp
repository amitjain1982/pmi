<%@ page import="com.intelligrape.pmi.Project" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Project Maturity Index Survey</title>
    <meta name="layout" content="main">
    <r:require module="londinium"/>
    <r:layoutResources/>
</head>

<body>
<h2 style="text-align: center">Project Maturity Index Survey</h2>

<h2 style="text-align: center">${questionnaire.title}</h2>

<div id="errorDiv">

</div>


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
    <g:textField name="comment" class="form-control" maxlength="256"/>

    <br>
    <g:hiddenField name="status" value="${com.intelligrape.pmi.enums.AnswerSheetStatus.COMPELETED}"/>

    <br>

    <div id="buttonDiv">
        <span><input type="submit" class="btn btn-primary" name="submit" value="Submit" onclick="return requiredAllAnswers()"/></span>
        <span><input type="button" class="btn btn-success" name="reset" value="Reset" onclick="resetForm()"/></span>
    </div>
</g:form>
<r:layoutResources/>

<script>


    $(document).ready()
    {
        resetForm()
    }


    function resetForm() {
        $('input[type=text]').val('');
        $('input[type=radio]').prop("checked", false);
    }


    function requiredAllAnswers() {
        var noOfQuestionsAnswered = $('input[type=radio]:checked').length;
        if (noOfQuestionsAnswered !=${questionnaire.questions.size()}) {
            alert("Please answer all the questions");
            return false
        }
        else
            return true
    }


</script>
</body>
</html>

