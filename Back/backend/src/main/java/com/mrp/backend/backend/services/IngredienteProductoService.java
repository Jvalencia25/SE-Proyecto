package com.mrp.backend.backend.services;

import java.util.List;

import com.mrp.backend.backend.models.entities.IngredienteProducto;

public interface IngredienteProductoService {

    Iterable<IngredienteProducto> getAll();
    List<IngredienteProducto> getById(Long id);
}
