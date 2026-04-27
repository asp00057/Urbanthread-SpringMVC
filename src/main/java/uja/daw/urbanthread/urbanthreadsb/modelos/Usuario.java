package uja.daw.urbanthread.urbanthreadsb.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.*;

import java.io.Serializable;
import java.time.LocalDate;

@Entity
public class Usuario implements Serializable{

    @Size(min = 3, max=25, message="El nombre tiene que tener entre 3 y 25 caracteres")
    @NotBlank(message = "El nombre no puede estar vacío")
    private String nombre;
    @NotBlank(message = "El email es obligatorio")
    @Email(message = "Debe ser un formato de correo válido (usuario@dominio.com)")
    @Id
    private String email;
    @NotBlank(message = "La contraseña es obligatoria")
    private String pwd;
    @NotBlank(message = "La direccion no puede estar vacía")
    private String direccion;
    private boolean admin;
    @NotNull(message = "La fecha de nacimiento es obligatoria")
    @Past(message = "La fecha de nacimiento no puede estar en el futuro")
    private LocalDate fechaNacimiento;
    private String rol;

    public Usuario(){}

    public Usuario(String nombre, String email, String pwd, String direccion, LocalDate fechaNacimiento){
        this.nombre = nombre;
        this.email = email;
        this.pwd = pwd;
        this.direccion = direccion;
        this.fechaNacimiento = fechaNacimiento;
        this.rol = "USUARIO";
    }

    //Getters y Setters
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public String getPwd(){
        return pwd;
    }
    public void setPwd(String pwd){
        this.pwd = pwd;
    }
    public String getDireccion(){
        return direccion;
    }
    public void setDireccion(String direccion){
        this.direccion = direccion;
    }
    public boolean isAdmin(){
        return admin;
    }
    public void setAdmin(boolean admin){
        this.admin = admin;
    }
    public LocalDate getFechaNacimiento(){return fechaNacimiento;}
    public void setFechaNacimiento(LocalDate fechaNacimiento){
        this.fechaNacimiento = fechaNacimiento;
    }
    public String getRol(){
        return rol;
    }

    public void setRol(String rol){
        this.rol = rol;
    }

}
