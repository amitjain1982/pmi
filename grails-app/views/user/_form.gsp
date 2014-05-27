<%@ page import="com.intelligrape.pmi.User" %>



<div class="form-group ${hasErrors(bean: user, field: 'username', 'error')} required">


    <div class="col-sm-2">

        <label for="username control-label">
            <g:message code="user.username.label" default="Username"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:textField class="form-control" name="username" required="" value="${user?user.username:username}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'password', 'error')} required">
    <div class="col-sm-2">
        <label for="password control-label">
            <g:message code="user.password.label" default="Password"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:passwordField class="form-control" name="password" required="" value="${user?.password}"/>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-2">
        <label for="confirmPassword control-label">
            Confirm Password
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:passwordField class="form-control" name="confirmPassword" required="" value="${user?.password}"/>
    </div>
</div>


<div class="form-group">
    <div class="col-sm-2">
        <label for="role control-label">
            Role
        </label>
    </div>

    <div class="col-sm-10">
        <g:select class="form-control" name="role" from="${com.intelligrape.pmi.Role.list()}" optionValue="authority" optionKey="id"/>
    </div>
</div>


