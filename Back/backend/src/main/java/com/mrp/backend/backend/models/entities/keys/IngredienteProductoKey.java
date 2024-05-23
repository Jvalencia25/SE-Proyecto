package com.mrp.backend.backend.models.entities.keys;

import java.io.Serializable;
import jakarta.persistence.Embeddable;

@Embeddable
public class IngredienteProductoKey implements Serializable {

    private Long idProducto;
    private Long idIngrediente;

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public Long getIdIngrediente() {
        return idIngrediente;
    }

    public void setIdIngrediente(Long idIngrediente) {
        this.idIngrediente = idIngrediente;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        IngredienteProductoKey that = (IngredienteProductoKey) o;

        if (!idProducto.equals(that.idProducto)) return false;
        return idIngrediente.equals(that.idIngrediente);
    }

    @Override
    public int hashCode() {
        int result = idProducto.hashCode();
        result = 31 * result + idIngrediente.hashCode();
        return result;
    }
}
