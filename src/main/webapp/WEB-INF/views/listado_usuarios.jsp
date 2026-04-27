<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="../fragments/header.jsp" />

<main class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>Directorio de Usuarios - UrbanThread</h2>
    <a href="${pageContext.request.contextPath}/usuarios/registro" class="btn btn-success">
    <i class="bi bi-plus-circle"></i> Nuevo Usuario
    </a>
    </div>

    <div class="table-responsive">
        <table class="table table-hover table-striped shadow-sm">
            <thead class="table-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Dirección</th>
                    <th>Rol</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaUsuarios}" var="user">
                    <tr>
                        <td>${user.nombre}</td>
                        <td>${user.email}</td>
                        <td>${user.direccion}</td>
                        <td>
                            <span class="badge ${user.rol == 'ADMIN' ? 'bg-danger' : 'bg-info text-dark'}">
                            ${user.rol}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listaUsuarios}">
                    <tr>
                        <td colspan=\"4\" class=\"text-center\">No hay usuarios registrados todavía.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</main>

<jsp:include page="../fragments/footer.jsp" />