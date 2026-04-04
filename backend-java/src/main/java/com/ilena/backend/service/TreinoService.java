package com.ilena.backend.service;

import com.ilena.backend.dto.TreinoRequest;
import com.ilena.backend.dto.TreinoResponse;
import com.ilena.backend.model.Treino;
import com.ilena.backend.repository.TreinoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * Serviço de negócio para operações com Treinos
 */
@Service
public class TreinoService {

    @Autowired
    private TreinoRepository treinoRepository;

    /**
     * Cria um novo treino
     */
    public TreinoResponse criarTreino(TreinoRequest request) {
        Treino treino = new Treino();
        treino.setNome(request.getNome());
        treino.setTipo(request.getTipo());
        treino.setDuracaoMinutos(request.getDuracaoMinutos());
        treino.setObservacoes(request.getObservacoes());

        Treino saved = treinoRepository.save(treino);

        return new TreinoResponse(
                saved.getId(),
                saved.getNome(),
                saved.getTipo(),
                saved.getDuracaoMinutos(),
                saved.getObservacoes(),
                String.format("Treino '%s' registrado com sucesso!", saved.getNome())
        );
    }

    /**
     * Lista todos os treinos
     */
    public List<TreinoResponse> listarTreinos() {
        return treinoRepository.findAll().stream()
                .map(t -> new TreinoResponse(
                        t.getId(),
                        t.getNome(),
                        t.getTipo(),
                        t.getDuracaoMinutos(),
                        t.getObservacoes(),
                        "ok"
                ))
                .collect(Collectors.toList());
    }

    /**
     * Busca um treino por ID
     */
    public Optional<TreinoResponse> obterTreinoPorId(Integer id) {
        return treinoRepository.findById(id)
                .map(t -> new TreinoResponse(
                        t.getId(),
                        t.getNome(),
                        t.getTipo(),
                        t.getDuracaoMinutos(),
                        t.getObservacoes(),
                        "ok"
                ));
    }

    /**
     * Atualiza um treino existente
     */
    public Optional<TreinoResponse> atualizarTreino(Integer id, TreinoRequest request) {
        Treino treino = new Treino();
        treino.setNome(request.getNome());
        treino.setTipo(request.getTipo());
        treino.setDuracaoMinutos(request.getDuracaoMinutos());
        treino.setObservacoes(request.getObservacoes());

        return treinoRepository.update(id, treino)
                .map(t -> new TreinoResponse(
                        t.getId(),
                        t.getNome(),
                        t.getTipo(),
                        t.getDuracaoMinutos(),
                        t.getObservacoes(),
                        String.format("Treino '%s' atualizado com sucesso!", t.getNome())
                ));
    }

    /**
     * Deleta um treino
     */
    public boolean deletarTreino(Integer id) {
        return treinoRepository.deleteById(id);
    }
}

