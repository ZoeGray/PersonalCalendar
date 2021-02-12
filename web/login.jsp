<%-- 
    Document   : Framework for form to login: asks for username and password, 
goes to different page to confirm. Login and header included
    Created on : Feb 27, 2018, 11:02:59 AM
    Author     : zoegray1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="design.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Personal Manager - LOGIN</title>
    </head>
    <body id="index-body">
        <div class="original-frame">
            <div class="title">
                <h1>Your Personal Manager</h1>
            </div>
            <%@ include file="siteheader.html"%>
            <%@ include file="loginbar.html"%>
            <div class="login-info">
                <h2>Enter username and password</h2>
                <form action="infoprocess.jsp" method ="post">
                    Username: <br>
                    <input class ="loginform" type="text" name="username" id="username" required>
                    <br>
                    Password: <br>
                    <input class ="loginform" type="password" name="password" required>
                    <br>
                    <input type="submit" value="Login" id="small-login-button"/>
                </form>
                </div>
            <%@ include file="signupbar.html"%>
        </div>
        
        <!--<div class="loghead">
            <div class="loginfo">
                <h2>Enter username and password:</h2>
                <form action="infoprocess.jsp" method ="post">
                    Username: <input class ="loginform" type="text" name="username" required>
                    <br>
                    Password: <input class ="loginform" type="password" name="password" required>
                    <br>
                    <input type="submit" value="Login" id="smalllogbutton"/>
                </form>
            </div>
        </div>-->
        
    </body>
</html>
