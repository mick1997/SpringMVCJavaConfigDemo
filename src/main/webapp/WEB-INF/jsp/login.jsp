<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="dj" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        .error {
            color: red;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css"/>
    <title>Login page</title>
</head>
<body>
<!-- Navbar -->
<section class="mb-5">
    <%@include file="include/nav.jsp" %>
</section>

<section id="main" class="mt-5 container p-5">

    <h1>User Login</h1>
    <dj:form action="/dashboard" methood="POST">
        <div class="mb-3">
            <dj:label path="email" class="form-label">Email</dj:label>
            <dj:input path="email" type="email" class="form-control"/>
            <div><dj:errors path="email" class="error"/></div>
            <div id="emailHelp" class="form-text">Only Students can make a sign in</div>
        </div>
        <div class="mb-3">
            <dj:label path="password" class="form-label">Password</dj:label>
            <dj:input path="password" type="password" class="form-control"/>
            <div><dj:errors path="password" class="error"/></div>
            <div id="contactHelp" class="form-text">We never share such Information with others</div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </dj:form>

</section>

<section id="footer">
    <%@ include file="include/footer.jsp" %>
</section>

<!-- href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"

href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css" -->
<script src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
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