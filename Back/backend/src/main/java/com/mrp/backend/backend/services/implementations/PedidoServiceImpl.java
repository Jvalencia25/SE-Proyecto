package com.mrp.backend.backend.services.implementations;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import com.mrp.backend.backend.services.IngredienteProductoService;
import com.mrp.backend.backend.services.InventarioService;
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
    private InventarioService inventarioService;

    @Autowired
    private PedidosJdbcRepository jdbcRepository;

    @Autowired
    private IngredienteProductoService ingredienteService;

    @Override
    public java.util.List<PedidoProductos> getAll() {
        return jdbcRepository.getPedidos();
    }

    @Override
    @Transactional
    public Pedido save(PedidoSave datos) {
        // Buscar al vendedor (empleado)
        Optional<Usuario> vendedor = usuarioRepository.findByName(datos.getNombre_empleado());
        if (!vendedor.isPresent()) {
            throw new RuntimeException("Empleado no encontrado");
        }
        Usuario vendedorEntity = vendedor.get();

        // Buscar el producto
        Optional<Producto> producto = productoRepository.findByName(datos.getNombre_producto());
        if (!producto.isPresent()) {
            throw new RuntimeException("Producto no encontrado");
        }
        Producto productoEntity = producto.get();

        // Crear y configurar el nuevo pedido
        Pedido pedido = new Pedido();
        pedido.setDireccion(datos.getDireccion());
        pedido.setFecha(datos.getFecha());
        pedido.setNombreCliente(datos.getNombre_cliente());
        pedido.setIdEmpleado(vendedorEntity.getId()); // Asignar el vendedor al pedido

        // Guardar el pedido en la base de datos para generar el ID
        repository.save(pedido);

        // Crear y configurar el detalle del pedido (ProductosPedido)
        ProductosPedido productosPedido = new ProductosPedido();
        ProductosPedidoKey productosPedidoKey = new ProductosPedidoKey();
        productosPedidoKey.setIdPedido(pedido.getId()); // Asignar el ID generado del pedido
        productosPedidoKey.setIdProducto(productoEntity.getId());
        
        productosPedido.setId(productosPedidoKey);
        productosPedido.setPedido(pedido); // Asignar el pedido al detalle del pedido
        productosPedido.setProducto(productoEntity); // Asignar el producto al detalle del pedido

        // Guardar el detalle del pedido en la base de datos
        productospedidoRepository.save(productosPedido);

        // Llamar a los servicios necesarios (por ejemplo, para procesar ingredientes e inventario)
        
        inventarioService.reduce(ingredienteService.getById(productoEntity.getId())); // Asegúrate de implementar correctamente este método

        return pedido;
    }

    

}
