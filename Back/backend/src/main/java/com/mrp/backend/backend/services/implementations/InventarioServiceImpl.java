package com.mrp.backend.backend.services.implementations;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.APIModels.IngresoInventario;
import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import com.mrp.backend.backend.models.entities.IngredienteProducto;
import com.mrp.backend.backend.models.entities.Insumo;
import com.mrp.backend.backend.models.entities.Inventario;
import com.mrp.backend.backend.models.entities.keys.IngredienteProductoKey;
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

    @Override
    public void reduce(Iterable<IngredienteProducto> ingredientes) {

        for (IngredienteProducto ingredienteProducto : ingredientes) {
            if (ingredienteProducto == null) {
            throw new IllegalArgumentException("Ingrediente o Insumo nulo en la lista de ingredientes.");
            }

            IngredienteProductoKey llavep=ingredienteProducto.getId();

            // Obtener el inventario del insumo
            Inventario inv = inventarioRepository.findByIdIngrediente(llavep.getId_ingrediente());
            if (inv == null) {
                throw new RuntimeException("Inventario no encontrado para el insumo con ID: " + ingredienteProducto.getInsumo().getId());
            }

            // Calcular la nueva cantidad
            BigDecimal cantidadActual = inv.getCantidad();
            BigDecimal cantidadRestar = ingredienteProducto.getCant();
            BigDecimal nuevaCantidad = cantidadActual.subtract(cantidadRestar);

            // Verificar si hay suficiente cantidad para restar
            if (nuevaCantidad.compareTo(BigDecimal.ZERO) < 0) {
            throw new RuntimeException("No hay suficiente cantidad en el inventario para restar.");
            }

            // Actualizar el inventario con la nueva cantidad
            inv.setCantidad(nuevaCantidad);
            inventarioRepository.save(inv);
        }
    }

}
