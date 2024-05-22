package com.mrp.backend.backend.repositories;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.entities.Usuario;
import com.mrp.backend.backend.models.entities.pedido;

public interface PedidoRepository extends CrudRepository<pedido, Long>{

 
}
