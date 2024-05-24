package com.mrp.backend.backend.repositories;

import com.mrp.backend.backend.models.APIModels.InventarioInsumo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@Repository
public class InventarioJdbcRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<InventarioInsumo> getInventarios() {
        String sql = "SELECT i2.id, i2.nombre, i.cantidad, i2.unidad_medida, i.fecha_vencimiento, i.fecha_ingreso, i2.precio, i2.proveedor " +
                     "FROM inventario i JOIN insumo i2 ON i.id_insumo = i2.id";

        return jdbcTemplate.query(sql, (rs, rowNum) -> mapRowToInventarioInsumo(rs));
    }

    private InventarioInsumo mapRowToInventarioInsumo(ResultSet rs) throws SQLException {
        Long id = rs.getLong("id");
        String nombre = rs.getString("nombre");
        BigDecimal cantidad = rs.getBigDecimal("cantidad");
        String unidadMedida = rs.getString("unidad_medida");
        Date fechaVencimiento = rs.getDate("fecha_vencimiento");
        Date fechaIngreso = rs.getDate("fecha_ingreso");
        String precio = rs.getString("precio");
        String proveedor = rs.getString("proveedor");

        return new InventarioInsumo(id, nombre, cantidad, unidadMedida, fechaVencimiento, fechaIngreso, precio, proveedor);
    }
}

