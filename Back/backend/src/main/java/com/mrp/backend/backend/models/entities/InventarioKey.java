package com.mrp.backend.backend.models.entities;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Embeddable;

@Embeddable
public class InventarioKey implements Serializable {

    private Long idInsumo;
    private Date fechaIngreso;

    // Getters y Setters

    public Long getIdInsumo() {
        return idInsumo;
    }

    public void setIdInsumo(Long idInsumo) {
        this.idInsumo = idInsumo;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InventarioKey that = (InventarioKey) o;

        if (!idInsumo.equals(that.idInsumo)) return false;
        return fechaIngreso.equals(that.fechaIngreso);
    }

    @Override
    public int hashCode() {
        int result = idInsumo.hashCode();
        result = 31 * result + fechaIngreso.hashCode();
        return result;
    }
}
