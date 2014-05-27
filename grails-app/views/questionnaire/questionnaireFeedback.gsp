<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 23/5/14
  Time: 12:58 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Project Maturity Index Feedback</title>
    <meta name="layout" content="main">
</head>

<body>

<h3 style="text-align: center">Project Maturity Index Feedback</h3>

<h4 class="h4" style="color:darkblue;font-family: arial, helvetica, verdana, sans-serif">Project Maturity Index for ${answerSheet.project.name} project is ${answerSheet.totalScore}</h4>
<table class="table-condensed">
    <tbody>

    <g:each in="${answerSheet.answers.sort { it.question.sequenceNumber }}" var="answer">
        <tr>
            <td>Q${answer.question.sequenceNumber})</td>
            <td colspan="3">
            ${answer.question.text}
        </td>
        </tr>
        <tr>

            <td></td>
            <g:each in="${answer.question.options}" var="option">
                <g:if test="${option == answer.optionSelected}">
                    <td>
                        <label class="label label-block label-info text-center">${option.name}</label>
                    </td>
                </g:if>
                <g:else>
                    <td>
                        <span>${option.name}</span>
                    </td>
                </g:else>
            </g:each>
        </tr>

    </g:each>
    </tbody>
</table>



</body>
</html>