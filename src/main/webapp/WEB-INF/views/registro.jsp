<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/fragments/header.jsp" />

<main class="container mt-4">
    <div class="card shadow mx-auto" style="max-width: 600px;">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Crear Nueva Cuenta - UrbanThread</h3>
        </div>
        <div class="card-body">

            <%-- El modelAttribute debe coincidir con el nombre que pongas en el model.addAttribute del controlador --%>
            <form:form modelAttribute="usuario" action="${pageContext.request.contextPath}/usuarios/registro" method="POST">

                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <form:input path="email" type="email" class="form-control" placeholder="Email" />
                    <form:errors path="email" cssClass="text-danger small" />
                </div>

                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre Completo</label>
                    <form:input path="nombre" class="form-control" placeholder="Nombre y apellidos" />
                    <form:errors path="nombre" cssClass="text-danger small" />
                </div>

                <div class="mb-3">
                    <label for="pwd" class="form-label">Contraseña</label>
                    <form:password path="pwd" class="form-control" placeholder="Contraseña segura" />
                    <form:errors path="pwd" cssClass="text-danger small" />
                </div>

                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección de Envío</label>
                    <form:input path="direccion" class="form-control" placeholder="Calle, número, piso..." />
                    <form:errors path="direccion" cssClass="text-danger small" />
                </div>

                <div class="mb-3">
                    <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                    <form:input path="fechaNacimiento" type="date" class="form-control" />
                    <form:errors path="fechaNacimiento" cssClass="text-danger small" />
                </div>

                <button type="submit" class="btn btn-primary w-100">Registrarse</button>

                <div class="text-center mt-3">
                    <span class="text-muted">¿Ya tienes cuenta?</span>
                    <a href="${pageContext.request.contextPath}/usuarios/login">Inicia sesión aquí</a>
                </div>
            </form:form>

        </div>
    </div>
</main>

<jsp:include page="/WEB-INF/fragments/footer.jsp" />