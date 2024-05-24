package com.mrp.backend.backend.services.implementations;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.models.entities.IngredienteProducto;
import com.mrp.backend.backend.repositories.IngredienteProductoRepository;
import com.mrp.backend.backend.services.IngredienteProductoService;

@Service
public class IngredienteProductoServiceImpl implements IngredienteProductoService{

    @Autowired
    private IngredienteProductoRepository repository;

    @Override
    public Iterable<IngredienteProducto> getAll() {
        return repository.findAll();
    }

    @Override
    public List<IngredienteProducto> getById(Long id) {
        return repository.findByIdProducto(id);
    }
}
