package com.mrp.backend.backend.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import com.mrp.backend.backend.models.entities.Inventario;
import com.mrp.backend.backend.models.entities.keys.InventarioKey;

public interface InventarioRepository extends CrudRepository<Inventario, InventarioKey>{

    @Transactional(readOnly = true)
    @Query(value= "SELECT new com.mrp.backend.backend.models.InventarioInsumo(i2.id, i2.nombre, i.cantidad, " +
           "i2.unidad_medida, i.fecha_vencimiento, i.fecha_ingreso, i2.precio, i2.proveedor) " +
           "FROM Inventario i JOIN i.insumo i2", nativeQuery = true)
    List<InventarioInsumo> getInventarios();

    @Query(value="select * from inventario i where i.id_insumo =:idIngrediente fetch first 1 row only", nativeQuery = true)
    Inventario findByIdIngrediente(Long idIngrediente);
}
