<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="jakarta.faces.html"
      xmlns:ui="jakarta.faces.facelets"
      xmlns:f="jakarta.faces.core"
      xmlns:jsf="jakarta.faces"
      xmlns:p="http://primefaces.org/ui">


    <ui:composition template="/WEB-INF/templates/layout.xhtml">
        <ui:define name="title"> Directorio de usuarios - Urban Thread</ui:define>

        <ui:define name="contenido">
            <h:form id="formAdmin" rendered="#{usuarioController.esAdmin}">
                <div class="mb-4 col-md-6">
                    <label for="buscador" class="form-label fw-bold"> Buscar usuario por nombre</label>
                    <h:inputText id="buscador" value="#{usuarioController.cadenaBusqueda}" class="form-control"
                                 placeholder="Escriba el nombre">
                        <f:ajax event="keyup" render="tablaUsuarios"/>
                    </h:inputText>
                </div>
                <p:dataTable id="tablaUsuarios" value="#{usuarioController.usuariosFiltrados}" var="user" styleClass="mt-4">

                    <p:column headerText="Nombre">
                        <h:outputText value="#{user.nombre}" />
                    </p:column>

                    <p:column headerText="Email">
                        <h:outputText value="#{user.email}" />
                    </p:column>

                    <p:column headerText="Dirección">
                        <h:outputText value="#{user.direccion}" />
                    </p:column>

                    <p:column headerText="Acciones">
                        <p:commandButton icon="pi pi-trash" value="Borrar"
                                         action="#{usuarioController.borrarUsuario(user)}"
                                         update="@form"
                                         styleClass="ui-button-danger ui-button-sm">
                            <p:confirm type="popup" header="Atención" message="¿Borrar a #{user.nombre}?" icon="pi pi-exclamation-triangle"/>
                        </p:commandButton>
                    </p:column>

                </p:dataTable>

                <p:confirmPopup global="true">
                    <p:commandButton value="No" type="button" styleClass="ui-confirm-popup-no ui-button-flat"/>
                    <p:commandButton value="Sí" type="button" styleClass="ui-confirm-popup-yes" />
                </p:confirmPopup>
            </h:form>
            <div jsf:rendered="#{not usuarioController.esAdmin}">
                <div class="alert alert-warning mt-5">
                    <h4 class="alert-heading">ACCESO RESTRINGIDO</h4>
                    <p>Sólo los Administradores de <strong>Urban Thread</strong> tienen acceso a esta página</p>
                    <h:link outcome="/Usuarios/perfil.xhtml" value="Volver al perfil"> </h:link>
                </div>

            </div>
        </ui:define>
    </ui:composition>


</html>