<%--
    Document   : error page found on all user available webpages
    Created on : Mar 21, 2018, 7:56:26 PM
    Author     : zoegray1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Error</title>
    </head>
    <body>
        <h3>Error</h3>
        <p>An error has occurred. Please refresh the page.</p>
        <p>Errors could include:</p>
        <ul>
            <li>Faster request than response speed</li>
            <li>Incorrect username</li>
            <li>Incorrect password</li>
            <li>Username has been taken by a previous user</li>
        </ul>
        <p>If problem persists, close and reopen the tab.</p>
    <c:out value="${errorMessage}"/>
    <form action="index.jsp">
        <input type="submit" value="Refresh" />
    </form>
</body>
</html>
