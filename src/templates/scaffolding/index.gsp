<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <br/>
    <div class="pageInfo" role="navigation">
        <nav class="span12 ">
            <a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a> |
        <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </nav>
    </div>
    <br/>
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <br/>

    <g:if test="\${flash.message}">
        <div class="message" role="status">\${flash.message}</div>
    </g:if>

    <div class="panel panel-default">
        <div class="datatable"><divrole="grid">
            <div class="datatable-header">
            </div>

            <div class="datatable-scroll">
                <table class="table table-bordered dataTable">
                    <thead>
                    <tr role="row">
                        <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
                        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        props.eachWithIndex { p, i ->
                            if (i < 6) {
                                if (p.isAssociation()) { %>
                        <th class="sorting_asc"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                        <%      } else { %>
                        <g:sortableColumn class="sorting_asc" property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
                        <%  }   }   } %>


                    </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                        <tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                            <%  props.eachWithIndex { p, i ->
                                if (i == 0) { %>
                            <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                            <%      } else if (i < 6) {
                                if (p.type == Boolean || p.type == boolean) { %>
                            <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                            <%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                            <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                            <%          } else { %>
                            <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                            <%  }   }   } %>
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </div>

            <div class="datatable-footer">
                <g:paginate total="\${${propertyName}Count ?: 0}" />
            </div>

        </div>
    </div>
	</body>
</html>
