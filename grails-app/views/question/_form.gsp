<%@ page import="com.intelligrape.pmi.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionCO, field: 'sequenceNumber', 'error')} required">
    <label for="sequenceNumber">
        <g:message code="question.sequenceNumber.label" default="Sequence Number"/>
        <span class="required-indicator">*</span>
    </label>
        <g:select from="${1..10}" name="sequenceNumber"/>


</div>

<div class="fieldcontain ${hasErrors(bean: questionCO, field: 'text', 'error')} required">
    <label for="text">
        <g:message code="question.text.label" default="Text"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="text" required="" value="${questionCO?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionCO, field: 'detailedDescription', 'error')} ">
    <label for="detailedDescription">
        <g:message code="question.detailedDescription.label" default="Detailed Description"/>

    </label>
    <g:textField name="detailedDescription" value="${questionCO?.detailedDescription}"/>
</div>


<g:hiddenField name="questionnaire.id" value="${questionnaire.id}"/>


<div class="fieldcontain">
    <label>
        <g:message code="question.options.label" default="Options"/>
        <img name="optionAddImage" class="addOptionImage optionImage"
        src="${resource(dir: 'images', file: 'plusSign.jpeg')}"/>
    </label>


    <div>
        <table id="optionTable" name="options">
            <thead>
            <th>Name</th>
            <th>Score</th>
            <th>Actions</th>
            </thead>
            <tbody>
            <g:each in="${questionCO.optionCOs}" var="optionCO" status="index">
                <tr data-id="${index}">
                    <g:hiddenField name="optionId" value="${optionCO.id?:''}"/>
                    <td class="fieldcontain ${hasErrors(bean: optionCO, field: 'name', 'error')} required">
                        <g:textField name="optionName" value="${optionCO.name}"/>
                    </td>

                    <td class="fieldcontain ${hasErrors(bean: optionCO, field: 'score', 'error')} required">
                        <g:select name="optionScore" from="${0..4}" value="${optionCO.score}"/>
                    </td>

                    <td><img name="optionAddImage" class="addOptionImage optionImage"
                             src="${resource(dir: 'images', file: 'plusSign.jpeg')}"/>
                        <img class="removeOptionImage optionImage"
                             src="${resource(dir: 'images', file: 'minus.jpeg')}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>

    </div>

</div>

<script>


    $('body').on('click', '.removeOptionImage', function removeOption() {
        $(this).parent().parent('tr').remove();
    });


    $('body').on('click', '.addOptionImage', function addOption() {

        var rowId = parseInt($('#optionTable tr:last').data('id'));
        var row = '<tr data-id=' + rowId + ' >' +
                '<td> <input name="optionName"/> </td >' +
                '<td><select name="optionScore" ><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option></select></td>' +
                '<td><img name="optionAddImage" class="addOptionImage optionImage" id="${optionNo}" src="${resource(dir: 'images', file: 'plusSign.jpeg')}"/>' +
                '<img id=' + rowId + ' class="removeOptionImage optionImage"  src="${resource(dir: 'images' ,file: 'minus.jpeg') }" ></td>' +
                '</tr>';
        $('#optionTable').append(row)

    });


</script>