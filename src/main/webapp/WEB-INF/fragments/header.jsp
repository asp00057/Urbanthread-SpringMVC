<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- Importamos aquí los CSS para que estén en todas las páginas --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .color-box {
            width: 22px; height: 22px; border-radius: 4px; border: 1px solid #666;
            display: inline-block; cursor: pointer; margin-right: 5px;
        }
        .color-box.active { border: 2px solid #fff; box-shadow: 0 0 4px #fff; }
    </style>
</head>
<body style="background-color: ${sessionScope.preferenciasColor != null ? sessionScope.preferenciasColor : '#ffffff'};">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fs-3 fw-bold" href="${pageContext.request.contextPath}/index">Urban Thread</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/usuarios/listado">Usuarios</a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.usuarioLogueado}">
                        <span class="text-white me-3">Hola, ${sessionScope.usuarioLogueado.nombre}</span>
                        <a href="${pageContext.request.contextPath}/usuarios/logout" class="btn btn-outline-light btn-sm">Salir</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/usuarios/login" class="btn btn-outline-light btn-sm">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>