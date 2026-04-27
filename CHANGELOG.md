# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo siguiendo el estándar de [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/).
## [0.1.0] - 2026-04-27
## Añadido
**Preparacion**: copiadas las clases `usuario` y `usuarioController` asi como las vistas del usuario y las vistas principales del proyecto general para tener una base sobre la que trabajar


## [1.0.1] - 2026-04-28
## Añadido / Modificado
**Preferencias**: importado y actualizado a Spring el archivo
* **Entidad `Usuario`**: Migración a entidad JPA (`@Entity`) con sus respectivas restricciones de validación de Jakarta (`@NotBlank`, `@Email`, `@Size`, `@Past`, etc.).
* **Repositorio `UsuarioRepository`**: Creación de la interfaz basada en Spring Data JPA (`JpaRepository`) para la persistencia de datos, incluyendo la consulta `existsByEmail`.
* **Controlador `UsuarioController`**: Implementación del controlador Spring MVC (`@Controller`) con las operaciones de:
    * Alta de usuarios (GET y POST) en la ruta `/usuarios/registro`.
    * Listado general en la ruta `/usuarios/listado`.
    * Login y Logout (`/usuarios/login` y `/usuarios/logout`).
    * Cambio de preferencias de visualización (`/usuarios/preferencias/cambiarColor`).
* **Validaciones de Negocio**: Implementación en el controlador de validación manual para correos duplicados y comprobación de mayoría de edad (mayor de 18 años).
* **Vistas JSP**: Migración completa de JSF (`.xhtml`) a JSP utilizando JSTL y Spring Form Tags para:
    * `registro.jsp` (con `<form:errors>` para las validaciones).
    * `listado_usuarios.jsp`.
    * `login.jsp`.
    * `index.jsp`.
* **Fragmentos y Diseño**: Sustitución del sistema de plantillas (Layout) de JSF por la inclusión de fragmentos JSP (`header.jsp` y `footer.jsp`).
* **Gestión de Sesión**: Refactorización de la clase `Preferencias` de JSF a un componente de Spring con alcance de sesión (`@Component` y `@SessionScope`) para gestionar el color de fondo y el último producto visitado.
