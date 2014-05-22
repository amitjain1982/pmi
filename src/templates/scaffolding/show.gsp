<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div>
            <br/>
            <div class="pageInfo" role="navigation">
                <nav class="span12 ">
                    <a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a> |
                    <g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link> |
                    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link> |
                </nav>
            </div>
            <br/>
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <br/>
			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">

                            <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<g:if test="\${${propertyName}?.${p.name}}">
                    <tr>
                    <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                    <td>
					<%  if (p.isEnum()) { %>
                        <g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
					<%  } else if (p.oneToMany || p.manyToMany) { %>
						<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
						  <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link>
						</g:each>
					<%  } else if (p.manyToOne || p.oneToOne) { %>
						 <g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
					<%  } else if (p.type == Boolean || p.type == boolean) { %>
						<g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
					<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<g:formatDate date="\${${propertyName}?.${p.name}}" />
					<%  } else if (!p.type.isArray()) { %>
						<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
					<%  } %>
                    </td>
                    </tr>
				</g:if>
			<%  } %>
                 </table>
                </div>
                <div class="form-actions text-right">
                    <g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
                            <g:link class="edit btn btn-primary" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
			</div>

		</div>
       </div>
	</body>
</html>
