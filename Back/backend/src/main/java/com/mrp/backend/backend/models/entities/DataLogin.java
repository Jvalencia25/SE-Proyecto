package com.mrp.backend.backend.models.entities;

public class DataLogin {
    private String correo;
    private String contraseña;
    
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String username) {
        this.correo = username;
    }
    public String getContraseña() {
        return contraseña;
    }
    public void setContraseña(String password) {
        this.contraseña = password;
    }
}
