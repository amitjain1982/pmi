<%@ page import="com.intelligrape.pmi.User" %>



<div class="form-group ${hasErrors(bean: user, field: 'username', 'error')} required">
    <div class="col-sm-2">
        <label for="username control-label">
            <g:message code="user.username.label" default="Username"/>
            <span class="required-indicator">*</span>
        </label>
    </div>

    <div class="col-sm-10">
        <g:textField class="form-control" name="username" required="" value="${user?.username}"/>
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
        <g:textField class="form-control" name="password" required="" value="${user?.password}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'accountExpired', 'error')} ">
    <div class="col-sm-2">
        <label for="accountExpired control-label">
            <g:message code="user.accountExpired.label" default="Account Expired"/>

        </label>
    </div>

    <div class="col-sm-10">
        <g:checkBox class="styled" name="accountExpired" value="${user?.accountExpired}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'accountLocked', 'error')} ">
    <div class="col-sm-2">
        <label for="accountLocked control-label">
            <g:message code="user.accountLocked.label" default="Account Locked"/>

        </label>
    </div>

    <div class="col-sm-10">
        <g:checkBox class="styled" name="accountLocked" value="${user?.accountLocked}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'enabled', 'error')} ">
    <div class="col-sm-2">
        <label for="enabled control-label">
            <g:message code="user.enabled.label" default="Enabled"/>

        </label>
    </div>

    <div class="col-sm-10">
        <g:checkBox class="styled" name="enabled" value="${user?.enabled}"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: user, field: 'oauthIds', 'error')} ">
    <div class="col-sm-2">
        <label for="oauthIds control-label">
            <g:message code="user.oauthIds.label" default="Oauth Ids"/>

        </label>
    </div>


</div>

<div class="form-group ${hasErrors(bean: user, field: 'passwordExpired', 'error')} ">
    <div class="col-sm-2">
        <label for="passwordExpired control-label">
            <g:message code="user.passwordExpired.label" default="Password Expired"/>

        </label>
    </div>

    <div class="col-sm-10">
        <g:checkBox class="styled" name="passwordExpired" value="${user?.passwordExpired}"/>
    </div>

</div>



