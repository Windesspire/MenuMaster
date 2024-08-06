<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <title>Crear Mesa</title>
</head>
<body>
     <header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/home" class="btn btn-outline-primary">Volver</a>
            <h1 class="text-center flex-grow-1 m-0">MenuMaster</h1>
        </div>
    </header>
    <main class="container overlay">
        <form:form method="post" action="/mesas/new" modelAttribute="mesaNueva" class="needs-validation" novalidate="novalidate">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <form:input path="nombre" id="nombre" class="form-control"/>
                <form:errors path="nombre" class="text-danger"/>
            </div>
            <div class="mb-3">
                <label for="numSillas" class="form-label">Número de Sillas:</label>
                <form:input path="numSillas" id="numSillas" class="form-control"/>
                <form:errors path="numSillas" class="text-danger"/>
            </div>
            <button type="submit" class="btn btn-outline-primary">Crear</button>
        </form:form>
    </main>
</body>
</html>
