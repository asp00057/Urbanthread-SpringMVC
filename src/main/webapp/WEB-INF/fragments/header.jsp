<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="jakarta.faces.html"
      xmlns:ui="jakarta.faces.facelets"
      xmlns:f="jakarta.faces.core">
<ui:composition>
    <style type="text/css">
        .color-box {
            width: 22px;
            height: 22px;
            border-radius: 4px;
            border: 1px solid #666; /* Un borde algo más oscuro para que se vea sobre el fondo oscuro del nav */
            display: inline-block;
            transition: transform 0.2s;
            cursor: pointer;
        }
        .color-box:hover {
            transform: scale(1.0);
        }
        .color-box.active {
            border: 2px solid #fff; /* Borde blanco para resaltar el seleccionado sobre el negro */
            box-shadow: 0 0 4px #fff;
        }
        .color-picker-container {
            padding: 5px;
            background: rgba(255,255,255,0.1); /* Un fondo sutil para agruparlos */
            border-radius: 6px;
        }
    </style>
    <nav class ="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <h:link outcome="/index.xhtml" class="navbar-brand fs-3 d-flex align-items-center">
                <h:graphicImage library="Images"
                                name="logo.jpeg"
                                alt="Logo Urban Thread"
                                style="height: 50px; margin-right: 10px;" />

                Urban Thread
            </h:link>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon">
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav ms-auto">
                    <h:link outcome="/index.xhtml" class="nav-link small-nav-link" value="Inicio"/>
                    <h:link outcome="/Productos/listado_productos.xhtml" class="nav-link small-nav-link" value="Catálogo"/>
                    <h:link outcome="/Productos/busqueda.xhtml" class="nav-link small-nav-link" value="Buscar Producto"/>

                    <h:link outcome="/Pedidos/listado.xhtml" class="nav-link small-nav-link" value="Mis Pedidos"/>
                    <h:link outcome="/Usuarios/registro.xhtml" class="nav-link small-nav-link" value="Registro"/>

                    <h:link outcome="/Productos/alta.xhtml"
                            class="nav-link small-nav-link text-warning"
                            value="Alta Producto"
                            rendered="#{usuarioController.esAdmin}"/>
                    <h:link outcome="/Productos/listado_productos.xhtml"
                            class="nav-link small-nav-link text-warning"
                            value="Modificar Productos"
                            rendered="#{usuarioController.esAdmin}"/>

                    <h:link outcome="/Usuarios/perfil.xhtml" class="nav-link small-nav-link ms-lg-3" title="Mi Perfil">
                        <i class="bi bi-person-circle fs-5"></i>
                    </h:link>

                    <h:link outcome="/Pedidos/nuevo.xhtml" class="nav-link small-nav-link" title="Nuevo Pedido (Carrito)">
                        <i class="bi bi-cart3 fs-5"></i>
                    </h:link>

                    <h:form id="themeForm" class="d-flex ms-3 align-items-center">
                        <div class="color-picker-container d-flex gap-2">
                            <h:commandLink action="#{preferencias.aplicarColor}" title="Claro" class="color-box #{preferencias.color == '#ffffff' ? 'active' : ''}" style="background-color: #ffffff;">
                                <f:setPropertyActionListener value="#ffffff" target="#{preferencias.color}" />
                                <f:ajax execute="@this" render="@all" />
                            </h:commandLink>
                            <h:commandLink action="#{preferencias.aplicarColor}" title="Gris Suave" class="color-box #{preferencias.color == '#bdc3c7' ? 'active' : ''}" style="background-color: #bdc3c7;">
                                <f:setPropertyActionListener value="#bdc3c7" target="#{preferencias.color}" />
                                <f:ajax execute="@this" render="@all" />
                            </h:commandLink>
                            <h:commandLink action="#{preferencias.aplicarColor}" title="Azul Claro" class="color-box #{preferencias.color == '#e3f2fd' ? 'active' : ''}" style="background-color: #e3f2fd;">
                                <f:setPropertyActionListener value="#e3f2fd" target="#{preferencias.color}" />
                                <f:ajax execute="@this" render="@all" />
                            </h:commandLink>
                            <h:commandLink action="#{preferencias.aplicarColor}" title="Naranja Claro" class="color-box #{preferencias.color == '#fff3e0' ? 'active' : ''}" style="background-color: #fff3e0;">
                                <f:setPropertyActionListener value="#fff3e0" target="#{preferencias.color}" />
                                <f:ajax execute="@this" render="@all" />
                            </h:commandLink>
                        </div>
                    </h:form>
                </div>
            </div>
        </div>
    </nav>
</ui:composition>
</html>