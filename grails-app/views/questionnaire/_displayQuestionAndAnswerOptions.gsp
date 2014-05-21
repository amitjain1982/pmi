

<tr>
    <td colspan="2">

        <table>
            <g:hiddenField name="answerCOs[${index}].question.id" value="${question.id}"/>
            <tr>
                <td colspan="2">Q${question.sequenceNumber}) ${question.text}</td>
            </tr>
            <g:each in="${question.options.sort { it.sequenceNumber }}" var="option" status="idx">
                <g:if test="${idx % 2 == 0}">
                    <tr>
                        <td>${option.sequenceNumber})&nbsp;
                    <input type="radio" name="answerCOs[${index}].optionSelected.id" value="${option.id}"/>&nbsp;
                    <label for="answerCOs[${index}].optionSelected">${option.name}</label>
                </td>
                </g:if>
                <g:else>
                    <td>${option.sequenceNumber}) &nbsp;
                    <g:radio name="answerCOs[${index}].optionSelected.id" value="${option.id}"/>&nbsp;
                        <label for="answerCOs[${index}].optionSelected">${option.name}</label>
                    </td>
                   </tr>
                </g:else>

            </g:each>

            <tr>
                <td colspan="2">
                    <label for="answerCOs[${index}].comment">Comment</label>
                    <g:textField name="answerCOs[${index}].comment" maxlength="100"/>
                </td>
            </tr>

        </table>
    </td>
</tr>
