package com.mrp.backend.backend.models.entities.keys;

import java.io.Serializable;
import jakarta.persistence.Embeddable;

@Embeddable
public class ProductosPedidoKey implements Serializable {

    private Long idPedido;
    private Long idProducto;

    public Long getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Long idPedido) {
        this.idPedido = idPedido;
    }

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductosPedidoKey that = (ProductosPedidoKey) o;

        if (!idPedido.equals(that.idPedido)) return false;
        return idProducto.equals(that.idProducto);
    }

    @Override
    public int hashCode() {
        int result = idPedido.hashCode();
        result = 31 * result + idProducto.hashCode();
        return result;
    }
}
