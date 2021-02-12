<%-- 
    Document   : calendar
    Created on : Feb 21, 2018, 1:21:13 PM
    Author     : zoegray1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="errorCreate.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="design.css">
        <link rel="shortcut icon" href="calicon.png">
        <title>Personal Manager - CALENDAR</title>
    </head>
    <body>
        <div class="title">
            <h1><c:out value="${user}"/> Calendar</h1>
        </div>
        <%@ include file="siteheader.html"%>



        <%--<jsp:setProperty name="calendarInfo" property="month" param="${monthNow}"/>
        <jsp:setProperty name="calendarInfo" property="year" param="${yearNow}"/>--%>
        <!-- Display everything here-->
        <div id="table-space">
            <a href="monthchange.jsp?diffMonth=-1">
                <img src="arrowleft.png" alt="<<" id="arrow-left"/>
            </a>

            <a href="monthchange.jsp?diffMonth=1">
                <img src="arrowright.png" alt=">>" id="arrow-right"/>
            </a>

            <c:set var="monthNow" scope="session" value="${calendarInfo.getMonth()}"/>
            <c:set var="yearNow" scope="session" value="${calendarInfo.getYear()}"/> 

            <c:set var="calInfo" scope="session" value="${calendarInfo.getCalInfo()}"/>
            <c:set var="calendar" scope="session" value="${calendarInfo.getCalendar()}"/>

            <h1 id="month">
                <c:out value="${monthNow}"/>
                <c:out value="${yearNow}"/>
            </h1>


            <table id="big-table"> <!-- Put in css file later-->
                <tbody> <!-- Ask what this is -->
                    <!-- add div in each column with popup ahref and calendar events,
                    in css document make div block rigid no scroll
                    when clicked open popup -->
                    <tr class="table-title">
                        <th class="calendar-head">Sunday</th>
                        <th class="calendar-head">Monday</th>
                        <th class="calendar-head">Tuesday</th>
                        <th class="calendar-head">Wednesday</th>
                        <th class="calendar-head">Thursday</th>
                        <th class="calendar-head">Friday</th>
                        <th class="calendar-head">Saturday</th>
                    </tr>
                    <tr>
                        <c:forEach begin="0" end="${fn:length(calendarInfo.calendar)-1}" var="index"> <!-- loops weeks-->
                            <td id="calendar-block">
                                <a href="calendarpopup.jsp?currentDay=${calendarInfo.calendar[index]}">${calendarInfo.calendar[index]}</a>
                                <%--<c:set var="dayChoice" scope="session" property="${param.currentDay}"/>--%>
                            </td>
                            <c:if test="${index%7==6}">
                            </tr><tr>
                            </c:if>
                        </c:forEach>
                    </tr>
                </tbody>
            </table>
        </div>

        <!--
        <%--

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/PersonalManagementDB"
                           user="root" password="mysql1"/>

        <div id="entry-popup" class="overlay">
            <c:out value = "${param.currentDay}" />
            <c:set var="dayChoice" scope="session" property="${param.currentDay}"/>

            <div class="popup">
        <%--<c:if test="${empty dayChoice}">
            <!-- Set error messages and popup error that redirects to index when OK is pressed -->
            <c:set var="errorMessage" value="Session timed out. Please log in and try again."/>
        <%--<jsp:forward page="index.jsp"/>
    </c:if>
        --%>
        <%--
            <c:if test="${empty user}">
                <c:set var="errorMessage" value="Session timed out. Please log in and try again."/>
        <%--<jsp:forward page="index.jsp"/>--%>
        <%--
            </c:if>
           <c:out value="${dayChoice}"/>
        <%--<c:set var = "dayChoice" value = "${calendarInfo.calendar[index]}" />--%>
        <%-- request.getSession().setAttribute("dayChoice", request.getParameter("currentDay")    );--%>
        <div id="event-left">

            <h1 id="event-header">
        <%--
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
        <%--
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
                                <h1 id="event-title">Create New Event</h1>
                                <form action="insertevents.jsp">
                                    Title: <br>
                                    <input id="note-area" type="text" name="eventTitle" size="30" maxlength="20" required/>
                                    <br>
                                    Note: <br>
                                    <textarea id="note-area"name="eventNote"rows="4" maxlength="120"></textarea>
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
        --%>
        -->
    </body>
</html>
