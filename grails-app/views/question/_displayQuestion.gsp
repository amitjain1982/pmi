<tr>
    <td>Ques${question.sequenceNumber})</td>
    <td>${question.text}</td>
    <td><g:link name="editLink" controller="question" action="edit" params="[id: question.id]"><span name='pencilImage'
                                                                                                     class="icon-pencil"></span></g:link>
    </td>
    <td><g:link name="deleteLink" controller="question" action="delete" params="[id: question.id]"><span
            class="icon-remove3"></span></g:link></td>

</tr>



<tr>
    <td colspan="4">
        <table class="table-condensed">
            <g:each in="${question.options.sort { it.sequenceNumber }}" var="option" status="index">
                <g:if test="${((index + 1) % 2)}">

                    <tr>

                        <td>${option.sequenceNumber})&nbsp;
                    ${option.name}&nbsp;
        (${option.score})</td>

                </g:if>

                <g:else>
                    <td>${option.sequenceNumber}) &nbsp; ${option.name} &nbsp; (${option.score})</td>
                    </tr>
                </g:else>

            </g:each>
        </table>
    </td>
</tr>






