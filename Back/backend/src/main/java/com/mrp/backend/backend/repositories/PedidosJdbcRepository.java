
package com.mrp.backend.backend.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mrp.backend.backend.models.APIModels.PedidoProductos;

@Repository
public class PedidosJdbcRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<PedidoProductos> getPedidos() {
        String sql = "SELECT p.id AS pedido_id, p.fecha, p.direccion, p.nombre_cliente, u.nombre AS nombre_empleado, " +
                     "u.id AS id_empleado, pp.id_producto, pr.nombre AS nombre_producto, pr.precio " +
                     "FROM pedido p " +
                     "INNER JOIN usuario u ON p.id_empleado = u.id " +
                     "INNER JOIN productos_pedido pp ON p.id = pp.id_pedido " +
                     "INNER JOIN producto pr ON pp.id_producto = pr.id";

        return jdbcTemplate.query(sql, (rs, rowNum) -> mapRowToPedidos(rs));
    }

    private PedidoProductos mapRowToPedidos(ResultSet rs) throws SQLException {
        Long pedidoId = rs.getLong("pedido_id");
        Date fecha = rs.getDate("fecha");
        String direccion = rs.getString("direccion");
        String nombreCliente = rs.getString("nombre_cliente");
        String nombreEmpleado = rs.getString("nombre_empleado");
        int idEmpleado = rs.getInt("id_empleado");
        int idProducto = rs.getInt("id_producto");
        String nombreProducto = rs.getString("nombre_producto");
        String precio = rs.getString("precio");

        return new PedidoProductos(pedidoId, fecha, direccion, nombreCliente, nombreEmpleado, idEmpleado, idProducto, nombreProducto, precio);
    }
}

