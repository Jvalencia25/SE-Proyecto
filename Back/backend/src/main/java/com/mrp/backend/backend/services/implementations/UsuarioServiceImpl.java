package com.mrp.backend.backend.services.implementations;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.entities.Usuario;
import com.mrp.backend.backend.models.inputModels.DeleteLogin;
import com.mrp.backend.backend.models.inputModels.IngresoUsuario;
import com.mrp.backend.backend.repositories.UsuarioRepository;
import com.mrp.backend.backend.services.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService{

    @Autowired
    private UsuarioRepository repository;

    private final PasswordEncoder passwordEncoder;

    public UsuarioServiceImpl(UsuarioRepository repository){
        this.repository = repository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Usuario> findAll() {
        return (List<Usuario>) repository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Usuario> findbyId(Long id) {
        return repository.findById(id);
    }

    @Override
    @Transactional
    public Optional<Usuario> login(String correo, String password) {

        Optional<Usuario> u = repository.findByCorreo(correo);

        if(!u.isPresent()) Optional.empty();

        if (this.passwordEncoder.matches(password, u.get().getContraseña())) {
            return u;
        }
        return Optional.empty();
    }

    @Override
    @Transactional
    public void remove(DeleteLogin datos) {

        Optional<Usuario> a = findbyId(datos.getId());

        if (!a.isPresent()) throw new exception("No se encontró el usuario");

        Usuario admin=a.get();

        if (!this.passwordEncoder.matches(datos.getContraseña(), admin.getContraseña() )) throw new exception("Contraseña no válida");

        if (admin.getNivel_acceso().equals("admin")){
            repository.remove(datos.getUserId());
        }
    }

    @Override
    @Transactional
    public Usuario save(IngresoUsuario datos) {

        Optional<Usuario> a = findbyId(datos.getId());

        if (!a.isPresent()) throw new exception("No se encontró el usuario");

        Usuario admin=a.get();

        if (!this.passwordEncoder.matches(datos.getContraseña(), admin.getContraseña() )) throw new exception("Contraseña no válida");
        
        if (admin.getNivel_acceso().equals("admin")){

            Optional<Usuario> u = repository.findByCorreo(datos.getCorreo_nuevo());

            if (u.isPresent() && u.get().isActivo()) throw new exception("Ya existe un usuario con el mismo email");

            Usuario user = new Usuario();
            user.setNombre(datos.getNombre_nuevo());
            user.setCorreo(datos.getCorreo_nuevo());
            user.setNivel_acceso(datos.getNivel_acceso());

            String encoderPassword = this.passwordEncoder.encode(datos.getContraseña_nuevo());
            user.setContraseña(encoderPassword);

            return repository.save(user);
        }

        throw new exception("No cuenta con los permisos necesarios");
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Usuario> findbyCorreo(String correo) {
        return repository.findByCorreo(correo);
    }

}
