<%-- 
    Document   : unused - old page to redirect to calendar after login
    Created on : Feb 21, 2018, 1:17:57 PM
    Author     : zoegray1
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page errorPage="errorCreate.jsp"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="design.css">
        <title>Your Calendar</title>
    </head>
    <body>
        <div class="title">
            <h1>Calendar</h1>
        </div>
        <%@ include file="siteheader.html"%>
        <%@ include file="loginbar.html"%>
    </body>
</html>
