package com.ilena.backend.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para requisição de criação/atualização de treino
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TreinoRequest {

    @NotBlank(message = "Nome do treino é obrigatório")
    private String nome;

    @NotBlank(message = "Tipo do treino é obrigatório")
    private String tipo;

    @Positive(message = "Duração deve ser maior que 0 minutos")
    private Integer duracaoMinutos;

    private String observacoes;
}

