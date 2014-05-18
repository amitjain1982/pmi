<%@ page import="com.intelligrape.pmi.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'sequenceNumber', 'error')} required">
    <label for="sequenceNumber">
        <g:message code="question.sequenceNumber.label" default="Sequence Number"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="sequenceNumber" required="" value="${questionInstance?.sequenceNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'text', 'error')} required">
    <label for="text">
        <g:message code="question.text.label" default="Text"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="text" required="" value="${questionInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'detailedDescription', 'error')} ">
    <label for="detailedDescription">
        <g:message code="question.detailedDescription.label" default="Detailed Description"/>

    </label>
    <g:textField name="detailedDescription" value="${questionInstance?.detailedDescription}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionnaire', 'error')} required">
    <label for="questionnaire">
        <g:message code="question.questionnaire.label" default="Questionnaire"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="questionnaire" name="questionnaire.id" from="${com.intelligrape.pmi.Questionnaire.list()}"
              optionKey="id" optionValue="title" required="" value="${questionInstance?.questionnaire?.id}"
              class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'options', 'error')} ">
    <label for="options">
        <g:message code="question.options.label" default="Options"/>

    </label>


    <div id="addOptionDiv">
        <g:form name="addOptionForm" >
            <table id="optionTable" name="options">

                <th>Name</th>
                <th>Score</th>
                </thead>
                <tbody>
            <g:each in="${0..1}" var="optionNo">
                <tr name='options[${optionNo}]' id="${optionNo}">

                    <div class="fieldcontain ${hasErrors(bean: optionInstanceList[${optionNo}], field: 'name', 'error')} required">
                        <td><g:textField name="name"/></td>
                    </div>

                    <div class="fieldcontain ${hasErrors(bean: optionInstanceList[${optionNo}], field: 'name', 'error')} required">
                        <td><g:textField name="score"/></td>
                    </div>
                    <g:hiddenField name="question" value="${questionInstance}"/>


                    <td><img name="optionSaveButton" class="saveOptionImage optionImage"
                             id="${optionNo}" src="${resource(dir: 'images', file: 'plusSign.jpeg')}"/></td>
                    <td><img class="removeOptionImage optionImage" id="${optionNo}"
                             src="${resource(dir: 'images', file: 'minus.jpeg')}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>


            <a href="#" onclick="addOption()">Add Option</a>

        </g:form>
    </div>

</div>

<script>
    function addOption() {
        var rowId = parseInt($('#optionTable tr:last').attr('id')) + 1;
        var row = '<tr id=' + rowId + '>' +
                '<td><g:textField name="name"/> </td >' +
                '<td><g:textField name="score"/> </td>' +
                '<td><img id=' + rowId + ' class="removeOptionImage optionImage"  src="${resource(dir: 'images' ,file: 'minus.jpeg') }" ></td>' +
                '</tr>';
        $('#optionTable').append(row)
    }

    $('#addOptionDiv').on('click', '.removeOptionImage', function removeOption() {
        var rowId = $(this).attr('id');
        $('#' + rowId).remove()
    })


    $('#addOptionDiv').on('click', '.saveOptionImage', function saveOption() {
        var rowId = $(this).attr('id');
        var score = $('tr#' + rowId + ' input[name=score]').val();
        var name = $('tr#' + rowId + ' input[name=name]').val();
        var question = $('tr#' + rowId + ' input[name=question]').val();
        alert(rowId + " " + name + " " + score)

        %{--$('tr #' + rowId).load('${g.createLink(controller: 'option', action: 'saveAndRedirectToQuestion')}', data, function () {--}%
        %{--alert("Load was performed.")--}%
        %{--});--}%


        $.ajax({


            url: '/pmi/option/saveAndRedirectToQuestion',
            type: 'get',
            data: {optionNo: rowId, name: name, score: score, question: question},
            success: function () {
                alert('success')
            },
            failure: function () {
                alert('failure')
            }
        })


    });



</script>