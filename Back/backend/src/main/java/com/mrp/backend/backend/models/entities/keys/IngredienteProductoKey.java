package com.mrp.backend.backend.models.entities.keys;

import java.io.Serializable;
import jakarta.persistence.Embeddable;

@Embeddable
public class IngredienteProductoKey implements Serializable {

    private Long id_producto;
    private Long id_ingrediente;

    public Long getId_producto() {
        return id_producto;
    }

    public void setId_producto(Long idProducto) {
        this.id_producto = idProducto;
    }

    public Long getId_ingrediente() {
        return id_ingrediente;
    }

    public void setId_ingrediente(Long idIngrediente) {
        this.id_ingrediente = idIngrediente;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        IngredienteProductoKey that = (IngredienteProductoKey) o;

        if (!id_producto.equals(that.id_producto)) return false;
        return id_ingrediente.equals(that.id_ingrediente);
    }

    @Override
    public int hashCode() {
        int result = id_producto.hashCode();
        result = 31 * result + id_ingrediente.hashCode();
        return result;
    }
}
