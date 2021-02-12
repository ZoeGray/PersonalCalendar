<%-- 
    Document   : Framework for about page, indicates information behind project
    Created on : Mar 1, 2018, 2:29:56 PM
    Author     : zoegray1
--%>
<%@page errorPage="errorCreate.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="design.css">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Personal Manager - ABOUT</title>
    </head>
    <body id="index-body">
            <div class="original-frame">

                <div class="title">
                    <h1>About</h1>
                </div>
                <%@ include file="siteheader.html"%>

                <div class="info-block">
                    <h2 id="info-head">About the Website</h2>
                    <p>
                        This website was created by Zoe Gray. It was created to
                        encourage organization in students by providing access
                        to a calendar with the ability to add events. The website
                        was written using the 5 languages learned in Design Tech II.
                        It was designed using HTML and CSS for the framework and
                        styling, Java for computation, JSP for utilizing java, 
                        and SQL databases.
                    </p>
                </div>
            </div>
    </body>
</html>
