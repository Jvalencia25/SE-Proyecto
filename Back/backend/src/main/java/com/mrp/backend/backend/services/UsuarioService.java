package com.mrp.backend.backend.services;

import java.util.List;
import java.util.Optional;

import com.mrp.backend.backend.models.entities.Usuario;

public interface UsuarioService {
    List<Usuario> findAll();
    Usuario save(Usuario user);
    Optional<Usuario> findbyId(Long id);
    Optional<Usuario> findbyCorreo(String correo);
    Optional<Usuario> login(String correo, String password);
    void remove(Long id);
}
