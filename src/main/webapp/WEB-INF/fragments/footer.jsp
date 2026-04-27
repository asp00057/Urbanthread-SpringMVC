<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<footer class="bg-light text-center text-lg-start mt-auto py-3 border-top">
    <div class="container text-center">
        <span class="text-muted">
            © 2026 Urban Thread. Desarrollado para DAW - Arquitectura Spring MVC
        </span>
    </div>
    <c:if test="${not empty preferencias.ultimoProducto}">
        <hr/>
        <p class="mb-0">Último producto visitado: <strong>${preferencias.ultimoProducto}</strong></p>
    </c:if>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/js/bootstrap.bundle.min.js"></script>
