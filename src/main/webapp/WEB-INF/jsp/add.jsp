<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<c:url var="viewUrl" value="/ticket" />
<form action="${viewUrl}" method="get" onsubmit="window.location.reload()">
    <input type="submit" value="Index page" />
</form>

<h2>Uploaded new photo</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="ticketForm">
    <b>Photo</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>

    <form:label path="body">Description</form:label><br/>
    <form:textarea path="body" rows="5" cols="30"/><br/><br/>

    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
