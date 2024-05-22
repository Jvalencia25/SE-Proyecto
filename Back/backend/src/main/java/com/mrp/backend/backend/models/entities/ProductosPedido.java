package com.mrp.backend.backend.models.entities;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;

@Entity
public class ProductosPedido {

    @EmbeddedId
    private ProductosPedidoKey id;

    @ManyToOne
    private pedido pedido;

    @ManyToOne
    private Producto producto;

    public ProductosPedidoKey getId() {
        return id;
    }

    public void setId(ProductosPedidoKey id) {
        this.id = id;
    }

    public pedido getPedido() {
        return pedido;
    }

    public void setPedido(pedido pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}

