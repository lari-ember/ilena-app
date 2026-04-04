# ilena-app · v0.2.0

Assistente pessoal com IA nativa para sistemas Android.

> **🎯 Status de Migração**: Backend migrado de **Python (FastAPI)** para **Java (Spring Boot)** para melhor alinhamento com vagas de Fullstack Java + Angular.

## 📋 Estrutura do projeto

```
ilena-app/
├── backend/              # API FastAPI (Python) - LEGADO
│   ├── main.py
│   ├── models/
│   ├── routes/
│   ├── services/
│   ├── database/
│   ├── requirements.txt
│   └── Dockerfile
├── backend-java/         # API Spring Boot (Java) ⭐ NOVO
│   ├── pom.xml
│   ├── src/main/
│   │   ├── java/com/ilena/backend/
│   │   │   ├── config/       # CORS
│   │   │   ├── controller/   # REST Controllers
│   │   │   ├── service/      # Lógica de negócio
│   │   │   ├── repository/   # Acesso a dados
│   │   │   ├── model/        # Entidades
│   │   │   ├── dto/          # DTOs
│   │   │   └── IlenaBackendApplication.java
│   │   └── resources/
│   │       └── application.properties
│   ├── Dockerfile
│   └── README.md
├── app/                  # App Android (Kotlin)
│   ├── build.gradle.kts
│   └── src/main/
│       ├── AndroidManifest.xml
│       ├── java/com/ilena/app/
│       │   ├── model/        # Modelos de dados
│       │   ├── data/         # Retrofit + ApiService
│       │   ├── viewmodel/    # ViewModels
│       │   └── ui/           # Activities / Fragments
│       └── res/
├── docs/
├── docker-compose.yml
├── CHANGELOG.md
└── README.md
```

## 🚀 Quick Start

### Backend Java (RECOMENDADO)

```bash
# Opção 1: Local com Maven
cd backend-java
mvn clean install
mvn spring-boot:run

# Opção 2: Docker
docker-compose up backend-java

# Swagger UI: http://localhost:8000/swagger-ui.html
```

### Backend Python (Legado)

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload

# FastAPI Docs: http://localhost:8000/docs
```

### Ambos com Docker Compose

```bash
docker-compose up
# Backend Java em localhost:8000
# Backend Python em localhost:8001
```

## 🔌 Endpoints (Java + Spring Boot)

| Método | Rota | Descrição | Status |
|--------|------|-----------|--------|
| `GET` | `/` | Health-check da API | ✅ |
| `POST` | `/treino` | Registrar novo treino | ✅ |
| `GET` | `/treino` | Listar treinos | ✅ |
| `GET` | `/treino/{id}` | Obter treino por ID | ✅ |
| `PUT` | `/treino/{id}` | Atualizar treino | ✅ |
| `DELETE` | `/treino/{id}` | Deletar treino | ✅ |

**Documentação Interativa**: http://localhost:8000/swagger-ui.html

#### Exemplo: Criar treino

```bash
curl -X POST http://localhost:8000/treino \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Treino A - Peito",
    "tipo": "musculação",
    "duracaoMinutos": 60,
    "observacoes": "Aumentar carga"
  }'
```

## 📱 App Android

O projeto Android usa arquitetura **MVVM** com:

- **Retrofit 2** + **OkHttp** para chamadas HTTP
- **ViewModel** + **LiveData** para reatividade
- **Coroutines** para operações assíncronas
- **ViewBinding** para acesso seguro às views

> Para rodar no emulador Android, o endereço `10.0.2.2` aponta para o `localhost` da máquina host. Ajuste `BASE_URL` em `RetrofitClient.kt` conforme necessário.

## ✨ Por que essa migração?

### Stack anterior (Python)
- ✅ Backend funcional com FastAPI
- ⚠️ Desalinhado com vagas Java + Angular
- ⚠️ Menos experiência em stack corporativo

### Stack nova (Java + Spring Boot)
- ✅ Alinhado com vagas de **Fullstack Java + Angular**
- ✅ Experiência com **Spring Boot** (stack corporativo)
- ✅ CRUD completo + validação + Swagger automático
- ✅ Preparado para integração com banco de dados
- ✅ Melhor para portfólio em vagas Java

### Empresas-alvo
- 🔴 **Stefanini** — Fullstack Java + Angular
- 🔵 **BIP Brasil** — Fullstack Java + Angular (remoto)
- 🟢 **TOTVS** — Vagas Java frequentes
- 🟡 **Accenture / Capgemini** — Java corporativo
- 🟠 **T-Systems** — Fullstack Java + Angular 100% remoto
- ⚪ **Olist** — Vagas tech

## 📊 Tecnologias

| Camada | Tecnologia |
|--------|-----------|
| **Backend (novo)** | Java 17 + Spring Boot 3.2 + Maven |
| **Backend (legado)** | Python 3.12 + FastAPI |
| **Mobile** | Kotlin + Android |
| **API Docs** | Swagger / OpenAPI |
| **Container** | Docker + Docker Compose |

## 📝 Versionamento

Este projeto segue [Versionamento Semântico](https://semver.org/lang/pt-BR/).  
Consulte o [CHANGELOG](CHANGELOG.md) para o histórico completo.
