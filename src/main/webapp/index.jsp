<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- Incluimos la cabecera (debes tener un header.jsp en esa ruta) --%>
<jsp:include page="/WEB-INF/fragments/header.jsp" />

<style>
    .card-img-top {
        height: 300px;
        object-fit: cover;
        transition: transform 0.3s ease;
    }
    .card:hover .card-img-top {
        transform: scale(1.05);
    }
    .card { overflow: hidden; }
    .shop-section { margin-bottom: 60px; }
</style>

<div class="container">
    <h1 class="text-center my-5 display-4 fw-bold">Urban Thread</h1>

    <div class="row">
        <div class="col-md-8 shop-section">
            <h2 class="mb-4">Nuestra Colección</h2>
            <div class="row row-cols-1 row-cols-md-2 g-4">

                <c:forEach items="${catalogo}" var="p">
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <img src="${p.imagen}" class="card-img-top" alt="${p.nombre}"/>
                            <div class="card-body">
                                <h5 class="card-title">${p.nombre}</h5>
                                <p class="card-text text-muted small">${p.descripcion}</p>
                                <p class="fw-bold fs-5">${p.precio} €</p>
                                <a href="#" class="btn btn-dark w-100">Añadir al carrito</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <div class="col-md-4">
            <section class="card shadow-sm border-0 mb-4 bg-light">
                <div class="card-body">
                    <h4 class="card-title mb-4 border-bottom pb-2">Panel de Control</h4>
                    <ul class="list-group list-group-flush bg-transparent">
                        <li class="list-group-item bg-transparent">
                            <a href="${pageContext.request.contextPath}/usuarios/registro" class="text-decoration-none">📝 Registro</a>
                        </li>
                        <li class="list-group-item bg-transparent">
                            <a href="${pageContext.request.contextPath}/usuarios/listado" class="text-decoration-none">📋 Ver Usuarios</a>
                        </li>
                    </ul>
                </div>
            </section>

            <form action="${pageContext.request.contextPath}/productos/detalle" method="GET" class="card p-3 shadow-sm">
                <h5>Buscar Producto</h5>
                <select name="id" class="form-select mb-2">
                    <option value="">Seleccione un producto...</option>
                    <c:forEach items="${catalogo}" var="p">
                        <option value="${p.id}">${p.nombre}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-outline-dark w-100">Ver detalles</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/fragments/footer.jsp" />