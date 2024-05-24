package com.mrp.backend.backend.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.mrp.backend.backend.models.entities.IngredienteProducto;
import com.mrp.backend.backend.models.entities.keys.IngredienteProductoKey;

public interface IngredienteProductoRepository extends CrudRepository<IngredienteProducto, IngredienteProductoKey>{

    @Query(value="select * from ingrediente_producto i where i.id_producto =:idProducto", nativeQuery = true)
    List<IngredienteProducto> findByIdProducto(Long idProducto);
}
