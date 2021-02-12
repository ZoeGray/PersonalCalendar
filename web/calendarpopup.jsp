<%-- 
    Document   : fake popup page designed to act like a popup in order to pass
variable of the day clicked, user inputs events to inserted into database
for each day
    Created on : Apr 26, 2018, 11:13:37 AM
    Author     : zoegray1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorCreate.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="design.css">
        <link rel="shortcut icon" href="calicon.png"/>
        <title>Personal Manager - CALENDAR</title>
    </head>
    <body>
        <%@ include file="calendar.jsp"%> 

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/PersonalManagementDB"
                           user="root" password="mysql1"/>
        
        <div class="overlay">
<% request.getSession().setAttribute("dayChoice", request.getParameter("currentDay"));%>
            <div class="popup">
                
                
                <c:if test="${empty dayChoice}">
                    <!-- Set error messages and popup error that redirects to index when OK is pressed -->
                    <c:set var="errorMessage" value="Session timed out. Please log in and try again."/>
                    <c:redirect url="calendar.jsp"/>
            </c:if>
                <%--<c:if test="${empty user}">
                    <c:set var="errorMessage" value="Session timed out. Please log in and try again."/>
                    <%--<jsp:forward page="index.jsp"/>
                </c:if> --%>
                <%--<c:out value="${dayChoice}"/>--%>
                <%--<c:set var = "dayChoice" value = "${calendarInfo.calendar[index]}" />--%>
                <%-- request.getSession().setAttribute("dayChoice", request.getParameter("currentDay")    );--%>
                <div id="event-left">
                    <h1 id="event-header">
                        <c:out value="${monthNow}"/>
                        <c:out value="${dayChoice}"/>,
                        <c:out value="${yearNow}"/>
                    </h1>
                    <div class="events">
                        <div class="event-info">
                            <sql:query dataSource="${snapshot}" var="result">
                                SELECT * FROM events WHERE username=? AND dayEvent=? AND monthEvent=? AND yearEvent=?;
                                <sql:param value="${user}"/>
                                <sql:param value="${dayChoice}"/>
                                <sql:param value="${monthNow}"/>
                                <sql:param value="${yearNow}"/>
                            </sql:query>

                            <%--<table id="resulttable">
                                <tr>
                                    <th class="reshead">Title</th>
                                    <th class="reshead">Note</th>
                                    <th class="reshead">Deadline</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}">
                                    <tr>
                                        <td class="resblock"><c:out value="${row.eventTitle}"/></td>
                                        <td class="resblock"><c:out value="${row.note}"/></td>
                                        <td class="resblock"><c:out value="${row.deadline}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>--%>

                            <c:forEach var="row" items="${result.rows}">
                                <div class='result-info'>
                                    <table id="result-table">
                                        <tr>
                                            <th class="result-head"><c:out value="${row.eventTitle}"/></th>
                                        </tr>
                                        <tr>
                                            <td class="result-block"><c:out value="${row.note}"/></td>
                                        </tr>
                                        <tr>
                                            <td class="result-block"><c:out value="${row.deadline}"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div id ="event-right">
                    <div class="event-form">
                        <a class="close" href="calendar.jsp">&times;</a>          

                        <h1 id="event-title">Create New Event</h1>
                        <form action="insertevents.jsp" method="post">
                            Title: <br>
                            <input id="note-area" type="text" name="eventTitle" size="30" maxlength="120" required/>
                            <br>
                            Note: <br>
                            <textarea id="note-area"name="eventNote"rows="4" maxlength="250"></textarea>
                            <br>
                            Time: <br> <select name="eventhour">
                                <c:forEach var="hour" begin="1" end="12">
                                    <option>${hour}</option>
                                </c:forEach>
                            </select>
                            :
                            <select name="eventmin">
                                <c:forEach var="min" begin="00" end="59">
                                    <c:choose>
                                        <c:when test="${min<10}">
                                            <option>0${min}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option>${min}</option>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </select>

                            <select name="meridiem">
                                <option>AM</option>
                                <option>PM</option>
                            </select>
                            <br>
                            <input value="Create" type="submit" id="event-button"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
