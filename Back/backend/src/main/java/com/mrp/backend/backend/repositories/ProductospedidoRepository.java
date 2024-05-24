package com.mrp.backend.backend.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.entities.ProductosPedido;
import com.mrp.backend.backend.models.entities.keys.ProductosPedidoKey;

public interface ProductospedidoRepository extends CrudRepository<ProductosPedido, ProductosPedidoKey> {


}
