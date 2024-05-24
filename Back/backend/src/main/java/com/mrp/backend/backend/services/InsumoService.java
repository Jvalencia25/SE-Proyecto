package com.mrp.backend.backend.services;

import java.util.Optional;

import com.mrp.backend.backend.models.entities.Insumo;

public interface InsumoService {
    public Insumo getInsumobyId(Long id);
    public Optional<Insumo> getInsumobyName(String name);
}
