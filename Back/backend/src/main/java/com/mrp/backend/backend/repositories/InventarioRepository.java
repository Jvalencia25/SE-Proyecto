package com.mrp.backend.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mrp.backend.backend.models.entities.Inventario;
import com.mrp.backend.backend.models.entities.keys.InventarioKey;

public interface InventarioRepository extends CrudRepository<Inventario, InventarioKey>{

}
