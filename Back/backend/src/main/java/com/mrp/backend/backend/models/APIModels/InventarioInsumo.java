package com.mrp.backend.backend.models.APIModels;

import java.math.BigDecimal;
import java.util.Date;


public class InventarioInsumo {

    private Long id;
    private String nombre;
    private BigDecimal cantidad;
    private String unidad_medida;
    private Date fecha_vencimiento;
    private Date fecha_ingreso;
    private String precio;
    private String proveedor;

    public InventarioInsumo(Long id, String nombre, BigDecimal cantidad, String unidad_medida,
                            Date fecha_vencimiento, Date fecha_ingreso, String precio, String proveedor) {
        this.id = id;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.unidad_medida = unidad_medida;
        this.fecha_vencimiento = fecha_vencimiento;
        this.fecha_ingreso = fecha_ingreso;
        this.precio = precio;
        this.proveedor = proveedor;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public BigDecimal getCantidad() {
        return cantidad;
    }

    public void setCantidad(BigDecimal cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidad_medida() {
        return unidad_medida;
    }

    public void setUnidad_medida(String unidad_medida) {
        this.unidad_medida = unidad_medida;
    }

    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
}
