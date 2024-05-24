package com.mrp.backend.backend.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.mrp.backend.backend.models.entities.Producto;

public interface ProductoRepository extends CrudRepository<Producto, Long> {

    @Query(value="select * from producto p where p.nombre =:nombre fetch first 1 row only", nativeQuery = true)
    Optional<Producto> findByName(@Param("nombre") String nombre);
}
