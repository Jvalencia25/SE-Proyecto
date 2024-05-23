package com.mrp.backend.backend.models.entities;

import com.mrp.backend.backend.models.entities.keys.IngredienteProductoKey;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;

@Entity
public class IngredienteProducto {

    @EmbeddedId
    private IngredienteProductoKey id;

    @ManyToOne
    private Producto producto;

    @ManyToOne
    private Insumo insumo;

    public IngredienteProductoKey getId() {
        return id;
    }

    public void setId(IngredienteProductoKey id) {
        this.id = id;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Insumo getInsumo() {
        return insumo;
    }

    public void setIngrediente(Insumo ingrediente) {
        this.insumo = ingrediente;
    }
}
