package com.mrp.backend.backend.models.entities;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import java.util.Date;

@Entity
public class Inventario {

    @EmbeddedId
    private InventarioKey id;

    private int cantidad;

    private Date fechaVencimiento;

    // Getters y Setters

    public InventarioKey getId() {
        return id;
    }

    public void setId(InventarioKey id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
}

