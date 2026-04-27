package uja.daw.urbanthread.urbanthreadsb.controlador;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.ArrayList;

@Controller
public class mainController {
    @GetMapping({"/", "/index"})
    public String inicio(Model model) {
        // Por ahora, como no tienes el ProductoRepository,
        // mandamos una lista vacía para que el c:forEach de index.jsp no de error
        model.addAttribute("catalogo", new ArrayList<>());

        return "index"; // Esto busca /WEB-INF/index.jsp
    }
}
