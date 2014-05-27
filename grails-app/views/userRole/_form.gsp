<%@ page import="com.intelligrape.pmi.UserRole" %>



<div class="form-group ${hasErrors(bean: userRole, field: 'role', 'error')} required">
    <div class="col-sm-2">
	<label for="role control-label">
		<g:message code="userRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:select id="role" name="role.id" from="${com.intelligrape.pmi.Role.list()}" optionKey="id" optionValue="authority" required="" value="${userRole?.role?.id}" class="many-to-one form-control"/>
    </div>
</div>

<div class="form-group ${hasErrors(bean: userRole, field: 'user', 'error')} required">
    <div class="col-sm-2">
	<label for="user control-label">
		<g:message code="userRole.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
        </div>
    <div class="col-sm-10">
	    <g:select id="user" name="user.id" from="${com.intelligrape.pmi.User.list()}" optionKey="id" required="" optionValue="username" value="${userRole?.user?.id}" class="many-to-one form-control"/>
    </div>
</div>

