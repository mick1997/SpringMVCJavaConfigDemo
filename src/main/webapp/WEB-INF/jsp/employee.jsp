<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="dj" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        .error {
            color:red;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css" />
    <title>Frontend Bootcamp</title>
</head>
<body>
<!-- Navbar -->
<section class="mb-5"> <%@include file="include/nav.jsp" %> </section>

<section id="main" class="mt-5 container p-5">

    <h1>Employee Information Portal</h1>
    <dj:form action="/employees/addemployee" methood="POST">
        <div class="mb-3">
            <dj:label path="firstName"  class="form-label">First Name</dj:label>
            <dj:input  path="firstName" type="text" class="form-control" aria-describedby="emailHelp"/>
            <div id="firstNameHelp" class="form-text">Please enter the first name here.</div>
            <div><dj:errors path="firstName" class="error" /></div>
        </div>
        <div class="mb-3">
            <dj:label path="lastName" class="form-label">Last Name</dj:label>
            <dj:input path="lastName" type="text" class="form-control"  aria-describedby="emailHelp" />
            <div><dj:errors path="lastName" class="error" /></div>
            <div id="lastNameHelp" class="form-text">Please enter the last name here.</div>
        </div>
        <div class="mb-3">
            <dj:label path="email"  class="form-label">Email</dj:label>
            <dj:input path="email" type="email" class="form-control" />
            <div><dj:errors path="email" class="error" /></div>
            <div id="emailHelp" class="form-text">Only Students with edu.com can make a signup</div>
        </div>
        <div class="mb-3">
            <dj:label path="contactNumber"  class="form-label">Contact</dj:label>
            <dj:input path="contactNumber" type="tel" class="form-control" />
            <div><dj:errors path="contactNumber" class="error" /></div>
            <div id="contactHelp" class="form-text">We never share such Information with others</div>
        </div>
        <div class="mb-3">
            <dj:label path="password"  class="form-label">Password</dj:label>
            <dj:input path="password" type="password" class="form-control" />
            <div><dj:errors path="password" class="error" /></div>
            <div id="passwordHelp" class="form-text">Please enter your password here!</div>
        </div>
        <div class="mb-3 form-check">
            <!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label> -->
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </dj:form>

</section>
<section class="mt-5 container p-5">
    <table class="table">
        <thead><td>SNo</td><td>First Name</td><td>LastName</td><td>Email</td><td>Contact</td></thead>
        <tbody>
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td></td>
                <td><c:out value="${employee.firstName}"></c:out></td>
                <td><c:out value="${employee.lastName}"></c:out></td>
                <td><c:out value="${employee.email}"></c:out></td>
                <td><c:out value="${employee.contactNumber}"></c:out></td>
                <td></td>
            </tr>
        </c:forEach>


        </tbody>
    </table>
</section >

<section id="footer">
    <%@ include file="include/footer.jsp" %>

</section>

<!-- Modal -->
<div
        class="modal fade"
        id="enroll"
        tabindex="-1"
        aria-labelledby="enrollLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="enrollLabel">Enrollment</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <p class="lead">Fill out this form and we will get back to you</p>
                <form>
                    <div class="mb-3">
                        <label for="first-name" class="col-form-label">
                            First Name:
                        </label>
                        <input type="text" class="form-control" id="first-name" />
                    </div>
                    <div class="mb-3">
                        <label for="last-name" class="col-form-label">Last Name:</label>
                        <input type="text" class="form-control" id="last-name" />
                    </div>
                    <div class="mb-3">
                        <label for="email" class="col-form-label">Email:</label>
                        <input type="email" class="form-control" id="email" />
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="col-form-label">Phone:</label>
                        <input type="tel" class="form-control" id="phone" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                >
                    Close
                </button>
                <button type="button" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>






<!-- href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"

href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css" -->
<script  src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.js"></script>

<script>
    mapboxgl.accessToken =
        'pk.eyJ1IjoiYnRyYXZlcnN5IiwiYSI6ImNrbmh0dXF1NzBtbnMyb3MzcTBpaG10eXcifQ.h5ZyYCglnMdOLAGGiL1Auw'
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11',
        center: [-71.060982, 42.35725],
        zoom: 18,
    })
</script>
</body>
