package com.mrp.backend.backend.services.implementations;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.models.entities.Producto;
import com.mrp.backend.backend.repositories.ProductoRepository;
import com.mrp.backend.backend.services.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService{

    @Autowired
    private ProductoRepository repository;

    @Override
    public Optional<Producto> getProductobyName(String name) {
        return repository.findByName(name);
    }

    
}
