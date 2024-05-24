package com.mrp.backend.backend.services.implementations;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.APIModels.PedidoProductos;
import com.mrp.backend.backend.models.APIModels.PedidoSave;
import com.mrp.backend.backend.models.entities.Pedido;
import com.mrp.backend.backend.models.entities.Producto;
import com.mrp.backend.backend.models.entities.Usuario;
import com.mrp.backend.backend.models.entities.keys.ProductosPedidoKey;
import com.mrp.backend.backend.models.entities.ProductosPedido;
import com.mrp.backend.backend.repositories.PedidoRepository;
import com.mrp.backend.backend.repositories.PedidosJdbcRepository;
import com.mrp.backend.backend.repositories.ProductoRepository;
import com.mrp.backend.backend.repositories.UsuarioRepository;
import com.mrp.backend.backend.repositories.ProductospedidoRepository;
import com.mrp.backend.backend.services.PedidoService;

@Service
public class PedidoServiceImpl implements PedidoService{

    @Autowired
    private PedidoRepository repository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ProductoRepository productoRepository;
    
    @Autowired
    private ProductospedidoRepository productospedidoRepository;

    @Autowired
    private PedidosJdbcRepository jdbcRepository;

    @Override
    public java.util.List<PedidoProductos> getAll() {
        return jdbcRepository.getPedidos();
    }

    @Override
    public Pedido save(PedidoSave datos) {

        Optional<Usuario> vendedor = usuarioRepository.findByName(datos.getNombre_empleado());
        if (!vendedor.isPresent()) throw new exception("Empleado no encontrado");
        Usuario v=vendedor.get();

        Optional<Producto> producto = productoRepository.findByName(datos.getNombre_producto());
        if(!producto.isPresent()) throw new exception("Producto no encontrado");
        Producto p=producto.get();

        Pedido pp = new Pedido();

        pp.setDireccion(datos.getDireccion());
        pp.setFecha(datos.getFecha());
        pp.setIdEmpleado(v.getId());
        pp.setNombreCliente(datos.getNombre_cliente());

        ProductosPedido prod = new ProductosPedido();
        ProductosPedidoKey prodKey = new ProductosPedidoKey();

        prodKey.setIdPedido(pp.getId());
        prodKey.setIdProducto(p.getId());

        prod.setId(prodKey);
        prod.setPedido(pp);
        prod.setProducto(p);

        productospedidoRepository.save(prod);

        return repository.save(pp);
    }

    

}
