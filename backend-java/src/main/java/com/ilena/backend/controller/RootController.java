package com.ilena.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Controller raiz da API
 */
@RestController
@RequestMapping("/")
public class RootController {

    @GetMapping
    public Map<String, Object> root() {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "ok");
        response.put("message", "Ilena API v0.2.0 (Java + Spring Boot)");
        response.put("version", "0.2.0");
        response.put("backend", "Java/Spring Boot");
        return response;
    }
}

