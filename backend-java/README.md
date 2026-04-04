# Backend Ilena - Java + Spring Boot

Backend da assistente pessoal **Ilena**, migrado de **Python (FastAPI)** para **Java + Spring Boot 3.2**.

## 🎯 Por que Java?

Essa migração foi feita para melhor alinhar o projeto com vagas de **Fullstack Java + Angular**, como a da **CI&T**, **Stefanini**, **BIP Brasil** e outras empresas de consultoria no Brasil.

## 📋 Estrutura do Projeto

```
backend-java/
├── pom.xml                          # Dependências Maven
├── Dockerfile                       # Imagem Docker
├── src/main/java/com/ilena/backend/
│   ├── IlenaBackendApplication.java # Aplicação Spring Boot
│   ├── config/
│   │   └── CorsConfig.java         # Configuração CORS
│   ├── controller/
│   │   ├── RootController.java     # GET /
│   │   └── TreinoController.java   # CRUD /treino
│   ├── service/
│   │   └── TreinoService.java      # Lógica de negócio
│   ├── repository/
│   │   └── TreinoRepository.java   # Acesso a dados (em memória)
│   ├── model/
│   │   └── Treino.java            # Entidade
│   └── dto/
│       ├── TreinoRequest.java     # DTO para requisição
│       └── TreinoResponse.java    # DTO para resposta
└── src/main/resources/
    └── application.properties       # Configurações Spring
```

## 🔌 Endpoints

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| `GET` | `/` | Status da API |
| `POST` | `/treino` | Criar novo treino |
| `GET` | `/treino` | Listar todos os treinos |
| `GET` | `/treino/{id}` | Obter treino por ID |
| `PUT` | `/treino/{id}` | Atualizar treino |
| `DELETE` | `/treino/{id}` | Deletar treino |

## 🚀 Como Rodar

### Pré-requisitos
- Java 17+
- Maven 3.9+
- Docker (opcional)

### Localmente

```bash
# Clonar/navegar para o projeto
cd backend-java

# Build
mvn clean install

# Rodar
mvn spring-boot:run
```

A API estará disponível em `http://localhost:8000`

### Documentação Interativa
- **Swagger UI**: http://localhost:8000/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8000/v3/api-docs

### Com Docker

```bash
# Build da imagem
docker build -t ilena-backend:0.2.0 .

# Rodar container
docker run -p 8000:8000 ilena-backend:0.2.0
```

### Com Docker Compose

```bash
# Do diretório raiz do projeto
docker-compose up backend-java
```

## 📊 Exemplo de Requisições

### Criar treino
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

### Listar treinos
```bash
curl http://localhost:8000/treino
```

### Obter treino específico
```bash
curl http://localhost:8000/treino/1
```

### Atualizar treino
```bash
curl -X PUT http://localhost:8000/treino/1 \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Treino A - Peito (Atualizado)",
    "tipo": "musculação",
    "duracaoMinutos": 75,
    "observacoes": "Aumentar mais a carga"
  }'
```

### Deletar treino
```bash
curl -X DELETE http://localhost:8000/treino/1
```

## 🛠️ Stack Técnica

- **Framework**: Spring Boot 3.2.4
- **Build**: Maven 3.9.6
- **Java**: 17 LTS
- **Documentação**: Springdoc OpenAPI (Swagger)
- **CORS**: Habilitado para todo o frontend
- **Validação**: Jakarta Bean Validation

## 📦 Dependências Principais

```xml
- spring-boot-starter-web (REST API)
- spring-boot-starter-validation (Bean Validation)
- spring-boot-devtools (Hot reload)
- springdoc-openapi-starter-webmvc-ui (Swagger)
- lombok (Reduz boilerplate)
```

## 🔄 Comparação com Backend Python

| Aspecto | Python (FastAPI) | Java (Spring Boot) |
|---------|-------------------|------------------|
| Framework | FastAPI | Spring Boot |
| Model Validation | Pydantic | Jakarta Bean Validation |
| Dependency Injection | Manual | Spring IoC |
| Documentation | OpenAPI automático | Springdoc OpenAPI |
| Deploy | Uvicorn | Embedded Tomcat |
| Imagem Docker | 150-200 MB | 300-400 MB |

## 📝 Notas de Migração

1. **In-Memory Store**: Ainda usamos um repositório em memória (ArrayList) para manter paridade com o backend Python. Em produção, integrar com banco de dados via Spring Data JPA.

2. **DTOs**: Separação explícita entre `TreinoRequest` (entrada), `TreinoResponse` (saída) e `Treino` (entidade).

3. **CORS**: Configurado para aceitar qualquer origem (útil para desenvolvimento). Em produção, restringir a domínios específicos.

4. **Validação**: Annotations `@NotBlank`, `@Positive` garantem validação de entrada antes do processamento.

## 🚀 Próximos Passos

- [ ] Integrar com banco de dados (PostgreSQL com Spring Data JPA)
- [ ] Adicionar autenticação (Spring Security + JWT)
- [ ] Implementar cache (Spring Cache + Redis)
- [ ] Adicionar testes unitários (JUnit 5 + Mockito)
- [ ] Implementar versionamento de API
- [ ] Containerização com Kubernetes

## 📞 Suporte

Para dúvidas ou melhorias, abra uma issue no repositório principal.

---

**Versão**: 0.2.0 | **Última atualização**: Abril 2026

