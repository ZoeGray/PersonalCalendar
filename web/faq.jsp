<%-- 
    Document   : Framework for frequently asked questions page, used as help
page
    Created on : Mar 1, 2018, 2:31:24 PM
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
        <title>Personal Manager - FAQ</title>
    </head>
    <body id="index-body">
            <div class="original-frame">

                <div class="title">
                    <h1 >Frequently Asked Questions</h1>
                </div>
                <%@ include file="siteheader.html"%>
                <div class="info-block">
                    <h2 id="info-head">What can I do within this website?</h2>
                    <p>
                        This website includes a dynamic calendar in which events
                        can be added to. The user can create an account, log in,
                        flip between months, and add events to meaningful dates.
                    </p>
                </div>
                <div class="info-block">
                    <h2 id="info-head">How do I log out?</h2>
                    <p>
                        Proof of login is needed every time to access your calendar,
                        meaning log out is immediate once the website has been
                        closed, or another webpage has been accessed in the same
                        tab. If you are logged out, simply log back in to resume
                        control.
                    </p>
                </div>
                <div class="info-block">
                    <h2 id="info-head">Where do I start?</h2>
                    <p>
                        Navigate to the home page. You will either need to log 
                        in with an existing account or register an account 
                        using the 'Sign Up' button. Once you log in, you will 
                        redirect to the personal management page and have full 
                        access to your calendar. Now organization is in your control.
                    </p>
                </div>
            </div>
    </body>
</html>
