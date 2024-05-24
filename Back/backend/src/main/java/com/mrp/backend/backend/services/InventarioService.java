package com.mrp.backend.backend.services;

import java.util.List;

import com.mrp.backend.backend.models.APIModels.IngresoInventario;
import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import com.mrp.backend.backend.models.entities.IngredienteProducto;
import com.mrp.backend.backend.models.entities.Inventario;

public interface InventarioService {
    List<InventarioInsumo> getInventarios();
    Inventario save(IngresoInventario datos);
    void reduce(Iterable<IngredienteProducto> ingredientes);
}
