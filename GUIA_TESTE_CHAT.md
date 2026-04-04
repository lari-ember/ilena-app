# Guia de Teste - Base Visual do Chat

## 1. Preparar o Backend (FastAPI - Python)

### Criar modelo ChatRequest e ChatResponse

No arquivo `backend/models/__init__.py` ou criar `backend/models/chat.py`:

```python
from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class ChatRequest(BaseModel):
    message: str

class ChatResponse(BaseModel):
    message: str
    timestamp: Optional[datetime] = None
```

### Criar endpoint mock em `backend/routes/chat.py`

```python
from fastapi import APIRouter, HTTPException
from backend.models.chat import ChatRequest, ChatResponse
import logging

router = APIRouter()
logger = logging.getLogger(__name__)

@router.post("/chat/")
async def chat(request: ChatRequest):
    """
    Endpoint mock para chat.
    Retorna a mensagem do usuário com um prefixo de resposta do assistente.
    """
    logger.info(f"Chat request received: {request.message}")
    
    response_text = f"[MOCK] Você disse: '{request.message}'. Resposta automática do assistente IA."
    
    return ChatResponse(
        message=response_text,
        timestamp=None
    )

@router.get("/health/")
async def health():
    """Health check para validar que a API está respondendo."""
    return {"status": "ok"}
```

### Atualizar `backend/main.py`

```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.routes import treino, chat
import logging

logging.basicConfig(level=logging.INFO)

app = FastAPI()

# CORS para aceitar requisições do emulador
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Incluir rotas
app.include_router(treino.router)
app.include_router(chat.router)

@app.get("/")
async def root():
    return {"message": "Ilena Backend API"}
```

---

## 2. Rodar o Backend

### Com Docker Compose

```bash
cd /home/larisssa/Documentos/codigos/ilena-app
docker-compose up
```

Verificar se está rodando:
```bash
curl http://localhost:8000/health/
# Esperado: {"status":"ok"}
```

### Sem Docker (Python direto)

```bash
cd /home/larisssa/Documentos/codigos/ilena-app/backend
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

---

## 3. Compilar e Rodar o App Android

### No Android Studio

1. **Sincronizar Gradle**
   - Menu: `File` → `Sync Now`
   - Aguardar conclusão (pode levar alguns minutos)

2. **Compilar App**
   - Menu: `Build` → `Make Project`
   - Ou: `Ctrl+F9` (Windows/Linux) / `Cmd+F9` (Mac)

3. **Rodar no Emulador**
   - Menu: `Run` → `Run 'app'`
   - Ou: `Shift+F10` (Windows/Linux) / `Ctrl+R` (Mac)
   - Selecionar emulador e clicar "OK"

### Via Terminal

```bash
cd /home/larisssa/Documentos/codigos/ilena-app

# Compilar APK
./gradlew assembleDebug

# Instalar no emulador (assumindo que está rodando)
./gradlew installDebug

# Executar activity principal
adb shell am start -n com.ilena.app/.ui.MainActivity
```

---

## 4. Testar a Base Visual

### Teste 1: Navegação

1. **Abrir app** → Vê MainActivity com campos de treino
2. **Clicar botão "Abrir Chat com IA"** → Navega para ChatActivity
3. **Clicar back** → Retorna para MainActivity
4. **✅ Esperado**: Navegação suave, sem crashes

### Teste 2: Enviar Mensagem (com backend rodando)

1. **Na ChatActivity**, digitar uma mensagem no campo
2. **Clicar "Enviar"**
3. **Observar**:
   - Mensagem do usuário aparece à direita (azul)
   - ProgressBar aparece temporariamente
   - Resposta do assistente chega à esquerda (cinza)
   - Timestamp exibido em HH:mm

**✅ Esperado**: Fluxo completo de envio e recebimento

### Teste 3: Múltiplas Mensagens

1. **Enviar 3-5 mensagens** diferentes
2. **Verificar**:
   - Lista scroll para cima e abaixo automaticamente
   - Cada mensagem tem seu timestamp
   - Alternância clara entre usuário e assistente

**✅ Esperado**: Lista crescendo corretamente

### Teste 4: Botão Limpar

1. **Enviar uma mensagem** (para ter histórico)
2. **Clicar "Limpar"**
3. **Verificar**:
   - RecyclerView fica vazio
   - Toast "Chat limpo" aparece

**✅ Esperado**: Histórico apagado

### Teste 5: Estados de Erro

1. **Pausar backend** (parar docker-compose ou servidor)
2. **Tentar enviar mensagem** no app
3. **Verificar**:
   - Banner de erro aparece em vermelho
   - Mensagem de erro clara
   - Input permanece habilitado para retry

**✅ Esperado**: Tratamento elegante de erro

### Teste 6: Campo Vazio

1. **Clicar "Enviar" sem digitar nada**
2. **Verificar**:
   - Toast "Digite uma mensagem"
   - Nenhuma requisição à API

**✅ Esperado**: Validação no cliente

---

## 5. Verificar Logs

### Android Logcat

No Android Studio:
1. Menu: `View` → `Tool Windows` → `Logcat`
2. Filtrar por: `tag:"ChatActivity"` ou `tag:"ChatViewModel"`
3. Enviar mensagem e observar logs de requisição/resposta

### Backend Logs

Se rodando em terminal:
```
INFO:     127.0.0.1:54321 - "POST /chat/ HTTP/1.1" 200 OK
INFO:     Chat request received: Olá, como você está?
```

---

## 6. Problemas Comuns

### "Conexão recusada" (Connection refused)

**Causa**: Backend não está rodando
**Solução**:
```bash
docker ps  # Verificar se container está ativo
docker-compose up  # Ou: uvicorn main:app --reload
```

### "Host 10.0.2.2 não encontrado"

**Causa**: Emulador não consegue acessar localhost do host
**Solução**: Verificar se RetrofitClient.kt está com BASE_URL = "http://10.0.2.2:8000/"
(Este é o mapeamento correto para emulador Android)

### APK não instala

**Causa**: Versão incompatível ou app já instalado
**Solução**:
```bash
adb uninstall com.ilena.app
./gradlew installDebug
```

### Sync Gradle falha

**Causa**: Dependências não encontradas
**Solução**:
```bash
./gradlew clean
./gradlew sync
```

---

## 7. Estrutura de Dados Esperada

### Request (Android → Backend)

```json
{
  "message": "Olá, como você está?"
}
```

### Response (Backend → Android)

```json
{
  "message": "[MOCK] Você disse: 'Olá, como você está?'. Resposta automática do assistente IA.",
  "timestamp": null
}
```

---

## 8. Checklist de Testes Completos

- [ ] Compile sem erros
- [ ] App abre sem crash
- [ ] MainActivity mostra botão "Abrir Chat com IA"
- [ ] Navega para ChatActivity sem erro
- [ ] Campo de input visível
- [ ] Enviando mensagem vazia exibe Toast
- [ ] Enviando mensagem com conteúdo:
  - [ ] Mensagem aparece à direita (usuário)
  - [ ] Loading indicator aparece
  - [ ] Resposta chega à esquerda (assistente)
  - [ ] Loading desaparece
- [ ] Botão "Limpar" limpa histórico
- [ ] Múltiplas mensagens exibem corretamente
- [ ] Timestamps em HH:mm
- [ ] Erro de conexão exibe banner
- [ ] Back button retorna à MainActivity

---

## 9. Próximos Passos

Após validar a base visual:

1. **Integração com Room** (persistência local)
   - Salvar mensagens em SQLite
   - Carregar histórico ao abrir ChatActivity

2. **Testes Unitários**
   - ChatViewModel com MockWebServer
   - ChatAdapter com dados fake

3. **UI/UX Melhorias**
   - Animações de entrada
   - Emojis e formatação
   - Imagens/links (futura)

4. **Backend Real**
   - Substituir mock por OpenAI/Anthropic
   - Implementar rate limiting
   - Logs estruturados

---

**Datas:**  
- Base Visual: ✅ Implementada (04/04/2026)
- Próxima Validação: Com backend mock rodando

