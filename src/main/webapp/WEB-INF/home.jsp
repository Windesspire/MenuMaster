<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <title>Home</title>
</head>
<body>
    <header class=" py-3 mb-4">
        <div class="container">
            <h1 class="text-center">MenuMaster</h1>
        </div>
    </header>
    <main class="container overlay">
        <div class="text-center mb-4">
            <h2>Bienvenid@ a ${sessionScope.restorantNombre}</h2>
        </div>
        <nav class="d-flex flex-column align-items-center gap-3">
            <a href="/productos" class="btn btn-outline-primary w-50">Productos</a>
            <a href="/mesas" class="btn btn-outline-primary w-50">Mesas</a>
            <a href="/ordenes" class="btn btn-outline-primary w-50">Revisar Ordenes</a>
            <a href="/logout" class="btn btn-outline-danger w-50">Cerrar Sesión</a>
        </nav>
    </main>
</body>
</html>