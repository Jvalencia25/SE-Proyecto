package com.mrp.backend.backend.models.APIModels;

import java.util.Date;

public class PedidoProductos {
    private Long id;
    private Date fecha;
    private String direccion;
    private String nombre_cliente;
    private String nombre_empleado;
    private int id_empleado;
    private int id_producto;
    private String nombre_producto;
    private String precio;
    
    public PedidoProductos(Long id, Date fecha, String direccion, String nombre_cliente, String nombre_empleado,
            int id_empleado, int id_producto, String nombre_producto, String precio) {
        this.id = id;
        this.fecha = fecha;
        this.direccion = direccion;
        this.nombre_cliente = nombre_cliente;
        this.nombre_empleado = nombre_empleado;
        this.id_empleado = id_empleado;
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.precio = precio;
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
    public String getPrecio() {
        return precio;
    }
    public void setPrecio(String precio) {
        this.precio = precio;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
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
    public String getNombre_cliente() {
        return nombre_cliente;
    }
    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }
    public int getId_empleado() {
        return id_empleado;
    }
    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }
    public int getId_producto() {
        return id_producto;
    }
    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    
}
