<%-- 
    Document   : Hidden page between left and right month change requests,
changes variable in java page that gets used when forwarded back
    Created on : Mar 31, 2018, 6:48:01 PM
    Author     : zoegray1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="errorCreate.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>...</title>
    </head>
    <body>
        <h1> </h1>
        <% request.getSession().setAttribute("monthChange", request.getParameter("diffMonth"));%>
        ${calendarInfo.setModifyMonth(Integer.parseInt(monthChange))}

        <!-- calendarInfo is scope session -->
        <jsp:forward page="calendar.jsp"/>
    </body>
</html>
