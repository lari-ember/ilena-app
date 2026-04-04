# Base Visual do Chat IA - README

## 📱 Visão Geral

A base visual do assistente IA foi completamente implementada! Este diretório contém toda a interface do usuário para o chat, incluindo:

- ✅ Activity de chat com RecyclerView
- ✅ ViewModel com gerenciamento de estado
- ✅ Adapter customizado para mensagens
- ✅ Layouts XML modernos com Material Design
- ✅ Integração com Retrofit para API
- ✅ Navegação entre telas

---

## 📂 Estrutura

```
app/src/main/
│
├── java/com/ilena/app/
│   │
│   ├── model/
│   │   ├── Message.kt              # Modelo de mensagem
│   │   ├── ChatRequest.kt          # Request para API
│   │   ├── ChatResponse.kt         # Response da API
│   │   └── Treino.kt               # (existente)
│   │
│   ├── data/
│   │   ├── ChatApiService.kt       # Interface Retrofit
│   │   ├── TreinoApiService.kt     # (existente)
│   │   └── RetrofitClient.kt       # Cliente HTTP (atualizado)
│   │
│   ├── viewmodel/
│   │   ├── ChatViewModel.kt        # ViewModel do chat
│   │   └── TreinoViewModel.kt      # (existente)
│   │
│   └── ui/
│       ├── ChatActivity.kt         # Activity principal do chat
│       ├── ChatAdapter.kt          # Adapter do RecyclerView
│       └── MainActivity.kt         # (atualizado com botão chat)
│
└── res/
    ├── layout/
    │   ├── activity_chat.xml       # Layout da chat activity
    │   ├── item_message.xml        # Layout do item de mensagem
    │   └── activity_main.xml       # (atualizado)
    │
    └── values/
        └── strings.xml             # (atualizado com strings de chat)
```

---

## 🚀 Quick Start

### 1. Compilar o App

```bash
cd /home/larisssa/Documentos/codigos/ilena-app
./gradlew assembleDebug
```

### 2. Rodar o Emulador

```bash
# Abrir emulador (se não estiver aberto)
emulator -avd Pixel_4_API_30 &

# Instalar app
./gradlew installDebug

# Iniciar
adb shell am start -n com.ilena.app/.ui.MainActivity
```

### 3. Testar Chat

1. Clique em **"Abrir Chat com IA"** na MainActivity
2. Digite uma mensagem
3. Clique **"Enviar"**
4. Veja a resposta aparecer (com backend rodando)

---

## 🔌 Integração com Backend

### Backend esperado em `http://10.0.2.2:8000/`

O emulador acessa o host via IP `10.0.2.2`. Configure seu backend Python:

```python
# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Endpoint mock para testes
@app.post("/chat/")
async def chat(request: dict):
    return {
        "message": f"[MOCK] Você disse: {request['message']}",
        "timestamp": None
    }

@app.get("/health/")
async def health():
    return {"status": "ok"}
```

Execute com:
```bash
cd backend
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

---

## 📐 Arquitetura MVVM

```
┌─────────────┐
│  ChatActivity  │ (View)
│  - UI Layer    │
│  - View Binding│
└────┬────────┘
     │ observes
     ↓
┌─────────────┐
│ChatViewModel  │ (ViewModel)
│ - Logic      │
│ - State Mgmt │
│ - Coroutines │
└────┬────────┘
     │ calls
     ↓
┌─────────────┐
│ ChatApiService│ (Model)
│ - Network    │
│ - Retrofit   │
└────┬────────┘
     │ calls
     ↓
┌─────────────┐
│   Backend   │
│  Python API │
└─────────────┘
```

---

## 💾 LiveData & States

### ChatViewModel expõe dois LiveData:

#### 1. `messages: LiveData<List<Message>>`
Contém todas as mensagens da conversa.

```kotlin
message = Message(
    id = UUID.randomUUID().toString(),
    text = "Olá",
    isFromUser = true,
    timestamp = System.currentTimeMillis()
)
```

#### 2. `uiState: LiveData<ChatUiState>`
Representa o estado atual da tela.

```kotlin
sealed class ChatUiState {
    object Idle : ChatUiState()               // Inicial
    object Loading : ChatUiState()            // Enviando
    data class Success(val message: String)   // Recebido
    data class Error(val error: String)       // Erro
}
```

---

## 🎨 UI Components

### ChatActivity Layout

```
┌────────────────────────────────┐
│ Header: "Assistente IA" [Limpar]│  ← AppBar
├────────────────────────────────┤
│                                │
│    ← Mensagem do Usuário       │  ← RecyclerView
│                                │  ← Item: UserMessage (Azul/Direita)
│  Resposta do Assistente →     │  ← Item: AssistantMessage (Cinza/Esquerda)
│                                │
├─ Carregando resposta... [×]    │  ← Loading Indicator
├────────────────────────────────┤
│ ✗ Erro: Conexão recusada      │  ← Error Banner
├────────────────────────────────┤
│┌──────────────────────┐ [Send]│  ← Input Section
││ Digite sua mensagem │
│└──────────────────────┘
└────────────────────────────────┘
```

### Mensagem do Usuário
- Alinhada à **direita**
- Fundo **azul** (colorPrimary)
- Texto **branco**
- Timestamp em HH:mm

### Mensagem do Assistente
- Alinhada à **esquerda**
- Fundo **cinza** (darker_gray)
- Texto **branco**
- Timestamp em HH:mm

---

## 🔄 Fluxo de Envio de Mensagem

```
1. Usuário digita: "Olá"
   ↓
2. Clica botão "Enviar"
   ↓
3. ChatActivity chama: viewModel.sendMessage("Olá")
   ↓
4. ChatViewModel:
   a. Cria Message(text="Olá", isFromUser=true)
   b. Adiciona à lista de messages
   c. Muda state para Loading
   d. Chama: chatApiService.sendMessage(ChatRequest("Olá"))
   ↓
5. Retrofit envia POST para backend
   ↓
6. Backend responde com ChatResponse
   ↓
7. ChatViewModel:
   a. Cria Message(text=response, isFromUser=false)
   b. Adiciona à lista
   c. Muda state para Success
   ↓
8. ChatActivity observa LiveData e atualiza UI via adapter
```

---

## 🧪 Testes

Veja **GUIA_TESTE_CHAT.md** para testes completos.

### Testes Rápidos

```bash
# Compilar sem erros
./gradlew clean build

# Testar específico
./gradlew testDebugUnitTest

# Lint
./gradlew lint
```

---

## 📝 String Resources

Adicionadas em `res/values/strings.xml`:

```xml
<string name="chat_title">Assistente IA</string>
<string name="hint_message">Digite sua mensagem aqui...</string>
<string name="btn_send">Enviar</string>
<string name="btn_clear">Limpar</string>
<string name="loading">Carregando resposta...</string>
<string name="section_assistant">Seção do Assistente</string>
<string name="btn_open_chat">Abrir Chat com IA</string>
<string name="error_message">Erro: %1$s</string>
```

---

## 🛠️ Dependências

Já incluídas em `app/build.gradle.kts`:

```kotlin
implementation(libs.appcompat)
implementation(libs.material)
implementation(libs.activity.ktx)
implementation(libs.retrofit.core)
implementation(libs.retrofit.gson)
implementation(libs.okhttp.logging)
implementation(libs.gson)
implementation(libs.lifecycle.viewmodel)
implementation(libs.lifecycle.runtime)
implementation(libs.coroutines.android)
```

---

## 🐛 Troubleshooting

### App não compila
```bash
./gradlew clean
./gradlew sync
```

### Conexão recusada ao backend
```bash
# Verificar se backend está rodando
curl http://localhost:8000/health/

# Verificar se emulador consegue acessar
adb shell ping 10.0.2.2
```

### RecyclerView não atualiza
- Verificar se `notifyDataSetChanged()` é chamado
- Verificar se LiveData observer foi adicionado

### Mensagens não aparecem
- Verificar logs: `adb logcat | grep ChatActivity`
- Validar response do backend com `curl -X POST http://localhost:8000/chat/ -H "Content-Type: application/json" -d '{"message":"test"}'`

---

## 📚 Documentação Relacionada

- **ARQUITETURA_CHAT.md** - Documentação técnica detalhada
- **GUIA_TESTE_CHAT.md** - Guia completo de testes
- **SUMARIO_CHAT_VISUAL.md** - Resumo do que foi implementado
- **plano-desenvolvimento-assistente-ia.md** - Roadmap completo

---

## ✅ Checklist de Validação

- [ ] App compila sem erros
- [ ] ChatActivity abre sem crash
- [ ] RecyclerView exibe corretamente
- [ ] Envio de mensagem funciona
- [ ] Estados de loading/erro aparecem
- [ ] Botão limpar funciona
- [ ] Navegação da MainActivity funciona
- [ ] Backend responde corretamente

---

## 🚀 Próximos Passos

1. **Implementar backend com resposta mock** (use `backend/routes/chat_example.py` como referência)
2. **Testes end-to-end** com backend rodando
3. **Persistência local** com Room (histórico)
4. **Testes unitários** para ChatViewModel
5. **Integração com IA real** (OpenAI/Anthropic)

---

## 📞 Suporte

Se tiver dúvidas:
1. Leia os arquivos de documentação
2. Veja os logs com: `adb logcat`
3. Teste backend com: `curl`
4. Compare com exemplos em: `backend/routes/chat_example.py`

---

**Status**: ✅ Pronto para desenvolvimento da Milestone 3  
**Última Atualização**: 04/04/2026  
**Próxima Fase**: Backend com resposta mock

