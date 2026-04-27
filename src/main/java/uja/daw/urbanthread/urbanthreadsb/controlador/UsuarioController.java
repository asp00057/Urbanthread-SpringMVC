package uja.daw.urbanthread.urbanthreadsb.controlador;

import jakarta.servlet.http.HttpServletRequest;
import uja.daw.urbanthread.urbanthreadsb.modelos.Preferencias;
import uja.daw.urbanthread.urbanthreadsb.modelos.Usuario;
import uja.daw.urbanthread.urbanthreadsb.repositorios.UsuarioRepository;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;
import java.util.Optional;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepo;

    @Autowired
    private Preferencias preferencias;

    // 1. LISTADO
    @GetMapping("/listado")
    public String listarUsuarios(Model model) {
        model.addAttribute("listaUsuarios", usuarioRepo.findAll());
        return "views/listado_usuarios";
    }

    // 2. FORMULARIO DE ALTA (GET)
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "views/registro";
    }

    // 3. PROCESAR ALTA + VALIDACIÓN (POST)
    @PostMapping("/registro")
    public String registrarUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
                                   BindingResult result) {

        if (usuarioRepo.existsByEmail(usuario.getEmail())) {
            result.rejectValue("email", "error.usuario", "Ya existe un usuario con ese email");
        }

        if (usuario.getFechaNacimiento() != null) {
            if (Period.between(usuario.getFechaNacimiento(), LocalDate.now()).getYears() < 18) {
                result.rejectValue("fechaNacimiento", "error.usuario", "Debes ser mayor de 18 años");
            }
        }

        if (result.hasErrors()) {
            return "views/registro";
        }

        usuario.setRol("USUARIO"); // Valor por defecto
        usuarioRepo.save(usuario);
        return "redirect:/usuarios/listado";
    }

    @GetMapping("/login")
    public String mostrarLogin(){
        return "views/login";
    }

    @PostMapping("/login")
    public String procesarLogin(@RequestParam String email,
                                @RequestParam String password,
                                HttpSession session,
                                Model model){
        Optional<Usuario> userOpt = usuarioRepo.findById(email);
        if (userOpt.isPresent() && userOpt.get().getPwd().equals(password)){
            session.setAttribute("usuarioLogueado", userOpt.get());
            return "redirect:/index";
        }
        model.addAttribute("Error", "Credenciales incorrectas");
        return "views/login";
    }
    @GetMapping("/preferencias/cambiarColor")
    public String cambiarColor(@RequestParam("color") String nuevoColor, HttpServletRequest request){
        preferencias.setColor(nuevoColor);
        String referer = request.getHeader("Referer");
        return "redirect:" + (referer != null ? referer : "/index");
    }

}