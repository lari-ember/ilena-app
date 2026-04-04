# Changelog

Todas as mudanças relevantes deste projeto serão documentadas neste arquivo.

O formato segue o padrão [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/)
e este projeto adota [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [0.2.0] - 2026-04-04

### Adicionado
- **Backend Java + Spring Boot 3.2** em paralelo ao FastAPI
  - Migração completa da lógica de negócio de Python para Java
  - Controllers REST com endpoints espelhados: `GET /`, `POST /treino`, `GET /treino/{id}`, `PUT /treino/{id}`, `DELETE /treino/{id}`
  - Documentação automática via Swagger UI (`/swagger-ui.html`)
  - Validação de entrada com Jakarta Bean Validation
  - Separação clara entre DTOs (Request/Response) e Entidade (Model)
  - Repositório em memória preparado para integração com banco de dados
- **Docker Compose atualizado** com suporte a backend Java
  - Backend Python rodando em `localhost:8001` (renomeado para referência)
  - Backend Java rodando em `localhost:8000` (padrão)
- **Dockerfile otimizado** com build multi-stage para Java (Maven + JRE)

### Alterado
- Backend Python mantido como referência legada (sem remoção, para comparação)
- Docker Compose: renomeamento de containers para clareza (`ilena-backend-python` vs `ilena-backend-java`)

### Por que esta migração?
Alinhamento com vagas de **Fullstack Java + Angular** em empresas como:
- CI&T (vaga Mid Level PcD)
- Stefanini, BIP Brasil, TOTVS, Accenture, T-Systems, Olist

### Stack Java
- Spring Boot 3.2.4
- Maven 3.9.6
- Java 17 LTS
- Springdoc OpenAPI (Swagger)
- Jakarta Bean Validation
- Lombok (reduce boilerplate)

## [0.1.0] - 2026-04-03

### Adicionado
- Backend FastAPI com endpoint `POST /treino` e `GET /treino`
- Documentação automática via `/docs` (Swagger UI) e `/redoc`
- Dockerfile e docker-compose para execução do backend em container
- Projeto Android com arquitetura MVVM
- Tela principal com campos de entrada e botão para registrar treino
- Integração com backend via Retrofit 2 + OkHttp
- Modelos Kotlin (`TreinoRequest`, `TreinoResponse`) mapeados com Gson
- `TreinoViewModel` com coroutines para chamadas assíncronas
- Exibição da resposta da API na interface
