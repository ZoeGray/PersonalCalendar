<%--
    Document   : Framework for first page user sees, shows options available for
navigation
    Created on : Feb 21, 2018, 1:17:13 PM
    Author     : zoegray1
--%>
<%-- --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="design.css">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Personal Manager - HOME</title>
    </head>
    <body id="index-body">
        <!-- Object calendarInfo -->
        <jsp:useBean id= "calendarInfo" scope ="session" class= "personalCal.calendarData"/>
        <div class="original-frame">
            <div class="title">
                <h1>Your Personal Manager</h1>
            </div>

            <%@ include file="siteheader.html"%>
            <div id="index-info">
                <p>Our personal management system is designed to give each user
                    a personalized way to stay organized. Each user gets their
                    own dashboard. Within the dashboard are many tools the user
                    need to stay on top of their events and deadlines.</p>
                <p>Log in or Sign up to get started.</p>
            </div>
            <%@ include file="loginbar.html"%>
            <%@ include file="signupbar.html"%>
        </div>
    </body>
</html>
