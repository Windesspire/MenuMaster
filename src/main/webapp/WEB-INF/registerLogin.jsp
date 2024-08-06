<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Registro y Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="icon" href="/resources/imagenes/iconpest.ico">
</head>
<body>
	<header class=" py-3 mb-4 ">
        <div class="container">
        <h1 class="text-center">MenuMaster</h1>
        </div>
    </header>
    <div class="container my-5 overlay">
        <div class="row">
            <div class="col-md-6">
                <h3 class="mb-4">Registrar!</h3>
                <form:form action="/register" method="POST" modelAttribute="restaurant">
                    <div class="mb-3">
                        <form:label path="nombreRestorant" class="form-label">Nombre del Restaurante:</form:label>
                        <form:input path="nombreRestorant" type="text" class="form-control"/>
                        <form:errors path="nombreRestorant" class="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="categoria" class="form-label">Categoría:</form:label>
                        <form:select path="categoria" class="form-select">
                            <form:option value="#">-----</form:option>
                            <form:option value="Fast Food">Fast Food</form:option>
                            <form:option value="Familiar">Familiar</form:option>
                            <form:option value="Take away">Take away</form:option>
                            <form:option value="Temático">Temático</form:option>
                        </form:select>
                    </div>
                    <div class="mb-3">
                        <form:label path="email" class="form-label">Correo:</form:label>
                        <form:input path="email" type="email" class="form-control"/>
                        <form:errors path="email" class="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="pasword" class="form-label">Contraseña:</form:label>
                        <form:password path="pasword" class="form-control"/>
                        <form:errors path="pasword" class="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="paswordConfirmation" class="form-label">Confirmación:</form:label>
                        <form:password path="paswordConfirmation" class="form-control"/>
                        <form:errors path="paswordConfirmation" class="text-danger"/>
                    </div>
                    <button type="submit" class="btn btn-outline-primary">Registrar</button>
                </form:form>
            </div>
            <div class="col-md-6">
                <h3 class="mb-4">Iniciar sesion!</h3>
                <form:form action="/login" method="POST" modelAttribute="restaurant">
                    <div class="mb-3">
                        <form:label path="email" class="form-label">Correo:</form:label>
                        <form:input path="email" type="email" class="form-control" required="required"/>
                        <form:errors path="email" class="text-danger"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="pasword" class="form-label">Contraseña:</form:label>
                        <form:password path="pasword" class="form-control" required="required"/>
                        <form:errors path="pasword" class="text-danger"/>
                    </div>
                    <button type="submit" class="btn btn-outline-primary">Iniciar Sesion!</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>
