<!DOCTYPE html>
<html>
<head>
    <title>photos</title>
</head>
<body>
<c:url var="viewUrl" value="/ticket" />
<form action="${viewUrl}" method="get" onsubmit="window.location.reload()">
    <input type="submit" value="Index page" />
</form>

<h2>Photo #${ticketId}: <c:out value="${ticket.subject}"/></h2>

<security:authorize access="isAuthenticated() and (principal.username == '${ticket.customerName}' or hasRole('ADMIN'))">
    [<a href="<c:url value='/ticket/edit/${ticket.id}' />">Edit</a>]
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]
</security:authorize>

<br/><br/>
<c:if test="${!empty ticket.attachments}">
    Photo:
    <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
        <br/>
        <c:if test="${!status.first}"><!--,--> </c:if>
        <img src="<c:url value="/ticket/${ticketId}/attachment/${attachment.id}"/>" alt="cat?" style="width:200px;height:200px;">
        <!--
        <br/>
        <a href="<c:url value="/ticket/${ticketId}/attachment/${attachment.id}" />">
        <c:out value="${attachment.name}"/></a>
        -->
        <br/>

        <security:authorize access="isAuthenticated() and (principal.username == '${ticket.customerName}' or hasRole('ADMIN'))">
        [<a href="<c:url value="/ticket/${ticketId}/delete/${attachment.id}" />">Delete photo</a>]
        [<a href="<c:url value="/ticket/comment/${ticket.id}/${attachment.id}" />">Edit description</a>]
        </security:authorize>
    </c:forEach><br/><br/>
</c:if>

Description:
<c:out value="${ticket.body}"/><br/>
User <i><a href="<c:url value="/ticket/profile/${ticket.customerName}" />"><c:out value="${ticket.customerName}"/></a></i> uploaded the photo.<br/><br/>
<br/><br/><br/>

comments:

<br/><br/><br/>
<a href="<c:url value="/ticket" />">Return to list tickets</a>
</body>
</html>
