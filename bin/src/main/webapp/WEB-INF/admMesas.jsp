<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <title>Administrar Productos</title>
</head>
<body>
    <header class=" py-3 mb-4  overlay">
        <div class="container d-flex justify-content-between align-items-center ">
            <a href="/home" class="btn btn-outline-primary">Volver</a>
            <h1 class="text-center flex-grow-1 m-0">MenuMaster</h1>
        </div>
    </header>
    <main class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="m-0">Tus mesas</h2>
            <a href="/mesas/new" class="btn btn-success">Crear Mesa</a>
        </div>
        <ul class="list-group">
            <c:forEach var="mesa" items="${listaMesas}">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <span>Mesa Nro ${mesa.id}</span>
                    <a href="/mesas/${mesa.id}" class="btn btn-primary btn-sm">Ver Mesa</a>
                </li>
            </c:forEach>
        </ul>
    </main>
</body>
</html>