package com.mrp.backend.backend.models.APIModels;

import java.util.Date;

public class PedidoSave {
    private Date fecha;
    private String direccion;
    private String nombre_cliente;
    private String nombre_empleado;
    private String nombre_producto;
    
    public Date getFecha() {
        return fecha;
    }
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getNombre_empleado() {
        return nombre_empleado;
    }
    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }
    public String getNombre_producto() {
        return nombre_producto;
    }
    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }
    public String getNombre_cliente() {
        return nombre_cliente;
    }
    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }
}
