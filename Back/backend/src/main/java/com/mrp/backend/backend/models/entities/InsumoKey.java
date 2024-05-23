package com.mrp.backend.backend.models.entities;

import java.io.Serializable;
import jakarta.persistence.Embeddable;

@Embeddable
public class InsumoKey implements Serializable {

    private Long id;
    private String nombre;

    // Getters y Setters

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InsumoKey that = (InsumoKey) o;

        if (!id.equals(that.id)) return false;
        return nombre.equals(that.nombre);
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + nombre.hashCode();
        return result;
    }
}
