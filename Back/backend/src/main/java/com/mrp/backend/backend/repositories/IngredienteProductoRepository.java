package com.mrp.backend.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mrp.backend.backend.models.entities.IngredienteProducto;
import com.mrp.backend.backend.models.entities.keys.IngredienteProductoKey;

public interface IngredienteProductoRepository extends CrudRepository<IngredienteProducto, IngredienteProductoKey>{

}
