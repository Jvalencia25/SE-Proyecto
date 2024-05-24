package com.mrp.backend.backend.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mrp.backend.backend.services.UsuarioService;
import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.APIModels.DataLogin;
import com.mrp.backend.backend.models.APIModels.DeleteLogin;
import com.mrp.backend.backend.models.APIModels.IngresoUsuario;
import com.mrp.backend.backend.models.entities.Usuario;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@RestController
@RequestMapping("/users")
@CrossOrigin(origins="http://localhost:52944")
public class UsuarioController {

    @Autowired
    private UsuarioService service;

    @GetMapping
    public List<Usuario> getUsuarios() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id) {
        Optional<Usuario> userOptionl=service.findbyId(id);

        if(userOptionl.isPresent()){
            return ResponseEntity.ok(userOptionl.orElseThrow());
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody IngresoUsuario datos) {

        return ResponseEntity.status(HttpStatus.CREATED).body(service.save(datos));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody DataLogin datos) {

        var user = service.login(datos.getCorreo(), datos.getContraseña());

        if(user.isPresent()){
            return ResponseEntity.ok(user.get());
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping
    public ResponseEntity<?> remove(@RequestBody DeleteLogin datos) {
        
        Optional<Usuario> o = service.findbyId(datos.getId());

        if (o.isPresent()){
            service.remove(datos);
            return ResponseEntity.ok("Usuario eliminado");
        }
        return ResponseEntity.notFound().build();
    }

    @ControllerAdvice
    public class GlobalExceptionHandler {

        @ExceptionHandler(exception.class)
        public ResponseEntity<String> handleResourceNotFoundException(exception ex) {
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
    
}
