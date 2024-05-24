package com.mrp.backend.backend.services.implementations;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.APIModels.IngresoInventario;
import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import com.mrp.backend.backend.models.entities.Insumo;
import com.mrp.backend.backend.models.entities.Inventario;
import com.mrp.backend.backend.models.entities.keys.InventarioKey;
import com.mrp.backend.backend.repositories.InsumoRepository;
import com.mrp.backend.backend.repositories.InventarioJdbcRepository;
import com.mrp.backend.backend.repositories.InventarioRepository;
import com.mrp.backend.backend.services.InventarioService;

@Service
public class InventarioServiceImpl implements InventarioService{

    @Autowired
    private InventarioJdbcRepository inventarioJdbcRepository;

    @Autowired
    private InventarioRepository inventarioRepository;

    @Autowired
    private InsumoRepository insumoRepository;

    @Override
    public List<InventarioInsumo> getInventarios() {
        return inventarioJdbcRepository.getInventarios();
    }

    @Override
    public Inventario save(IngresoInventario datos) {

        Optional<Insumo> insumo = insumoRepository.getInsumobyName(datos.getName());
        if (!insumo.isPresent()) throw new exception("No se encontró el insumo");
        Insumo i=insumo.get();

        Inventario inventario = new Inventario();

        InventarioKey ik = new InventarioKey();
        ik.setIdInsumo(i.getId());

        Date current=new Date();
        ik.setFechaIngreso(current);

        inventario.setId(ik);
        inventario.setCantidad(datos.getCantidad());
        inventario.setFechaVencimiento(datos.getFecha_vencimiento());

        return inventarioRepository.save(inventario);
    }

}
