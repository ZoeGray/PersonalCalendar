<%-- 
    Document   : used to insert events into calendar from current entrypopup page
    Created on : Mar 30, 2018, 9:19:31 AM
    Author     : zoegray1
--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@page errorPage="errorCreate.jsp"--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirect</title>
    </head>
    <body>
        <c:if test="${fn:length(eventTitle)>120}">
            <jsp:forward page = "errorCreate.jsp"></jsp:forward>
        </c:if>
        <c:if test="${fn:length(username)>250}">
            <jsp:forward page = "errorCreate.jsp"></jsp:forward>
        </c:if>
        
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/PersonalManagementDB" 
                           user="root" password="mysql1"/>
        <c:set var="title" value="${param.eventTitle}"/>
        <c:set var="note" value="${param.eventNote}"/>
        <c:set var="deadline" value="${param.eventhour}:${param.eventmin} ${param.meridiem}"/>

        <sql:update dataSource="${snapshot}" var="updater">
            INSERT INTO events VALUES (?,?,?,?,?,?,?);
            <sql:param value="${user}"/>
            <sql:param value="${title}"/>
            <sql:param value="${dayChoice}"/>
            <sql:param value="${monthNow}"/>
            <sql:param value="${yearNow}"/>
            <sql:param value="${note}"/>
            <sql:param value="${deadline}"/>
        </sql:update>
        <jsp:forward page="calendar.jsp"/>
    </body>
</html>
