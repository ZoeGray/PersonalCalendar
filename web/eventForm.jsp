<%-- 
    Document   : unused - old prototype for updating events option
    Created on : Feb 21, 2018, 1:23:36 PM
    Author     : zoegray1
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create a new event</h1>
        <form action="dbUpdate.jsp" method=post">
            Event Name: 
            <input id="eventName" type="text" name="eventName">

            Date:
            Month:
            <input id="month" type="button" name="month">
            Day:
            <input id="code" type="button" name="code">
            Year:
            <input id="code" type="text" name="code">

            <input value="update" type="submit">
        </form>
    </body>
</html>
