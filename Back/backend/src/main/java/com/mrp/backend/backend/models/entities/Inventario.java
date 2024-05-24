package com.mrp.backend.backend.models.entities;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;

import java.math.BigDecimal;
import java.util.Date;

import com.mrp.backend.backend.models.entities.keys.InventarioKey;

@Entity
public class Inventario {

    @EmbeddedId
    private InventarioKey id;

    private BigDecimal cantidad;

    private Date fechaVencimiento;

    // Getters y Setters

    public InventarioKey getId() {
        return id;
    }

    public void setId(InventarioKey id) {
        this.id = id;
    }

    public BigDecimal getCantidad() {
        return cantidad;
    }

    public void setCantidad(BigDecimal cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
}

