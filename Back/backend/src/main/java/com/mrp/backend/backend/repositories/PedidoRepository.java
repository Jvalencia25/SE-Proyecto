package com.mrp.backend.backend.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.entities.Pedido;

public interface PedidoRepository extends CrudRepository<Pedido, Long>{

   @Transactional
   @Query(value="", nativeQuery = true)
   Pedido save(Pedido pedido);
 
}
