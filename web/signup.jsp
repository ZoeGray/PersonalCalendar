<%-- 
    Document   : Framework for signup form, sends to accountInputting
    Created on : Feb 27, 2018, 10:54:17 AM
    Author     : zoegray1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Personal Manager - SIGN UP</title>
    </head>
    <body id="index-body">
        <div class="original-frame">
            <div class="title">
                <h1>Your Personal Manager</h1>
            </div>
            <%@ include file="siteheader.html"%>
            <%@ include file="loginbar.html"%>
            <%@ include file="signupbar.html"%>
            <div class="login-info">
                <h2>Enter username and password</h2>
                <form action="accountInputting.jsp" method="post">
                    Username: <br>
                    <input type="text" name="username" id="username" required>
                    <br>
                    Password: <br>
                    <input type="password" name="password" required>
                    <br>
                    <input type="submit" value="Create" id="small-login-button">
                </form>
            </div>
            </div>

        <!--<div class="loghead">
            <div class="loginfo">
                <h2>Create New Account</h2>
                <form action="accountInputting.jsp">
                    Username: 
                    <input type="text" name="username">
                    <br>
                    Password:
                    <input type="password" name="password">
                    <br>
                    <input type="submit" value="Create" id="smalllogbutton">
                </form>
                
            </div>
        </div>-->
    </body>
</html>
