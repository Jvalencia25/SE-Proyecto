package com.mrp.backend.backend.controllers;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mrp.backend.backend.services.InventarioService;
import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.APIModels.IngresoInventario;
import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import com.mrp.backend.backend.models.entities.Inventario;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/inventory")
@CrossOrigin(origins="http://localhost:52944")
public class InventarioController {

    @Autowired
    private InventarioService service;

    @GetMapping
    public List<InventarioInsumo> getInventarios() {
        return service.getInventarios();
    }

    @PostMapping
    public Inventario save(@RequestBody IngresoInventario datos) {
        return service.save(datos);
    }
    
    @ControllerAdvice
    public class GlobalExceptionHandler {

        @ExceptionHandler(exception.class)
        public ResponseEntity<String> handleResourceNotFoundException(exception ex) {
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.NOT_FOUND);
        }
    } 
}
