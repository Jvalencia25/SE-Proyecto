package com.mrp.backend.backend.services;

import java.util.Optional;

import com.mrp.backend.backend.models.entities.Producto;

public interface ProductoService {

    Optional<Producto> getProductobyName(String name);
}
