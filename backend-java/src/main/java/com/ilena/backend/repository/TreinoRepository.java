package com.ilena.backend.repository;

import com.ilena.backend.model.Treino;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Repositório em memória para Treinos
 * Em produção, seria substitído por um banco de dados (PostgreSQL, MongoDB, etc)
 */
@Repository
public class TreinoRepository {

    private final List<Treino> store = new ArrayList<>();
    private final AtomicInteger nextId = new AtomicInteger(1);

    /**
     * Salva um novo treino
     */
    public Treino save(Treino treino) {
        if (treino.getId() == null) {
            treino.setId(nextId.getAndIncrement());
        }
        store.add(treino);
        return treino;
    }

    /**
     * Lista todos os treinos
     */
    public List<Treino> findAll() {
        return new ArrayList<>(store);
    }

    /**
     * Busca um treino por ID
     */
    public Optional<Treino> findById(Integer id) {
        return store.stream()
                .filter(t -> t.getId().equals(id))
                .findFirst();
    }

    /**
     * Deleta um treino por ID
     */
    public boolean deleteById(Integer id) {
        return store.removeIf(t -> t.getId().equals(id));
    }

    /**
     * Atualiza um treino existente
     */
    public Optional<Treino> update(Integer id, Treino treino) {
        Optional<Treino> existing = findById(id);
        if (existing.isPresent()) {
            Treino t = existing.get();
            t.setNome(treino.getNome());
            t.setTipo(treino.getTipo());
            t.setDuracaoMinutos(treino.getDuracaoMinutos());
            t.setObservacoes(treino.getObservacoes());
            return Optional.of(t);
        }
        return Optional.empty();
    }
}

