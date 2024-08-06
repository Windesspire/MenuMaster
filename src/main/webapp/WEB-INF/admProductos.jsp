<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <title>Administrar Productos</title>
</head>
<body>
    <header class=" py-3 mb-4 ">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="/home?restorant=${restorant}" class="btn btn-outline-primary">Volver</a>
            <div class="text-center">
                <h1 class="m-0">MenuMaster</h1>
                <h2 class="m-0">${restorant}</h2>
            </div>
            <a href="/logout" class="btn btn-outline-danger">Cerrar Sesión</a>
        </div>
    </header>
    <main class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="m-0">Tus Productos</h2>
            <a href="/productos/agregar" class="btn btn-success">Agregar Producto</a>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover table-transparent ">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Categoría</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Ingredientes</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="producto" items="${listaProductos}">
                        <tr>
                            <td>${producto.tipo}</td>
                            <td>${producto.nombre}</td>
                            <td>${producto.ingredientes}</td>
                            <td>${producto.precio}</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <a href="/producto/editar/${producto.id}" class="btn btn-primary btn-sm">Editar</a>
                                    <form id="deleteForm" action="${pageContext.request.contextPath}eliminar/producto/${producto.id}" method="post" class="m-0">
                                        <input type="hidden" name="_method" value="delete"/>
                                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
