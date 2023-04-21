<!DOCTYPE html>
<html>
<head>
  <title>photos</title>
</head>
<body>

<security:authorize access="isAuthenticated()" >
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</security:authorize>

<security:authorize access="!isAuthenticated()">
  <c:url var="login" value="/login"/>
<form action="${login}" method="get">
  <input type="submit" value="Login" />
</form>
  <c:url var="create" value="/user/create"/>
  <form action="${create}" method="get">
    <input type="submit" value="Create account" />
  </form>
</security:authorize>

<h2>Photos</h2>

<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
</security:authorize>

<security:authorize access="hasAnyRole('USER','ADMIN')">
<a href="<c:url value="/ticket/create" />">Upload new photo</a><br/><br/>
</security:authorize>
<c:choose>
  <c:when test="${fn:length(ticketDatabase) == 0}">
    <i>There are no tickets in the system.</i>
  </c:when>
  <c:otherwise>
    <c:forEach items="${ticketDatabase}" var="entry">
      <c:forEach items="${entry.attachments}" var="attachment" varStatus="status">
        <a href="<c:url value="/ticket/view/${entry.id}" />">
          <img src="<c:url value="/ticket/${entry.id}/attachment/${attachment.id}"/>" alt="${entry.subject}" style="width:200px;height:200px;">
        </a>
      </c:forEach>

    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
