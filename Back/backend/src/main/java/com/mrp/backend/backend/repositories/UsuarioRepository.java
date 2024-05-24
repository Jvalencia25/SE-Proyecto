package com.mrp.backend.backend.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.models.entities.Usuario;

public interface UsuarioRepository extends CrudRepository<Usuario, Long>{

    @Transactional(readOnly = true)
    @Query(value="select * from usuario u where u.activo = true", nativeQuery = true)
    List<Usuario> findAll();

    @Query(value="select * from usuario u where u.correo =:correo fetch first 1 row only", nativeQuery = true)
    Optional<Usuario> findByCorreo(@Param("correo") String correo);

    @Modifying
    @Transactional
    @Query(value="UPDATE usuario SET activo = FALSE WHERE id = :id", nativeQuery = true)
    void remove(@Param("id") Long id);

    @Query(value="select * from usuario u where u.nombre =:nombre fetch first 1 row only", nativeQuery = true)
    Optional<Usuario> findByName(@Param("nombre") String nombre);
}
