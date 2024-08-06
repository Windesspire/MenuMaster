<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Crear Mesa</title>
</head>
<body>
    <header>
        <button><a href="/mesas">Volver</a></button>
        <h1 class="mx-auto d-flex justify-content-center">MenuMaster</h1>
    </header>
    <main class="container">
        <form:form method="post" action="/mesas/new" modelAttribute="mesaNueva"> 
		<button type="submit">Crear</button>
	    </form:form>
    </main>
</body>
</html>