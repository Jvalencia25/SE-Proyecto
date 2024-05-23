package com.mrp.backend.backend.models.entities.keys;

import java.io.Serializable;
import jakarta.persistence.Embeddable;

@Embeddable
public class InsumoKey implements Serializable {

    private Long id;


    // Getters y Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InsumoKey that = (InsumoKey) o;

        if (!id.equals(that.id)) return false;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        int result = id.hashCode();
        result = 31 * result + id.hashCode();
        return result;
    }
}
