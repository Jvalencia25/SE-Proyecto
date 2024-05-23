package com.mrp.backend.backend.services;

import java.util.List;
import java.util.Optional;

import com.mrp.backend.backend.models.entities.Usuario;
import com.mrp.backend.backend.models.inputModels.DeleteLogin;
import com.mrp.backend.backend.models.inputModels.IngresoUsuario;

public interface UsuarioService {
    List<Usuario> findAll();
    Usuario save(IngresoUsuario datos);
    Optional<Usuario> findbyId(Long id);
    Optional<Usuario> findbyCorreo(String correo);
    Optional<Usuario> login(String correo, String password);
    void remove(DeleteLogin datos);
}
