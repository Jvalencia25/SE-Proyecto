package com.mrp.backend.backend.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mrp.backend.backend.models.APIModels.PedidoProductos;
import com.mrp.backend.backend.models.APIModels.PedidoSave;
import com.mrp.backend.backend.models.entities.Pedido;
import com.mrp.backend.backend.services.PedidoService;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




@RestController
@RequestMapping("/orders")
@CrossOrigin(origins="http://localhost:52944")
public class PedidosController {

    @Autowired
    private PedidoService service;

    @GetMapping
    public Iterable<PedidoProductos> getAll() {
        return service.getAll();
    }

    @PostMapping
    public Pedido save(@RequestBody PedidoSave datos) {
        return service.save(datos);
    }
    
    
}
