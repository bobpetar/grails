
<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div role="main" class="main">

		<section class="page-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb">
							<li><a class="home" href="\${createLink(uri: '/')}"><g:message
										code="default.home.label" /></a></li>
							<li><g:message code="default.list.label" args="[entityName]" /></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h1>
							<g:message code="default.list.label" args="[entityName]" />
						</h1>
					</div>
				</div>
			</div>
		</section>

		<div class="container">
			<div class="alert alert-info">Change Text</div>

			<div class="panel-body">
				<div class="table-responsive">
					<g:if test="\${flash.message}">
						<div class="message" role="status">\${flash.message}</div>
					</g:if>
					<table
						class="table table-bordered table-striped table-condensed mb-none">
						<thead>
							<tr>
								<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p, i ->
							if (i < 6) {
								if (p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
					<%      } else { %>
						<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
					<%  }   }   } %>
							</tr>
						</thead>
						<tbody>
							<g:each in="\${${propertyName}List}" status="i"
								var="${propertyName}">
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
					<ul class="pagination">
						<retouch:paginate total="\${${propertyName}Count ?: 0}" />
					</ul>

				</div>
			</div>
			</section>
		</div>
	</div>
</body>
</html>
