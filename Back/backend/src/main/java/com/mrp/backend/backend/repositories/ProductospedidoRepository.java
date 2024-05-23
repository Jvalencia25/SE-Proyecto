package com.mrp.backend.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mrp.backend.backend.models.entities.ProductosPedido;
import com.mrp.backend.backend.models.entities.keys.ProductosPedidoKey;

public interface ProductospedidoRepository extends CrudRepository<ProductosPedido, ProductosPedidoKey> {

}
