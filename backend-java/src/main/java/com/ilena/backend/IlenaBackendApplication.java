package com.ilena.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;

@SpringBootApplication
@OpenAPIDefinition(
    info = @Info(
        title = "Ilena App API",
        version = "0.2.0",
        description = "Backend da assistente pessoal Ilena - Migrado para Java + Spring Boot"
    )
)
public class IlenaBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(IlenaBackendApplication.class, args);
    }
}

