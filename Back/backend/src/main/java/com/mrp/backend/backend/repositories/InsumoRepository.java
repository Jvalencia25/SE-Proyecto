package com.mrp.backend.backend.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.entities.Insumo;

public interface InsumoRepository extends CrudRepository<Insumo, Long>{ 

    @Transactional(readOnly = true)
    @Query(value="select * from insumo i where i.id =:id", nativeQuery = true)
    Optional<Insumo> getInsumobyId(Long id);

    @Transactional(readOnly = true)
    @Query(value="select * from insumo i where i.nombre =:name", nativeQuery = true)
    Optional<Insumo> getInsumobyName(String name);
}
