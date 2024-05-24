package com.mrp.backend.backend.models.entities;

import com.mrp.backend.backend.models.entities.keys.ProductosPedidoKey;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;

@Entity
public class ProductosPedido {

    @EmbeddedId
    private ProductosPedidoKey id;

    @ManyToOne
    private Pedido pedido;

    @ManyToOne
    private Producto producto;

    public ProductosPedidoKey getId() {
        return id;
    }

    public void setId(ProductosPedidoKey id) {
        this.id = id;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}

