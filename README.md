# ilena-app · v0.1.0

Assistente pessoal com IA nativa para sistemas Android.

## Estrutura do projeto

```
ilena-app/
├── backend/          # API FastAPI (Python)
│   ├── main.py
│   ├── models/
│   ├── routes/
│   ├── services/
│   ├── database/
│   ├── requirements.txt
│   └── Dockerfile
├── app/              # App Android (Kotlin)
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

## Backend

### Requisitos

- Python 3.12+
- pip

### Executar localmente

```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```

Acesse a documentação interativa em **http://localhost:8000/docs**.

### Executar com Docker

```bash
docker-compose up --build
```

### Endpoints

| Método | Rota       | Descrição                  |
|--------|------------|----------------------------|
| GET    | `/`        | Health-check da API        |
| POST   | `/treino/` | Registrar um novo treino   |
| GET    | `/treino/` | Listar treinos registrados |

#### Exemplo de requisição `POST /treino/`

```json
{
  "nome": "Treino A - Peito",
  "tipo": "musculação",
  "duracao_minutos": 60,
  "observacoes": "Aumentar carga no supino"
}
```

## App Android

O projeto Android usa arquitetura **MVVM** com:

- **Retrofit 2** + **OkHttp** para chamadas HTTP
- **ViewModel** + **LiveData** para reatividade
- **Coroutines** para operações assíncronas
- **ViewBinding** para acesso seguro às views

> Para rodar no emulador Android, o endereço `10.0.2.2` aponta para o `localhost` da máquina host. Ajuste `BASE_URL` em `RetrofitClient.kt` conforme necessário.

## Versionamento

Este projeto segue [Versionamento Semântico](https://semver.org/lang/pt-BR/).  
Consulte o [CHANGELOG](CHANGELOG.md) para o histórico de mudanças.
