package com.mrp.backend.backend.models.entities;

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
    private Ingrediente ingrediente;

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

    public Ingrediente getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(Ingrediente ingrediente) {
        this.ingrediente = ingrediente;
    }
}
