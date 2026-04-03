# Changelog

Todas as mudanças relevantes deste projeto serão documentadas neste arquivo.

O formato segue o padrão [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/)
e este projeto adota [Versionamento Semântico](https://semver.org/lang/pt-BR/).

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
