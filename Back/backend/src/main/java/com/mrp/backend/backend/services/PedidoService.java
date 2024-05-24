package com.mrp.backend.backend.services;

import java.util.List;

import com.mrp.backend.backend.models.APIModels.PedidoProductos;
import com.mrp.backend.backend.models.APIModels.PedidoSave;
import com.mrp.backend.backend.models.entities.Pedido;

public interface PedidoService {
    List<PedidoProductos> getAll();
    Pedido save(PedidoSave datos);
}
