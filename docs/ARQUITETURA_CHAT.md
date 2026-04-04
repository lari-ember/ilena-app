# Arquitetura do Assistente IA - Chat

## Visão Geral

A base visual do assistente IA foi implementada seguindo o padrão **MVVM** (Model-View-ViewModel) com a arquitetura Android moderna.

## Estrutura de Arquivos

```
app/src/main/
├── java/com/ilena/app/
│   ├── ui/
│   │   ├── ChatActivity.kt          # Activity principal do chat
│   │   ├── ChatAdapter.kt           # Adapter para exibir mensagens
│   │   └── MainActivity.kt          # Activity de treino (atualizada)
│   ├── viewmodel/
│   │   ├── ChatViewModel.kt         # ViewModel com lógica do chat
│   │   └── TreinoViewModel.kt       # ViewModel existente de treino
│   ├── model/
│   │   ├── Message.kt               # Modelo de mensagem
│   │   ├── ChatRequest.kt           # Request para API
│   │   ├── ChatResponse.kt          # Response da API
│   │   └── Treino.kt                # Modelo existente
│   └── data/
│       ├── ChatApiService.kt        # Interface Retrofit para chat
│       ├── TreinoApiService.kt      # Interface existente
│       └── RetrofitClient.kt        # Cliente HTTP (atualizado)
├── res/
│   ├── layout/
│   │   ├── activity_chat.xml        # Layout principal do chat
│   │   ├── item_message.xml         # Layout do item de mensagem
│   │   └── activity_main.xml        # Layout de treino (atualizado)
│   └── values/
│       └── strings.xml              # Resources de strings (atualizado)
└── AndroidManifest.xml              # Manifesto (atualizado)
```

## Fluxo de Dados

### ChatActivity → ChatViewModel → ChatApiService → Backend

```
1. Usuário digita mensagem e clica em "Enviar"
   ↓
2. ChatActivity chama viewModel.sendMessage(text)
   ↓
3. ChatViewModel:
   a. Adiciona Message(isFromUser=true) à lista
   b. Muda estado para Loading
   c. Chama API via RetrofitClient.chatApiService.sendMessage()
   ↓
4. Backend responde com ChatResponse
   ↓
5. ChatViewModel:
   a. Adiciona Message(isFromUser=false) à lista
   b. Muda estado para Success ou Error
   ↓
6. ChatActivity observa LiveData e atualiza UI via adapter
```

## Componentes Principais

### 1. **ChatActivity** (`ui/ChatActivity.kt`)
- Activity principal do chat
- Gerencia UI com View Binding
- Observa ViewModel via LiveData
- Atualiza RecyclerView com novas mensagens

**Responsabilidades:**
- Setup de listeners (botão enviar, limpar chat)
- Setup de RecyclerView com adapter
- Observação de mudanças em messages e uiState
- Scroll automático para última mensagem

### 2. **ChatViewModel** (`viewmodel/ChatViewModel.kt`)
- ViewModel com lógica do chat
- Gerencia estados (Idle, Loading, Success, Error)
- Faz chamadas à API de forma assíncrona

**Estados:**
- `Idle`: Estado inicial, sem requisição
- `Loading`: Aguardando resposta da API
- `Success(message)`: Mensagem recebida com sucesso
- `Error(error)`: Erro na requisição

**Métodos Públicos:**
- `sendMessage(text: String)`: Envia mensagem para o backend
- `clearMessages()`: Limpa histórico de chat

### 3. **ChatAdapter** (`ui/ChatAdapter.kt`)
- Adapter do RecyclerView para exibir mensagens
- Diferencia mensagens do usuário (direita, azul) vs assistente (esquerda, cinza)
- Exibe timestamp de cada mensagem

**ViewHolder:**
- `MessageViewHolder`: Renderiza uma mensagem com formatação apropriada

### 4. **Message** (`model/Message.kt`)
```kotlin
data class Message(
    val id: String,          // UUID gerado automaticamente
    val text: String,        // Conteúdo da mensagem
    val isFromUser: Boolean, // true = usuário, false = assistente
    val timestamp: Long      // Timestamp em milissegundos
)
```

### 5. **ChatApiService** (`data/ChatApiService.kt`)
```kotlin
interface ChatApiService {
    @POST("chat/")
    suspend fun sendMessage(@Body request: ChatRequest): ChatResponse
}
```

**Endpoint esperado no backend:**
- `POST /chat/`
- Request: `{"message": "texto da mensagem"}`
- Response: `{"message": "resposta do assistente", "timestamp": null}`

### 6. **RetrofitClient** (`data/RetrofitClient.kt`)
- Cliente HTTP singleton
- Base URL: `http://10.0.2.2:8000/` (emulador)
- Inclui logging interceptor para debug

## UI/UX Design

### Activity Chat (`activity_chat.xml`)

**Componentes:**
1. **Header** (LinearLayout)
   - Título "Assistente IA"
   - Botão "Limpar" para resetar chat

2. **RecyclerView** (rv_messages)
   - Lista de mensagens
   - Layout manager com stack from end (começa do final)
   - Padding e sobre scroll

3. **Error Banner** (tv_error)
   - Exibe erros em vermelho
   - Inicialmente oculto

4. **Loading Indicator** (ll_loading)
   - ProgressBar + texto "Carregando resposta..."
   - Visível durante requisição

5. **Input Section** (LinearLayout)
   - TextInputLayout com EditText para mensagem
   - MaterialButton para enviar
   - Suporta múltiplas linhas (maxLines=3)

### Item Message (`item_message.xml`)

**Mensagem do Usuário:**
- Card azul (colorPrimary)
- Alinhado à direita
- Texto branco

**Mensagem do Assistente:**
- Card cinza (darker_gray)
- Alinhado à esquerda
- Texto branco

Ambos exibem timestamp em HH:mm no rodapé.

## Estados de UI

```
ChatUiState.Idle
├─ Sem requisição em progresso
├─ RecyclerView exibe mensagens existentes
└─ Input habilitado

ChatUiState.Loading
├─ ProgressBar visível
├─ Botão enviar desabilitado
└─ Mensagem do usuário já adicionada à lista

ChatUiState.Success(message)
├─ Mensagem do assistente adicionada
├─ Indicador de loading escondido
└─ Input habilitado

ChatUiState.Error(error)
├─ Banner de erro visível
├─ Mensagem de erro exibida
└─ Input habilitado
```

## Navegação

### MainActivity → ChatActivity

- Novo botão "Abrir Chat com IA" na MainActivity
- Clique abre ChatActivity via Intent
- ChatActivity é nova Activity no manifesto

## Strings (Localizáveis)

Adicionadas em `res/values/strings.xml`:
- `chat_title`: "Assistente IA"
- `hint_message`: "Digite sua mensagem aqui..."
- `btn_send`: "Enviar"
- `btn_clear`: "Limpar"
- `loading`: "Carregando resposta..."
- `section_assistant`: "Seção do Assistente"
- `btn_open_chat`: "Abrir Chat com IA"
- `error_message`: "Erro: %1$s"

## Próximos Passos (Milestone 2)

- [ ] Implementar `POST /chat` no backend com resposta mock
- [ ] Testar comunicação end-to-end
- [ ] Persistência local com Room (histórico de conversas)
- [ ] Melhorias de UI/UX (animações, emojis, etc.)
- [ ] Testes unitários para ChatViewModel

## Dependências Utilizadas

- **androidx.lifecycle**: LiveData, ViewModel, viewModelScope
- **retrofit2**: HTTP client com Gson converter
- **okhttp3**: Logging interceptor
- **google.material**: MaterialButton, TextInputLayout, CardView
- **androidx.recyclerview**: RecyclerView para lista de mensagens

## Desenvolvimento em Paralelo

Enquanto isso, você pode:

1. **Backend Python (FastAPI)**
   - Implementar modelo `ChatRequest` e `ChatResponse`
   - Criar endpoint `POST /chat/` com resposta mock
   - Exemplo:
     ```python
     @app.post("/chat/")
     async def chat(request: ChatRequest):
         return ChatResponse(
             message=f"Você disse: {request.message}. Resposta mock do assistente.",
             timestamp=None
         )
     ```

2. **Testes Android**
   - Testar navegação MainActivity → ChatActivity
   - Simular UI estados (loading, success, error)
   - Mock da API com Retrofit MockWebServer

---

**Status**: ✅ Base visual implementada (Milestone 2, Issue M2-03)  
**Data**: Abril 2026  
**Próxima Revisão**: Após implementar backend mock

