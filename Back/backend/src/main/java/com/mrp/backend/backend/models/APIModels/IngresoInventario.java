package com.mrp.backend.backend.models.APIModels;

import java.math.BigDecimal;
import java.util.Date;

public class IngresoInventario {

    private String name;
    private BigDecimal cantidad;
    private String proveedor;
    private Date fecha_vencimiento;
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public BigDecimal getCantidad() {
        return cantidad;
    }
    public void setCantidad(BigDecimal cantidad) {
        this.cantidad = cantidad;
    }
    public String getProveedor() {
        return proveedor;
    }
    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }
    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    
}
