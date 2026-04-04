package com.ilena.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para resposta de operações com treino
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TreinoResponse {
    private Integer id;
    private String nome;
    private String tipo;
    private Integer duracaoMinutos;
    private String observacoes;
    private String mensagem;
}

