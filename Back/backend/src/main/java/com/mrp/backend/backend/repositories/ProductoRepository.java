package com.mrp.backend.backend.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mrp.backend.backend.models.entities.Producto;

public interface ProductoRepository extends CrudRepository<Producto, Long> {

}
