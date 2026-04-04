package com.ilena.backend.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Treino {
    private Integer id;

    @NotBlank(message = "Nome do treino é obrigatório")
    private String nome;

    @NotBlank(message = "Tipo do treino é obrigatório")
    private String tipo;

    @Positive(message = "Duração deve ser maior que 0")
    private Integer duracaoMinutos;

    private String observacoes;
}

