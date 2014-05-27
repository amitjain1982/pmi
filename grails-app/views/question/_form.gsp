<%@ page import="com.intelligrape.pmi.Question" %>
<g:hiddenField name="questionnaire.id" value="${questionnaire?.id}"/>
<g:hiddenField name="format" value=""/>
<div class="form-group ${hasErrors(bean: questionCO, field: 'questionnaire', 'error')} required">
    <div class="col-sm-2">
        <label for="questionnaire control-label">
            <g:message code="questionCO.questionnaire.label" default="Questionnaire"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        ${questionnaire.title}
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionCO, field: 'sequenceNumber', 'error')} required">
    <div class="col-sm-2">
        <label for="sequenceNumber control-label">
            <g:message code="questionCO.sequenceNumber.label" default="Sequence Number"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:select from="${1..10}" class="form-control" name="sequenceNumber"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionCO, field: 'text', 'error')} required">
    <div class="col-sm-2">
        <label for="text control-label">
            <g:message code="questionCO.text.label" default="Text"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:textField class="form-control" name="text" required="" value="${questionCO?.text}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionCO, field: 'detailedDescription', 'error')} ">
    <div class="col-sm-2">
        <label for="detailedDescription control-label">
            <g:message code="questionCO.detailedDescription.label" default="Detailed Description"/>

        </label>
    </div>

    <div class="col-sm-10">
        <g:textField class="form-control" name="detailedDescription" value="${questionCO?.detailedDescription}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: questionCO, field: 'options', 'error')} ">
    <div class="col-sm-2">
        <label for="options control-label">
            <g:message code="questionCO.options.label" default="Options"/>

        </label>
    </div>

    <div class="col-sm-10">

        <div id="optionTable" name="options">
            <div class="row">
                <div class="col-sm-6">
                    <label name="name" class="text-semibold">Name</label>
                </div>

                <div class="col-sm-2">
                    <label name="score" class="text-semibold">Score</label>
                </div>

                <div class="col-sm-2">
                    <label name="actions" class="text-semibold">Actions</label>
                </div>
            </div>
            <g:each in="${questionCO.optionCOs}" var="optionCO" status="index">
                <div class="row" id="${index}">
                    <g:hiddenField name="optionId" value="${optionCO?.id ?: ''}"/>
                    <div class="col-sm-6 fieldcontain ${hasErrors(bean: optionCO, field: 'name', 'error')} required">
                        <g:textField class="form-control " name="optionName" value="${optionCO?.name}"/>
                    </div>

                    <div class="col-sm-2 fieldcontain ${hasErrors(bean: optionCO, field: 'score', 'error')} required">
                        <g:select name="optionScore" class="form-control" from="${0..4}" value="${optionCO?.score}"/>
                    </div>


                    <div col-sm-2><span class="icon-plus addOptionImage"  name="optionAddImage"> </span>
                        <span class="icon-minus removeOptionImage" name="optionRemoveImage"> </span>
                    </div>

                </div>
            </g:each>






        </div>
    </div>
</div>
<script>

    $('body').on('click', '.removeOptionImage', function removeOption() {

        if ($('div.row').length == 3)
            alert('Question cannot have less than two options')

        else
            $(this).parent().parent('.row').remove();
    });


    $('body').on('click', '.addOptionImage', function addOption() {


        var rowId=$('div.row').length;

        var row = '<div class="row" id='+rowId+'>' +
                '<div class="col-sm-6 fieldcontain ${hasErrors(bean: optionCO, field: 'name', 'error')} required">' +
                '<g:textField class="form-control " name="optionName" value="${optionCO?.name}"/>' +
                '</div>' +

                '<div class="col-sm-2 fieldcontain ${hasErrors(bean: optionCO, field: 'score', 'error')} required">' +
                ' <select name="optionScore" class="form-control" >' +
                '<option value="0" >0</option>'+
                '<option value="1" >1</option>'+
                '<option value="2" >2</option>'+
                '<option value="3" >3</option>'+
                '<option value="4" >4</option>'+
                '</select>'+
                '</div>' +


                '<div col-sm-2><span class="icon-plus addOptionImage" name="optionAddImage"> </span>' +
                '<span class="icon-minus removeOptionImage" name="optionRemoveImage"> </span>' +
                '</div>' +

                '</div>';


        $('#optionTable').append(row)

    });


</script>



