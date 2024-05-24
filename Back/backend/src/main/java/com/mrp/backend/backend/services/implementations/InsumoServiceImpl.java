package com.mrp.backend.backend.services.implementations;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.entities.Insumo;
import com.mrp.backend.backend.repositories.InsumoRepository;
import com.mrp.backend.backend.services.InsumoService;

@Service
public class InsumoServiceImpl implements InsumoService{

    @Autowired
    private InsumoRepository repository;

    @Override
    public Insumo getInsumobyId(Long id) {
        
        Optional<Insumo> i = repository.getInsumobyId(id);

        if (!i.isPresent()) throw new exception("No se encontró el insumo");

        return i.get();
    }

    @Override
    public Optional<Insumo> getInsumobyName(String name) {

        Optional<Insumo> i=repository.getInsumobyName(name);

        if (!i.isPresent()) throw new exception("No se encontró el insumo");

        return i;
    }

}
