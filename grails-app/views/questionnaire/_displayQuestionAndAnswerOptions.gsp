<tr>
    <td>Ques${question.sequenceNumber})</td>
    <td>${question.text}</td>
</tr>


<table>
    <g:radioGroup name="options" values="optionSelected"/>
    <g:each in="${question.options.sort { it.sequenceNumber }}" var="option" status="index">
        <g:if test="${((index + 1) % 2)}">

            <tr>

                <td>${option.sequenceNumber})&nbsp;
            <label for="optionName">${option.name}</label>
            <input type="radio" name="optionName" value="${option.name}"/>&nbsp;
                </td>

        </g:if>

        <g:else>
            <td>${option.sequenceNumber}) &nbsp;
                <label for="optionName">${option.name}</label>
                <g:radio name="optionName" value="${option.name}"/>&nbsp;
            </td>
            </tr>
        </g:else>

    </g:each>

    <g/:radioGroup>

</table>
<tr>
    <label for="comment">Comment</label>
    <g:textField name="comment" maxlength="100"/>
</tr><br><br>
