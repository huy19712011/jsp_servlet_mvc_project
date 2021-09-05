<%-- 
    Document   : list-students
    Created on : Sep 5, 2021, 7:31:37 AM
    Author     : huynq
--%>

<%@page import="models.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student list</title>
    </head>
    <%
        // get students from request obj
        List<Student> theStudents
                = (List<Student>) request.getAttribute("STUDENT_LIST");

    %>

    <body>
        <div id="wrapper">
            <div id="header">
                <h2>BK Academy</h2>
            </div>
        </div>
        <div id="container">
            <div id="content">
                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                    </tr>
                    <%--<c:forEach var="tempStudent" items="<%= theStudents %>">--%>
                    <c:forEach var="tempStudent" items="${STUDENT_LIST}">
                        <tr>
                            <td>${tempStudent.firstName}</td>
                            <td>${tempStudent.lastName}</td>
                            <td>${tempStudent.email}</td>
                        </tr>
                    </c:forEach>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
