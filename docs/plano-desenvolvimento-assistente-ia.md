# Plano de Desenvolvimento — Assistente Virtual com IA (Kotlin + Python)

## Contexto
Este plano foi criado com base na conversa de 26 de março:
- Objetivo: projeto pessoal para aprender programação.
- Nível técnico: iniciante.
- Plataforma: app nativo no celular.
- Stack preferida: **Android nativo com Kotlin** + **backend em Python (FastAPI)**.

A base atual do projeto ja possui:
- App Android com arquitetura MVVM e Retrofit.
- Backend FastAPI com Docker Compose.

---

## Visao geral do roadmap (15 a 16 semanas)

1. **Milestone 1 (Semanas 1-3): Fundamentos + Arquitetura do Assistente**
2. **Milestone 2 (Semanas 4-7): MVP de Chat no App**
3. **Milestone 3 (Semanas 8-10): Integracao com IA real + Seguranca**
4. **Milestone 4 (Semanas 11-13): Testes + Observabilidade**
5. **Milestone 5 (Semanas 14-16): Deploy + Release Android**

---

## Milestone 1 — Fundamentos e Arquitetura (Semanas 1-3)

**Objetivo**  
Consolidar base Android/FastAPI e preparar a arquitetura para conversa com IA.

**Definicao de pronto**  
App envia mensagem para backend e recebe resposta mock de forma estavel.

### Marcos
- [ ] Definir fluxo de dados ponta a ponta (UI -> ViewModel -> API -> Backend -> resposta).
- [ ] Criar contrato de API para chat (`POST /chat`) e health (`GET /health`).
- [ ] Criar modelos de dominio para conversa (mensagem, requisicao, resposta).
- [ ] Documentar arquitetura no `docs/`.

### Issues (M1)
- [ ] **ISSUE M1-01**: Definir arquitetura e contrato de API do assistente.  
  Labels: `P0`, `design`, `android`, `backend`  
  Estimativa: 2 dias
- [ ] **ISSUE M1-02**: Criar modelos de chat no backend (`ChatRequest`, `ChatResponse`, `Message`).  
  Labels: `P0`, `feature`, `backend`  
  Estimativa: 1-2 dias  
  Dependencia: M1-01
- [ ] **ISSUE M1-03**: Implementar `POST /chat` com resposta mock.  
  Labels: `P0`, `feature`, `backend`  
  Estimativa: 1-2 dias  
  Dependencia: M1-02

---

## Milestone 2 — MVP funcional do assistente (Semanas 4-7)

**Objetivo**  
Ter uma tela de chat usavel no Android com historico basico.

**Definicao de pronto**  
Usuario conversa com o assistente no app e visualiza respostas mock com estados de loading/erro.

### Marcos
- [ ] Criar `ChatApiService` e camada de repositorio no app.
- [ ] Criar `ChatViewModel` com estados de tela.
- [ ] Criar UI de chat (lista de mensagens + input + botao enviar).
- [ ] Persistir historico local simples (Room).

### Issues (M2)
- [ ] **ISSUE M2-01**: Criar `ChatApiService` e `ChatRepository` no Android.  
  Labels: `P0`, `feature`, `android`, `network`  
  Estimativa: 2-3 dias  
  Dependencia: M1-03
- [ ] **ISSUE M2-02**: Criar `ChatViewModel` (`Idle`, `Loading`, `Success`, `Error`).  
  Labels: `P0`, `feature`, `android`, `mvvm`  
  Estimativa: 2 dias  
  Dependencia: M2-01
- [ ] **ISSUE M2-03**: Implementar tela de chat e conectar ao ViewModel.  
  Labels: `P0`, `feature`, `android`, `ui`  
  Estimativa: 3-4 dias  
  Dependencia: M2-02
- [ ] **ISSUE M2-04**: Persistencia local de conversas com Room.  
  Labels: `P1`, `feature`, `android`, `data`  
  Estimativa: 3 dias  
  Dependencia: M2-03

---

## Milestone 3 — IA real e seguranca (Semanas 8-10)

**Objetivo**  
Substituir mock por resposta real de IA sem expor chave no app.

**Definicao de pronto**  
Endpoint de chat responde via provedor de IA real; chaves ficam apenas no backend.

### Marcos
- [ ] Criar servico de integracao com provedor LLM no backend.
- [ ] Implementar OpenAI como provedor inicial.
- [ ] Implementar Anthropic como segundo provedor opcional.
- [ ] Selecionar provedor por variavel de ambiente.
- [ ] Adicionar timeout/retry/rate limit basicos.

### Issues (M3)
- [ ] **ISSUE M3-01**: Integrar OpenAI no backend (`services/llm_provider.py`).  
  Labels: `P0`, `feature`, `backend`, `ai`  
  Estimativa: 2-3 dias  
  Dependencia: M1-03
- [ ] **ISSUE M3-02**: Integrar Anthropic com interface comum.  
  Labels: `P1`, `feature`, `backend`, `ai`  
  Estimativa: 2-3 dias  
  Dependencia: M3-01
- [ ] **ISSUE M3-03**: Configurar selecao de provedor via ambiente.  
  Labels: `P1`, `feature`, `backend`, `config`  
  Estimativa: 1 dia  
  Dependencia: M3-01
- [ ] **ISSUE M3-04**: Seguranca de chaves (`.env`, segredo no servidor, sem chave no app).  
  Labels: `P0`, `security`, `backend`, `android`  
  Estimativa: 2 dias  
  Dependencia: M3-01
- [ ] **ISSUE M3-05**: Rate limit e protecao basica contra abuso no `/chat`.  
  Labels: `P1`, `security`, `backend`  
  Estimativa: 1-2 dias  
  Dependencia: M1-03

---

## Milestone 4 — Qualidade: testes e observabilidade (Semanas 11-13)

**Objetivo**  
Aumentar confiabilidade, reduzir regressao e dar visibilidade de erros/performance.

**Definicao de pronto**  
Cobertura minima de testes em backend/app e logs estruturados operacionais.

### Marcos
- [ ] Testes unitarios e de integracao no backend.
- [ ] Testes de ViewModel e fluxo principal no Android.
- [ ] Logs estruturados + request id + metricas basicas.

### Issues (M4)
- [ ] **ISSUE M4-01**: Criar testes backend (`pytest` + `httpx`).  
  Labels: `P0`, `test`, `backend`  
  Estimativa: 3 dias  
  Dependencia: M3-01
- [ ] **ISSUE M4-02**: Criar testes Android para ViewModel/Repository.  
  Labels: `P1`, `test`, `android`  
  Estimativa: 3 dias  
  Dependencia: M2-03
- [ ] **ISSUE M4-03**: Observabilidade no backend (logs e metricas).  
  Labels: `P1`, `ops`, `backend`, `observability`  
  Estimativa: 2 dias  
  Dependencia: M1-03

---

## Milestone 5 — Deploy e release (Semanas 14-16)

**Objetivo**  
Colocar backend online e distribuir app para testes internos no Android.

**Definicao de pronto**  
Backend com URL estavel e app entregue em trilha interna de testes.

### Marcos
- [ ] Evoluir deploy backend para ambiente cloud.
- [ ] Ajustar variaveis de ambiente por estagio (dev/homolog/prod).
- [ ] Gerar build assinada e publicar em teste interno no Google Play.
- [ ] Consolidar documentacao operacional.

### Issues (M5)
- [ ] **ISSUE M5-01**: Evoluir `docker-compose.yml` para fluxo de deploy cloud.  
  Labels: `P0`, `deploy`, `backend`, `devops`  
  Estimativa: 2-3 dias  
  Dependencia: M3-04, M4-03
- [ ] **ISSUE M5-02**: Preparar release Android (assinatura, versao, trilha interna).  
  Labels: `P0`, `release`, `android`  
  Estimativa: 2 dias  
  Dependencia: M4-02, M5-01
- [ ] **ISSUE M5-03**: Escrever documentacao de operacao e onboarding tecnico.  
  Labels: `P1`, `docs`  
  Estimativa: 1-2 dias  
  Dependencia: M5-01

---

## Backlog transversal (continuo)

- [ ] **ISSUE X-01**: Controle de custos de IA (limites por usuario e por dia).  
  Labels: `P1`, `ai`, `ops`
- [ ] **ISSUE X-02**: Politica de privacidade e consentimento de dados.  
  Labels: `P1`, `legal`, `security`
- [ ] **ISSUE X-03**: Refatorar modulo de treino para coexistir com chat sem regressao.  
  Labels: `P1`, `refactor`, `android`, `backend`

---

## Rituais recomendados (iniciante)

- Planejamento semanal: 30 min para escolher 2 a 4 issues.
- Sessao diaria: 60 min (40 min implementacao + 20 min estudo).
- Revisao semanal: validar o que entrou em "pronto" e o que travou.
- Sempre testar fim a fim ao concluir uma issue de `P0`.

---

## Primeiro sprint sugerido (7 dias)

1. Criar issues M1-01, M1-02 e M1-03 no GitHub.
2. Implementar `POST /chat` mock no backend.
3. Criar `ChatApiService` no Android apontando para mock.
4. Fazer uma tela minima de chat com envio e renderizacao de resposta.
5. Registrar no `README.md` como rodar backend + app no emulador.

