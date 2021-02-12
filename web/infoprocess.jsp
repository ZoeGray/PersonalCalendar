<%-- 
    Document   : tests users login entries, communicates with java pages
    Created on : Mar 3, 2018, 12:57:59 PM
    Author     : zoegray1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="personalCal.LoginDao"%>
        <jsp:useBean id="obj" class="personalCal.LoginBean"/>
        <jsp:setProperty property="*" name ="obj"/>

        <%--<c:set var="status" scope="session" value="${LoginDao.validate(obj)}"/>--%>

        <% 
            boolean status = LoginDao.validate(obj);
            pageContext.setAttribute("status", status, pageContext.SESSION_SCOPE);
        %>

        <c:choose>


            <c:when test="${status}">
                <c:set var="user" scope="session" value="${param.username}"/>
                <jsp:forward page="calendar.jsp"></jsp:forward>
            </c:when>

            <c:otherwise>
                <c:set var="errorMessage" scope="session" value="Incorrect username or password. Please resubmit or create a new account."/>
                <jsp:forward page="errorCreate.jsp"></jsp:forward>
            </c:otherwise>
        </c:choose>
    </body>
</html>