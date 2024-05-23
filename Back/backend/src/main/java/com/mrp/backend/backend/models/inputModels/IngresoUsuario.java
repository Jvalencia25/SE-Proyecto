package com.mrp.backend.backend.models.inputModels;

public class IngresoUsuario {
    private Long id;
    private String contraseña;

    private String nombre_nuevo;
    private String correo_nuevo;
    private String contraseña_nuevo;
    private String nivel_acceso;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getContraseña() {
        return contraseña;
    }
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    public String getNombre_nuevo() {
        return nombre_nuevo;
    }
    public void setNombre_nuevo(String nombre_nuevo) {
        this.nombre_nuevo = nombre_nuevo;
    }
    public String getCorreo_nuevo() {
        return correo_nuevo;
    }
    public void setCorreo_nuevo(String correo_nuevo) {
        this.correo_nuevo = correo_nuevo;
    }
    public String getContraseña_nuevo() {
        return contraseña_nuevo;
    }
    public void setContraseña_nuevo(String contraseña_nuevo) {
        this.contraseña_nuevo = contraseña_nuevo;
    }
    public String getNivel_acceso() {
        return nivel_acceso;
    }
    public void setNivel_acceso(String nivel_acceso) {
        this.nivel_acceso = nivel_acceso;
    }

    

}
