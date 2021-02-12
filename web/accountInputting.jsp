<%-- 
    Document   : checks user info from sign up page before registering it in
the database
    Created on : Feb 27, 2018, 2:19:37 PM
    Author     : zoegray1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Successfully Created Account</title>
    </head>
    <body>
        
        <div class="title">
            <h1>Your Personal Management</h1>
        </div>
        <jsp:include page="siteheader.html"/>
        
        <jsp:useBean id= "secureInfo" scope="session" class= "personalCal.security"/>
        <!--Setting properties in java file to user input-->
        <jsp:setProperty name="secureInfo" property="username" param="username"/>
        <br>
        <jsp:setProperty name="secureInfo" property="password" param="password"/>
        <br>

        <c:if test="${fn:length(username)>255}">
            <jsp:forward page = "errorCreate.jsp"></jsp:forward>
        </c:if>
        
        <jsp:setProperty name="secureInfo" property="testValue" param="username"/>
        <c:set var="usernameFilled" scope="page" value="${secureInfo.getStringUsed()}"/>

        <jsp:setProperty name="secureInfo" property="testValue" param="password"/>
        <c:set var="passwordFilled" scope="page" value="${secureInfo.getStringUsed()}"/>

        <c:out value="${usernameFilled}"/>
        <c:out value="${passwordFilled}"/>

        <c:if test="${(usernameFilled ==false) || (passwordFilled == false)}">
            <c:set var="errorMessage" scope = "session" value = "Please input a value for both username and password"/>
            <jsp:forward page = "errorCreate.jsp"></jsp:forward>
        </c:if>

        <jsp:setProperty name="secureInfo" property="usernameAttempt" param="username"/>
        <c:set var="existingUsername" scope="page" value="${secureInfo.isInUse()}"/> 

        <c:if test="${(existingUsername == true)}">
            <c:set var="errorMessage" scope = "session" value = "That username has been taken. Please input another username"/>
            <jsp:forward page = "errorCreate.jsp"></jsp:forward>
        </c:if>

        <jsp:getProperty name="secureInfo" property="newAccount"/>

        <jsp:forward page = "index.jsp"></jsp:forward>
    </body>
</html>
