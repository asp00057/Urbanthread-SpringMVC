# Urban Thread - Plataforma E-Commerce (Spring Boot MVC) 👕

Urban Thread es un proyecto académico desarrollado para la asignatura de **Desarrollo de Aplicaciones Web (DAW)**. Se trata de una plataforma de comercio electrónico orientada a la moda, construida bajo el patrón de diseño **Modelo-Vista-Controlador (MVC)**, utilizando el ecosistema de Spring para el backend y JSPs para la capa de presentación.

## 🎯 Objetivos del Proyecto
El propósito principal es demostrar la integración de un backend robusto en Java con una interfaz web dinámica, gestionando la persistencia de datos, la seguridad en el acceso y la personalización de la experiencia del usuario a través de sesiones.

## 🛠️ Stack Tecnológico

### Backend
- **Java 17**: Lenguaje base.
- **Spring Boot 3.x**: Framework principal.
- **Spring Data JPA**: Para la abstracción de la capa de persistencia.
- **Hibernate Validator**: Validación de datos en formularios mediante anotaciones.

### Frontend
- **JSP (JavaServer Pages)**: Motor de plantillas para la generación de vistas dinámicas.
- **JSTL (Jakarta Standard Tag Library)**: Para lógica en las vistas (bucles, condicionales).
- **Bootstrap 5**: Framework de CSS para un diseño *responsive* y moderno.
- **Bootstrap Icons**: Librería de iconografía.

### Persistencia y Sesión
- **H2 Database**: Base de datos en memoria para agilizar el desarrollo y las pruebas.
- **HttpSession**: Gestión de estado para el login de usuarios y preferencias de interfaz.

## 🚀 Funcionalidades Implementadas

### 1. Gestión de Usuarios
- **Registro Dinámico:** Formulario con validaciones en tiempo real (campos obligatorios, formato de email) y lógica de negocio personalizada (validación de mayoría de edad).
- **Control de Acceso (Login/Logout):** Sistema de autenticación que verifica credenciales contra la base de datos y mantiene la identidad del usuario en la sesión.
- **Panel Administrativo:** Vista protegida que permite visualizar el listado completo de usuarios registrados, diferenciando roles (ADMIN/USUARIO).

### 2. Catálogo de Productos
- **Visualización:** Galería de productos dinámica generada desde el controlador.
- **Filtro de Detalles:** Buscador integrado en el índice para acceder a la ficha técnica de cada artículo.

### 3. Personalización (User Experience)
- **Preferencias de Interfaz:** Selector de color de fondo en la cabecera. La elección del usuario se almacena en un componente `@SessionScope`, permitiendo que la preferencia persista mientras navega por las distintas secciones del sitio.

## 📂 Estructura del Proyecto

El código está organizado siguiendo las mejores prácticas de paquetes de Spring:

- `src/main/java/.../controlador`: Contiene los controladores (`mainController`, `UsuarioController`) que gestionan las rutas y el flujo de datos.
- `src/main/java/.../modelos`: Clases de entidad (`Usuario`) y componentes de sesión (`Preferencias`).
- `src/main/java/.../repositorios`: Interfaces JPA para el acceso a datos.
- `src/main/webapp/WEB-INF/`: Contenedor de seguridad para las vistas.
    - `/views`: JSPs de las páginas principales (login, registro, listado).
    - `/fragments`: Componentes reutilizables como el `header.jsp` y `footer.jsp`.

## 🛡️ Validaciones Destacadas
Se ha implementado una capa de validación estricta en el modelo de Usuario:
- `@Email`: Garantiza la integridad de los correos electrónicos.
- `@Size` y `@NotBlank`: Controlan la longitud y presencia de nombres y contraseñas.
- **Lógica de Edad:** Validación personalizada en el controlador para restringir el registro a menores de 18 años.

---
© 2026 Urban Thread Project - Arquitectura de Software y Desarrollo Web.
