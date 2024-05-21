package com.mrp.backend.backend.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mrp.backend.backend.services.UsuarioService;
import com.mrp.backend.backend.config.exception;
import com.mrp.backend.backend.models.entities.DataLogin;
import com.mrp.backend.backend.models.entities.Usuario;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;



@RestController
@RequestMapping("/users")
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
    public ResponseEntity<?> create(@RequestBody Usuario user) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.save(user));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody DataLogin datos) {

        var user = service.login(datos.getCorreo(), datos.getContraseña());

        if(user.isPresent()){
            return ResponseEntity.ok(user.get());
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> remove(@PathVariable Long id) {
        Optional<Usuario> o = service.findbyId(id);

        if (o.isPresent()){
            service.remove(id);
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
