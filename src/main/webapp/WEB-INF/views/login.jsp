<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/fragments/header.jsp" />

<main class="container mt-4">
    <div class="card shadow mx-auto" style="max-width: 400px;">
        <div class="card-header bg-dark text-white">
            <h3 class="mb-0 text-center">Login - UrbanThread</h3>
        </div>

        <div class="card-body">
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">
                        ${error}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/usuarios/login" method="POST">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-control"
                           required="required" placeholder="tu@email.com" />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" name="password" id="password" class="form-control"
                           required="required" placeholder="Tu contraseña" />
                </div>

                <button type="submit" class="btn btn-dark w-100 mb-3">Entrar</button>

                <div class="text-center">
                    <span class="text-muted">¿No tienes cuenta?</span>
                    <a href="${pageContext.request.contextPath}/usuarios/registro">Regístrate</a>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="/WEB-INF/fragments/footer.jsp" />

