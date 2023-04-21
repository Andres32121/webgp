<!DOCTYPE html>
<html>
<head>
    <title>user</title>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
</head>
<body>
<c:url var="viewUrl" value="/ticket" />
<form action="${viewUrl}" method="get" onsubmit="window.location.reload()">
    <input type="submit" value="Index page" />
</form>
<h2>Create a User</h2>
<form:form method="POST" modelAttribute="ticketUser">
    <form:label path="username">Username</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username"/><br/><br/>

    <form:label path="password">Password</form:label><br/>
    <form:errors path="password" cssClass="error" />
    <form:input type="password" path="password"/><br/><br/>

    <form:label path="confirm_password">Confirm Password</form:label><br/>
    <form:errors path="confirm_password" cssClass="error" />
    <form:input type="password" path="confirm_password" /><br/><br/>

    <form:label path="roles">Roles</form:label><br/>
    <form:errors path="roles" cssClass="error" />
    <form:checkbox path="roles" value="ROLE_USER" checked="checked"/>ROLE_USER
    <security:authorize access="hasRole('ADMIN')">
        <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
    </security:authorize>


    <br/><br/>
    <form:label path="phone">Phone Number</form:label><br/>
    <form:errors path="phone" cssClass="error" />
    <form:input type="text" path="phone" /><br/><br/>

    <form:label path="phone">Email Address</form:label><br/>
    <form:input type="text" path="email_address" /><br/><br/>

    <input type="submit" value="Add User"/>
</form:form>
</body>
</html>