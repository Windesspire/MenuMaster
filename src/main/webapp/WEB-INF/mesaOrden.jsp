<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<title>Administrar Productos</title>
	<link rel="icon" href="/resources/imagenes/iconpest.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <header class="py-3 mb-4">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/mesas" class="btn btn-primary">Volver</a>
            <h1 class="mx-auto">MenuMaster</h1>
        </div>
    </header>
    <main class="container overlay">
        <c:if test="${not empty ordenes}">
            <div class="row">
                <c:forEach var="orden" items="${ordenes}">
                    <div class="col-md-4">
                        <div class="card border-info mb-3">
                            <div class="card-header estado bg-info text-white">Estado</div>
                            <div class="card-body">
                                <h5 class="card-title">Orden #${orden.id}</h5>
                                <div class="d-flex justify-content-between">
                                    <a href="/info/orden/${orden.id}" class="btn btn-info ">Ver...</a>
                                    <form id="deleteForm" action="${pageContext.request.contextPath}/eliminar/orden/${orden.id}" method="post">
                                        <input type="hidden" name="_method" value="delete"/>
                                        <button type="submit" class="btn btn-danger">Eliminar Orden</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+yw2aLl5M5Mn8iB5+q58JauAuh7BwnUAn/O3pXWQJ6mJOMceE7He5y7RmXskf5" crossorigin="anonymous"></script>
</body>
</html>
