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
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
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

                <input type="button" value="Add Student" 
                       onclick="window.location.href = 'views/add-student-form.jsp'; return false;"
                       class="add-student-button"/>

                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                    <%--<c:forEach var="tempStudent" items="<%= theStudents %>">--%>
                    <c:forEach var="tempStudent" items="${STUDENT_LIST}">

                        <!--set up link for each student-->
                        <c:url var="tempLink" value="StudentControllerServlet">
                            <c:param name="command" value="LOAD"/>
                            <c:param name="studentId" value="${tempStudent.id}" />
                        </c:url>

                        <!--set up link for delete-->
                        <c:url var="deleteLink" value="StudentControllerServlet">
                            <c:param name="command" value="DELETE"/>
                            <c:param name="studentId" value="${tempStudent.id}" />
                        </c:url>

                        <tr>
                            <td>${tempStudent.firstName}</td>
                            <td>${tempStudent.lastName}</td>
                            <td>${tempStudent.email}</td>
                            <td>
                                <a href="${tempLink}">Update</a>
                                |
                                <a href="${deleteLink}" 
                                   onclick="if (!(confirm('Are you sure?'))) return false" >Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
