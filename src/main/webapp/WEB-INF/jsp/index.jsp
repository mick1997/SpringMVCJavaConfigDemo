<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.List" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Title</title>
        </head>

        <body>
            <h1> This is the first form</h1>

            <form action="processForm">
                <input type="text" name="empName" placeholder="please enter the name">
                <button type="submit">Send</button>
            </form>

            <ol>
                <c:forEach items="${empNames}" var="empName">
                    <li><c:out value="${empName}"/></li>
                </c:forEach>
            </ol>
        </body>

        </html>