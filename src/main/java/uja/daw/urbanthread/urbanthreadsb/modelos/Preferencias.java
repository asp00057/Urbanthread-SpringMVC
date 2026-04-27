package uja.daw.urbanthread.urbanthreadsb.modelos;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import java.io.Serializable;
import java.util.logging.Logger;

@Component("preferencias")
@SessionScope
public class Preferencias implements Serializable {

    private static final Logger log = Logger.getLogger(Preferencias.class.getName());

    // Color por defecto (Blanco)
    private String color = "#ffffff";
    private String ultimoProducto = "";

    public Preferencias() {
        log.info("Bean de Preferencias inicializado.");
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    // Método para aplicar el color (el botón recargará la vista y aplicará el nuevo valor)
    public String aplicarColor() {
        log.info("Cambiando color de fondo de la aplicación a: " + this.color);
        return null; // Devuelve null para recargar la misma página
    }

    public String getUltimoProducto() { return ultimoProducto; }
    public void setUltimoProducto(String ultimoProducto) { this.ultimoProducto = ultimoProducto; }
}