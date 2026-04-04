package com.ilena.backend.controller;

import com.ilena.backend.dto.TreinoRequest;
import com.ilena.backend.dto.TreinoResponse;
import com.ilena.backend.service.TreinoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

/**
 * Controller para operações com Treinos
 */
@RestController
@RequestMapping("/treino")
@Tag(name = "Treino", description = "Operações relacionadas a treinos")
public class TreinoController {

    @Autowired
    private TreinoService treinoService;

    /**
     * Cria um novo treino
     */
    @PostMapping
    @Operation(summary = "Criar novo treino", description = "Registra um novo treino no sistema")
    public ResponseEntity<TreinoResponse> criarTreino(@Valid @RequestBody TreinoRequest request) {
        TreinoResponse response = treinoService.criarTreino(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    /**
     * Lista todos os treinos
     */
    @GetMapping
    @Operation(summary = "Listar treinos", description = "Retorna a lista de todos os treinos registrados")
    public ResponseEntity<List<TreinoResponse>> listarTreinos() {
        List<TreinoResponse> treinos = treinoService.listarTreinos();
        return ResponseEntity.ok(treinos);
    }

    /**
     * Busca um treino por ID
     */
    @GetMapping("/{id}")
    @Operation(summary = "Obter treino por ID", description = "Retorna os detalhes de um treino específico")
    public ResponseEntity<TreinoResponse> obterTreinoPorId(@PathVariable Integer id) {
        Optional<TreinoResponse> treino = treinoService.obterTreinoPorId(id);
        return treino
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Atualiza um treino existente
     */
    @PutMapping("/{id}")
    @Operation(summary = "Atualizar treino", description = "Atualiza os dados de um treino existente")
    public ResponseEntity<TreinoResponse> atualizarTreino(
            @PathVariable Integer id,
            @Valid @RequestBody TreinoRequest request) {
        Optional<TreinoResponse> treino = treinoService.atualizarTreino(id, request);
        return treino
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    /**
     * Deleta um treino
     */
    @DeleteMapping("/{id}")
    @Operation(summary = "Deletar treino", description = "Remove um treino do sistema")
    public ResponseEntity<Void> deletarTreino(@PathVariable Integer id) {
        boolean deleted = treinoService.deletarTreino(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}

