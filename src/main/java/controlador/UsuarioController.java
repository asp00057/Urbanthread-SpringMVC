package controlador;

import modelos.Usuario;
import repositorios.UsuarioRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepo;

    // 1. LISTADO
    @GetMapping("/listado")
    public String listarUsuarios(Model model) {
        model.addAttribute("listaUsuarios", usuarioRepo.findAll());
        return "usuarios/listado_usuarios"; // Busca /WEB-INF/jsp/usuarios/listado_usuarios.jsp
    }

    // 2. FORMULARIO DE ALTA (GET)
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "usuarios/registro";
    }

    // 3. PROCESAR ALTA + VALIDACIÓN (POST)
    @PostMapping("/registro")
    public String registrarUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
                                   BindingResult result, Model model) {

        // Validación personalizada: ¿Ya existe el email?
        if (usuarioRepo.existsByEmail(usuario.getEmail())) {
            result.rejectValue("email", "error.usuario", "Este email ya está registrado");
        }

        // Validación personalizada: Edad (migrada de tu JSF)
        if (usuario.getFechaNacimiento() != null) {
            if (Period.between(usuario.getFechaNacimiento(), LocalDate.now()).getYears() < 18) {
                result.rejectValue("fechaNacimiento", "error.usuario", "Debes ser mayor de 18 años");
            }
        }

        // Si hay errores (de anotaciones o manuales), volvemos al formulario
        if (result.hasErrors()) {
            return "usuarios/registro";
        }

        // Guardar y redirigir al listado
        usuario.setRol("USUARIO"); // Valor por defecto
        usuarioRepo.save(usuario);
        return "redirect:/usuarios/listado";
    }
}