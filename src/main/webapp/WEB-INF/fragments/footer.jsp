<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="jakarta.faces.html"
      xmlns:ui="jakarta.faces.facelets">

    <ui:composition>
        <footer class="bg-light text-center text-lg-start mt-auto py-3">
            <div class="container text-center">
                    <span class="text-muted">
                        © 2026 Urban Thread. Desarrollado para DAW - Arquitectura MVC y JSF
                    </span>

                <h:panelGroup rendered="#{not empty preferencias.ultimoProducto}">
                    <hr/>
                    <p class="mb-0">Último producto visitado: <strong>#{preferencias.ultimoProducto}</strong></p>
                </h:panelGroup>
            </div>
        </footer>
    </ui:composition>w
</html>
