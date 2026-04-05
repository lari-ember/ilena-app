# Fase 1, Semana 1: Fundamentos do Kotlin
## Diário Detalhado — Dia a Dia

**Objetivo Geral da Semana:**  
Consolidar os fundamentos do Kotlin, entendendo como ele se diferencia de Python (sua linguagem base) e Java. Preparar a mentalidade para escrever código mobile-first em um projeto real (Ilena Chat).

**Resultado Esperado ao Final da Semana:**  
Você conseguirá:
- ✅ Diferenciar Python, Java e Kotlin com confiança.
- ✅ Escrever funções, variáveis e null-safety em Kotlin.
- ✅ Entender data classes e collections.
- ✅ Refatorar um pequeno script Python para Kotlin.
- ✅ Ter 5 notas bem estruturadas no Obsidian conectadas via backlinks.

---

## 📅 DIA 1 (Segunda-feira)
### Tema: "Kotlin vs Python vs Java — O Grande Mapa Mental"

#### ⏰ Agenda do Dia (60 min)
- **0-15 min:** Setup e mentalidade
- **15-40 min:** Estudo comparativo
- **40-55 min:** Prática hands-on
- **55-60 min:** Anotações no Obsidian

---

### 🎯 Objetivo do Dia 1
Você entenderá **por que Kotlin foi escolhido** para Android, como ele se posiciona entre Python (simples, dinâmico) e Java (verboso, tipado) e começará a pensar em termos de *type-safety* e *null-safety*.

---

### 📚 O que Estudar

**Tempo de Leitura: 20 minutos**

1. **Leia (português):**
   - Documentação Oficial Kotlin: https://kotlinlang.org/docs/home.html
   - Seção: "Why Kotlin?" → "Interoperability"
   - Entenda a frase: *"Kotlin é mais seguro e conciso que Java, mais prático que Python"*

2. **Vídeo Recomendado (10 min):**
   - "Kotlin for Java Developers — Why Kotlin?" — Google Developers
   - Link: https://www.youtube.com/watch?v=st0iE33aVMQ
   - Nota: Legendas em português disponíveis

3. **Tabela Comparativa (leia com atenção):**

| Aspecto | Python | Java | Kotlin |
|---------|--------|------|--------|
| **Tipagem** | Dinâmica (type hints opcionais) | Estática obrigatória | Estática obrigatória, mas **inferida** |
| **Null Safety** | `None` (fácil de esquecer) | Exceções `NullPointerException` | `Type?` (obriga a pensar em null) |
| **Sintaxe** | Minimalista, indentação | Verbosa, muitas chaves | Concisa, o melhor dos dois mundos |
| **Funções** | `def foo():` | `void foo() {}` | `fun foo() {}` |
| **Classes de Dados** | Não nativo, usa `__init__` | Getter/Setter boilerplate | `data class Foo(val a: Int)` |
| **Coroutinas/Async** | `asyncio`, callbacks | Threads, Future | **Coroutines nativas** ⭐ |
| **Plataforma** | Backend, Scripts, IA | Enterprise, Android | **Android Nativo** ⭐ |

---

### 💻 Ações Práticas (25 min)

#### Ação 1: Setup da Ferramenta (5 min)
```bash
# Abra o Kotlin Playground (sem instalar nada):
# https://play.kotlinlang.org/

# Crie um novo arquivo chamado "Dia1_MeuPrimeiroKotlin.kt"
```

#### Ação 2: Escreva Código Paralelo (15 min)

No Kotlin Playground, digite e execute lado a lado:

**Código Python** (no seu editor local, ou apenas leia):
```python
# Python
name = "João"
age = 25
is_student = True

def greet(person_name):
    return f"Olá {person_name}!"

print(greet(name))
```

**Código Kotlin Equivalente** (digite no Playground):
```kotlin
// Kotlin
val name = "João"
val age = 25
val isStudent = true

fun greet(personName: String): String {
    return "Olá $personName!"
}

fun main() {
    println(greet(name))
}
```

**O que notar:**
- `val` = variável imutável (como constante em Python)
- `var` = variável mutável (como variável normal em Python)
- Tipos vêm **depois** do nome: `personName: String` (não antes!)
- `String interpolation` funciona com `$` assim como Python!
- `main()` é o ponto de entrada (sempre necessário em Kotlin)

#### Ação 3: Explore Null-Safety (5 min)

**Python** (sem proteção):
```python
name = None
print(name.upper())  # ❌ AttributeError: 'NoneType' object has no attribute 'upper'
```

**Kotlin** (com proteção):
```kotlin
val name: String? = null  // ? significa "pode ser null"
println(name?.uppercase()) // ✅ Retorna null, sem crash!

val greeting = name?.uppercase() ?: "Anônimo"  // ?: é o "elvis operator"
println(greeting)  // "Anônimo"
```

**Conceito-chave:**  
*Kotlin força você a pensar em "e se isso for null?"*

---

### 📝 Anotações para o Obsidian (10 min)

Crie um arquivo em `/Documentos/obsidian/programação/Programação/Linguagens/Kotlin/`:
**Nome:** `Dia_1_Introducao_Kotlin.md`

Copie este template:

```markdown
# Kotlin: Introdução (Dia 1 — Semana 1)

## Fichamento
**Data:** 5 de abril de 2026
**Tempo Gasto:** 60 minutos

### Por que Kotlin?
- ✅ [[Null-Safety]] nativa (previne crashes do dia-a-dia)
- ✅ [[Type Inference]] automática (menos boilerplate que Java)
- ✅ [[Coroutines]] nativas (melhor que async/await de Python)
- ✅ Funciona 100% com [[Java]] e ecosistema Spring

### Comparação: Python vs Java vs Kotlin

```
Python: Rápido de escrever, lento de debugar (tipos dinâmicos)
Java: Seguro, mas verboso (much boilerplate)
Kotlin: O "Goldilocks" — seguro E conciso
```

### Null-Safety: O Diferencial
Em Python:
```python
name = None
name.upper()  # ❌ Crash em runtime
```

Em Kotlin:
```kotlin
val name: String? = null
name?.uppercase()  // ✅ Seguro! Retorna null se name for null
```

A sigla `?` após o tipo significa: *"Este valor PODE ser null"*.

### Próximas Aulas
- [[Dia_2_Tipos_e_Variaveis]]
- [[Dia_3_Funcoes_Kotlin]]

### Referências
- [Kotlin Playground](https://play.kotlinlang.org/)
- [Why Kotlin? — Oficial](https://kotlinlang.org/docs/home.html)
- Relacionado: [[Segurança em Linguagens]] | [[Type Systems]]
```

---

### ❓ Perguntas de Fixação

**Responda no papel (Caderno Físico):**

1. **Qual é a maior diferença entre Python e Kotlin em relação a tipos?**
   <details>
   <summary>Resposta</summary>
   Python é **dinamicamente tipado** (você descobre o tipo em runtime). Kotlin é **estaticamente tipado** (o compilador verifica os tipos antes de rodar). Isso torna Kotlin mais seguro, mas exige mais disciplina ao escrever.
   </details>

2. **O que significa `String?` em Kotlin?**
   <details>
   <summary>Resposta</summary>
   Significa que a variável pode ser uma `String` OU `null`. Se fosse apenas `String`, seria obrigatoriamente um valor de texto (nunca null). A `?` é a sintaxe do Kotlin para "nullable type".
   </details>

3. **Por que Kotlin usa `val` e `var` em vez de apenas `var`?**
   <details>
   <summary>Resposta</summary>
   `val` = **val**ue (valor imutável, constante). `var` = **var**iável (pode ser alterada). A maioria do código deve usar `val`. Isso força um código mais puro e menos propenso a bugs.
   </details>

4. **Qual é a vantagem de Coroutines nativas do Kotlin vs async/await do Python?**
   <details>
   <summary>Resposta</summary>
   Coroutines do Kotlin são **leves, compostas e não bloqueiam threads**. Em Python, `asyncio` requer callbacks ou `await` explícito. Kotlin permite escrever código assíncrono que **parece síncrono**.
   </details>

---

## 📅 DIA 2 (Terça-feira)
### Tema: "Tipos, Variáveis e Null-Safety — Prédio Seguro"

#### ⏰ Agenda do Dia (60 min)
- **0-10 min:** Revisão do Dia 1
- **10-35 min:** Deep dive em tipos
- **35-50 min:** Exercícios práticos
- **50-60 min:** Obsidian + Caderno

---

### 🎯 Objetivo do Dia 2
Dominar a declaração de variáveis, entender a inferência de tipos e praticar o padrão **safe-call operator** (`?.`) que você verá no código do `ChatActivity.kt`.

---

### 📚 O que Estudar (20 min)

**Leitura Obrigatória:**
- Kotlin Docs: https://kotlinlang.org/docs/basic-types.html
- Focar em: **Null Safety** seção

**Video (10 min):**
- "Kotlin Null Safety Explained" — Philipp Lackner
- https://www.youtube.com/watch?v=AQVm-85oA5o

**Código Real do Seu Projeto (Análise):**

Abra: `/home/larisssa/Documentos/codigos/ilena-app/app/src/main/java/com/ilena/app/model/Message.kt`

```kotlin
data class Message(
    val id: String = UUID.randomUUID().toString(),
    val text: String,
    val isFromUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
)
```

**O que ver aqui:**
- `val` (imutável, tipo inferido de `String`)
- Parâmetros com valores padrão (`= UUID.randomUUID()...`)
- Não há `?`, logo nenhum destes campos pode ser null
- `data class` gera automaticamente `equals()`, `hashCode()`, `toString()`

---

### 💻 Ações Práticas (30 min)

#### Ação 1: Digitação de Tipos no Playground (15 min)

No https://play.kotlinlang.org/, digite:

```kotlin
fun main() {
    // ===== VARIÁVEIS IMUTÁVEIS (val) =====
    val name: String = "Larissa"    // Tipo explícito
    val age = 25                    // Tipo inferido (Int)
    val isLearning = true          // Tipo inferido (Boolean)
    
    // ===== VARIÁVEIS MUTÁVEIS (var) =====
    var count = 0                  // Pode mudar
    count = count + 1              // ✅ Legal
    // name = "Outro nome"         // ❌ Erro! val não pode mudar
    
    // ===== TIPOS BÁSICOS =====
    val intNumber: Int = 42
    val longNumber: Long = 42L
    val doubleNumber: Double = 3.14
    val floatNumber: Float = 3.14f
    val textChar: Char = 'K'
    
    // ===== NULL-SAFETY =====
    val nullable: String? = null       // Pode ser null
    val nonNullable: String = "texto"  // Nunca pode ser null
    
    // ===== SAFE CALL OPERATOR (?.) =====
    val upperName = nonNullable.uppercase()  // OK
    val upperNullable = nullable?.uppercase()  // Retorna null se nullable for null
    
    // ===== ELVIS OPERATOR (?:) =====
    val greeting = nullable?.uppercase() ?: "ANÔNIMO"
    println(greeting)  // "ANÔNIMO"
    
    // ===== STRING INTERPOLATION =====
    println("Olá $name, você tem $age anos")
}
```

**Execute** e veja a saída!

#### Ação 2: Refatore Seu Próprio Código Python (10 min)

Você tem código Python em casa ou trabalho? Pegue um trecho:

**Exemplo Python:**
```python
def calculate_discount(price, is_member):
    if is_member:
        return price * 0.9
    return price
```

**Transforme em Kotlin:**
```kotlin
fun calculateDiscount(price: Double, isMember: Boolean): Double {
    return if (isMember) price * 0.9 else price
}

// Ou versão funcional:
fun calculateDiscount(price: Double, isMember: Boolean) =
    if (isMember) price * 0.9 else price
```

**Neste processo, você aprende:**
- Tipos de parâmetro + retorno
- `if` é uma **expressão** (retorna valor), não apenas statement

#### Ação 3: Conectar com Seu Projeto Real (5 min)

Abra `ChatViewModel.kt` do seu projeto e localize:

```kotlin
val userMessage = Message(
    text = text,
    isFromUser = true
)
```

**Pergunte a si mesma:**
- Por que `text` e `isFromUser` não têm `?`?
- Resposta: Porque eles **nunca podem ser null** (obrigatórios sempre)
- `id` e `timestamp` têm valores padrão, então são opcionais no construtor

---

### 📝 Anotações para o Obsidian (10 min)

Crie: `/Documentos/obsidian/programação/Programação/Linguagens/Kotlin/Dia_2_Tipos_Variaveis.md`

```markdown
# Kotlin: Tipos e Variáveis (Dia 2)

## O Sistema de Tipos do Kotlin

### Regra de Ouro
```
val = Imutável (use POR PADRÃO)
var = Mutável (use apenas quando necessário)
Type? = Pode ser null
Type = Obrigatoriamente tem valor
```

### Exemplo Prático do Ilena

No `Message.kt` do nosso projeto:
```kotlin
data class Message(
    val id: String = UUID.randomUUID().toString(),  // Default value
    val text: String,                                // Obrigatório, não-null
    val isFromUser: Boolean,                         // Obrigatório
    val timestamp: Long = System.currentTimeMillis() // Default value
)
```

### Null-Safety: Os 3 Operadores

| Operador | Uso | Exemplo |
|----------|-----|---------|
| `?.` | Safe-call | `user?.name?.length` |
| `?:` | Elvis | `name ?: "Padrão"` |
| `!!` | Not-null assertion | `name!!` (⚠️ arriscado) |

### Conexão com Projeto
- [[Message.kt]] usa null-safety no model
- [[ChatViewModel.kt]] cria Message com valores seguros
- [[Dia_3_Funcoes_Kotlin]] vai ensinar como passar Messages entre camadas

## Perguntas de Fixação
1. Quando usar `val` vs `var`?
2. O que `String?` significa?
3. Como o Elvis operator `?:` funciona?

### Referências
- [[Kotlin Null Safety]]
- [[Dia_1_Introducao_Kotlin]]
```

---

### ❓ Perguntas de Fixação

1. **Declare uma variável em Kotlin que representa a idade de um usuário, garantindo que nunca seja null:**
   <details>
   <summary>Resposta</summary>
   ```kotlin
   val userAge: Int = 25
   // ou
   val userAge = 25  // tipo inferido automaticamente
   ```
   </details>

2. **Escreva o equivalente Kotlin desta função Python:**
   ```python
   def get_name(user):
       if user is not None:
           return user['name'].upper()
       return "DESCONHECIDO"
   ```
   <details>
   <summary>Resposta</summary>
   ```kotlin
   fun getName(user: User?): String {
       return user?.name?.uppercase() ?: "DESCONHECIDO"
   }
   ```
   </details>

3. **Qual é a diferença entre `String` e `String?`?**
   <details>
   <summary>Resposta</summary>
   `String` obrigatoriamente tem um texto. `String?` pode ser um texto OU null. O `?` é a sintaxe que diz "este tipo é nullable".
   </details>

4. **Refatore este código para usar `val` em vez de `var`:**
   ```kotlin
   var username = "João"
   username = "João Silva"
   var age = 25
   age = 26
   ```
   <details>
   <summary>Resposta (depende do contexto)</summary>
   Se você realmente precisa mudar o valor, mantenha `var`. Se não mudar, use `val`. No exemplo, ambas as mudanças sugerem que `var` é necessário. Mas bom padrão é sempre começar com `val`.
   </details>

---

## 📅 DIA 3 (Quarta-feira)
### Tema: "Funções — O Coração do Kotlin"

#### ⏰ Agenda do Dia (75 min)
- **0-15 min:** Revisão + mentalidade
- **15-40 min:** Estudo de funções
- **40-60 min:** Prática intensiva
- **60-75 min:** Obsidian + Caderno

---

### 🎯 Objetivo do Dia 3
Você escreverá funções Kotlin com confiança, entenderá **lambda expressions** (closures) e começará a ver padrões de programação funcional que aparecem em `ChatViewModel.kt` (como `.onSuccess {}` e `.onFailure {}`).

---

### 📚 O que Estudar (20 min)

**Leitura:**
- Kotlin Docs: https://kotlinlang.org/docs/functions.html
- Kotlin Docs: https://kotlinlang.org/docs/lambdas.html

**Vídeo (15 min):**
- "Kotlin Functions & Lambdas" — Philipp Lackner
- https://www.youtube.com/watch?v=7zCnwSFsKqE

**Analise Seu Código Real:**

Abra: `/home/larisssa/Documentos/codigos/ilena-app/app/src/main/java/com/ilena/app/viewmodel/ChatViewModel.kt`

```kotlin
fun sendMessage(text: String) {
    if (text.trim().isEmpty()) {
        _uiState.value = ChatUiState.Error("Mensagem não pode estar vazia")
        return
    }

    val userMessage = Message(
        text = text,
        isFromUser = true
    )
    // ... resto do código
}
```

**Observe:**
- Função `sendMessage` com parâmetro `text: String`
- Sem tipo de retorno explícito (`Unit`, que é void em Kotlin)
- Usa `return` para sair cedo se houver erro
- Chama `Message(...)` que é um **construtor** (data class)

---

### 💻 Ações Práticas (40 min)

#### Ação 1: Sintaxe de Funções (10 min)

No Kotlin Playground:

```kotlin
// ===== FUNÇÃO BÁSICA =====
fun greet(name: String): String {
    return "Olá $name"
}

// ===== FUNÇÃO COM EXPRESSION BODY =====
fun greetShort(name: String): String = "Olá $name"

// ===== FUNÇÃO SEM TIPO DE RETORNO (Unit = void) =====
fun printName(name: String) {
    println(name)
}

// ===== FUNÇÃO COM VALORES PADRÃO =====
fun greetWithTitle(name: String, title: String = "Sr(a)") =
    "Olá $title $name"

// ===== FUNÇÃO COM MÚLTIPLOS RETORNOS (Pair) =====
fun getUserInfo(id: Int): Pair<String, Int> {
    return Pair("João", 25)
}

fun main() {
    println(greet("Larissa"))
    println(greetShort("Larissa"))
    printName("Larissa")
    println(greetWithTitle("Larissa"))
    println(greetWithTitle("Larissa", "Dr(a)"))
    
    val (name, age) = getUserInfo(1)
    println("$name tem $age anos")
}
```

#### Ação 2: Lambda Expressions (15 min)

```kotlin
// ===== O QUE SÃO LAMBDAS =====
// Uma função anônima que você passa como argumento

// Exemplo simples: uma lista, filtrada
val numbers = listOf(1, 2, 3, 4, 5)

// ❌ Sem lambda (verbose):
val evenNumbers = mutableListOf<Int>()
for (n in numbers) {
    if (n % 2 == 0) {
        evenNumbers.add(n)
    }
}

// ✅ Com lambda (conciso):
val evenNumbers2 = numbers.filter { n -> n % 2 == 0 }

// ✅✅ Super conciso (quando há 1 parâmetro, é `it`):
val evenNumbers3 = numbers.filter { it % 2 == 0 }

println(evenNumbers3)  // [2, 4]

// ===== LAMBDA NO SEU PROJETO =====
// Em ChatViewModel.kt, você vê:
viewModel.messages.observe(this) { messages ->
    // Esta chave { ... } é uma LAMBDA
    chatAdapter.updateMessages(messages)
}

// Equivale a:
viewModel.messages.observe(this, object : Observer<List<Message>> {
    override fun onChanged(messages: List<Message>?) {
        chatAdapter.updateMessages(messages)
    }
})

// Kotlin é MUITO mais conciso!
```

#### Ação 3: Análise do ChatViewModel Real (10 min)

Abra novamente `ChatViewModel.kt` e localize:

```kotlin
viewModelScope.launch {
    runCatching {
        RetrofitClient.chatApiService.sendMessage(ChatRequest(text))
    }.onSuccess { response ->
        // Lambda aqui!
        val assistantMessage = Message(...)
        _messages.value = updatedMessages
        _uiState.value = ChatUiState.Success(response.message)
    }.onFailure { error ->
        // Lambda aqui também!
        _uiState.value = ChatUiState.Error(...)
    }
}
```

**O que ver:**
- `viewModelScope.launch { }` = Coroutine (async)
- `runCatching { }` = Try-catch seguro
- `.onSuccess { response -> }` = Lambda que recebe a resposta
- `.onFailure { error -> }` = Lambda para tratamento de erro

**Todas essas chaves `{ }` são lambdas!**

#### Ação 4: Escreva Sua Própria Função (5 min)

Crie uma função que:
- Receba uma lista de nomes
- Filtre os nomes com mais de 5 letras
- Retorne em MAIÚSCULA

**Solução:**
```kotlin
fun filterAndUppercase(names: List<String>): List<String> {
    return names
        .filter { it.length > 5 }
        .map { it.uppercase() }
}

fun main() {
    val names = listOf("João", "Larissa", "Ana", "Clodoaldo")
    println(filterAndUppercase(names))
    // Saída: [LARISSA, CLODOALDO]
}
```

---

### 📝 Anotações para o Obsidian (15 min)

Crie: `/Documentos/obsidian/programação/Programação/Linguagens/Kotlin/Dia_3_Funcoes_Kotlin.md`

```markdown
# Kotlin: Funções e Lambdas (Dia 3)

## Syntaxes de Função

### Forma Completa
```kotlin
fun functionName(param1: Type1, param2: Type2): ReturnType {
    // corpo
    return value
}
```

### Forma Concisa (Expression Body)
```kotlin
fun functionName(param: Type): ReturnType = someExpression
```

### Sem Retorno (Unit)
```kotlin
fun functionName(param: Type) {
    println(param)
}
```

## Lambdas: O Motor do Kotlin Funcional

### Definição
Uma **lambda** é uma função anônima (sem nome) que você passa como argumento.

### Sintaxe
```kotlin
{ parametro -> corpo }

// Exemplo:
val double = { x: Int -> x * 2 }
println(double(5))  // 10
```

### Casos de Uso (Seu Projeto!)

#### 1. Listas e Filtros
```kotlin
val messages = listOf(...)
val userMessages = messages.filter { it.isFromUser }
```

#### 2. LiveData Observers (Android)
```kotlin
viewModel.messages.observe(this) { messages ->
    chatAdapter.updateMessages(messages)
}
```

#### 3. Try-Catch com Result
```kotlin
runCatching {
    apiService.sendMessage(request)
}.onSuccess { response ->
    _uiState.value = ChatUiState.Success(response.message)
}.onFailure { error ->
    _uiState.value = ChatUiState.Error(error.message ?: "Unknown")
}
```

## Conexão com Ilena App
- [[ChatViewModel.kt]] usa lambdas em `.onSuccess {}` e `.observe() {}`
- [[ChatAdapter.kt]] provavelmente usa lambdas em listeners
- [[Estrutura MVVM]] funciona bem com programação funcional

## Próximos
- [[Dia_4_Collections_Data_Classes]]
- [[Coroutines Avançadas]]

## Referências
- [[Kotlin Functions]]
- [[Kotlin Lambdas]]
- [[Functional Programming]]
```

---

### ❓ Perguntas de Fixação

1. **Qual é a diferença entre uma função e uma lambda?**
   <details>
   <summary>Resposta</summary>
   Uma função tem nome (`fun myFunc() {}`). Uma lambda é anônima e geralmente passada como argumento (`{ x -> x * 2 }`).
   </details>

2. **Reescreva esta lambda usando a sintaxe `it`:**
   ```kotlin
   val numbers = listOf(1, 2, 3)
   numbers.map { n -> n * 2 }
   ```
   <details>
   <summary>Resposta</summary>
   ```kotlin
   numbers.map { it * 2 }
   ```
   Quando há apenas 1 parâmetro, Kotlin permite usar `it` para referenciá-lo.
   </details>

3. **O que a função `.filter { it > 5 }` retorna?**
   <details>
   <summary>Resposta</summary>
   Uma nova lista contendo apenas elementos maiores que 5 do original.
   </details>

4. **Explique o que acontece em `runCatching { }.onSuccess { }.onFailure { }`:**
   <details>
   <summary>Resposta</summary>
   `runCatching` tenta executar o código. Se der sucesso, chama `onSuccess` (lambda recebe o resultado). Se der erro, chama `onFailure` (lambda recebe a exceção).
   </details>

---

## 📅 DIA 4 (Quinta-feira)
### Tema: "Collections e Data Classes — Estruturando Dados"

#### ⏰ Agenda do Dia (70 min)
- **0-10 min:** Revisão Dia 3
- **15-35 min:** Collections (List, Map, Set)
- **35-55 min:** Data Classes em profundidade
- **55-70 min:** Obsidian + Caderno

---

### 🎯 Objetivo do Dia 4
Você entenderá como Kotlin **organiza coleções de dados** e criará suas próprias **data classes** (similar a `dataclasses` do Python ou `@dataclass`, mas muito mais poderosas).

---

### 📚 O que Estudar (20 min)

**Leitura:**
- Kotlin Collections: https://kotlinlang.org/docs/collections-overview.html
- Data Classes: https://kotlinlang.org/docs/data-classes.html

**Vídeo (12 min):**
- "Kotlin Collections" — Google Developers
- https://www.youtube.com/watch?v=Z1t64R8J_Eg

**Análise do Projeto:**

Seu projeto já usa data classes em:
- `Message.kt` — modelo de mensagem
- `ChatRequest.kt` — request para API
- `ChatResponse.kt` — response da API
- `Treino.kt` — modelo de treino

Abra `Message.kt` novamente e veja:

```kotlin
data class Message(
    val id: String = UUID.randomUUID().toString(),
    val text: String,
    val isFromUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
)
```

**O que `data class` gera automaticamente:**
- ✅ `toString()` → `Message(id=xyz, text=ola, isFromUser=true, ...)`
- ✅ `equals()` → Compara todos os campos
- ✅ `hashCode()` → Para usar em HashMaps
- ✅ `copy()` → Cria cópia com alguns campos alterados

---

### 💻 Ações Práticas (35 min)

#### Ação 1: Collections (10 min)

No Kotlin Playground:

```kotlin
fun main() {
    // ===== LISTAS (ordenadas, podem repetir) =====
    val lista = listOf(1, 2, 3, 4, 5)
    println(lista[0])           // 1
    println(lista.size)         // 5
    println(lista.first())      // 1
    println(lista.last())       // 5
    println(lista.reversed())   // [5, 4, 3, 2, 1]
    
    // Listas mutáveis (podem adicionar/remover)
    val mutableList = mutableListOf(1, 2, 3)
    mutableList.add(4)
    println(mutableList)        // [1, 2, 3, 4]
    
    // ===== MAPS (chave-valor, como dicts do Python) =====
    val person = mapOf(
        "name" to "Larissa",
        "age" to 25,
        "city" to "São Paulo"
    )
    println(person["name"])     // Larissa
    println(person.get("age"))  // 25
    
    // ===== SETS (sem repetição) =====
    val uniqueNumbers = setOf(1, 2, 2, 3, 3, 3)
    println(uniqueNumbers)      // [1, 2, 3]
    
    // ===== OPERAÇÕES FUNCIONAIS =====
    val numbers = listOf(1, 2, 3, 4, 5)
    
    // filter (seleciona)
    val evenNumbers = numbers.filter { it % 2 == 0 }
    println("Pares: $evenNumbers")
    
    // map (transforma)
    val doubled = numbers.map { it * 2 }
    println("Dobrados: $doubled")
    
    // find (primeiro que atende condição)
    val firstOdd = numbers.find { it % 2 == 1 }
    println("Primeiro ímpar: $firstOdd")
    
    // any e all (validação)
    println(numbers.any { it > 4 })  // true
    println(numbers.all { it > 0 })  // true
    
    // fold (acumula)
    val sum = numbers.fold(0) { acc, value -> acc + value }
    println("Soma: $sum")  // 15
}
```

#### Ação 2: Data Classes (15 min)

```kotlin
// ===== DATA CLASS BÁSICA =====
data class User(
    val name: String,
    val email: String,
    val age: Int
)

// ===== VANTAGENS DA DATA CLASS =====
fun main() {
    val user1 = User("Larissa", "larissa@email.com", 25)
    
    // 1. toString() automático
    println(user1)
    // Saída: User(name=Larissa, email=larissa@email.com, age=25)
    
    // 2. equals() automático (compara conteúdo)
    val user2 = User("Larissa", "larissa@email.com", 25)
    println(user1 == user2)  // true!
    
    // 3. copy() com alterações
    val user3 = user1.copy(age = 26)
    println(user3)
    // User(name=Larissa, email=larissa@email.com, age=26)
    
    // 4. destructuring (desempacotamento)
    val (name, email, age) = user1
    println("$name, $email")
    
    // 5. Em coleções
    val users = listOf(
        User("João", "joao@email.com", 30),
        User("Maria", "maria@email.com", 28)
    )
    val olderUsers = users.filter { it.age > 25 }
    println(olderUsers)
}
```

#### Ação 3: Refatore o `Message` do Seu Projeto (5 min)

Você teria escrito em Python:

```python
from dataclasses import dataclass
from datetime import datetime
import uuid

@dataclass
class Message:
    text: str
    is_from_user: bool
    id: str = field(default_factory=uuid.uuid4)
    timestamp: float = field(default_factory=datetime.now().timestamp)
```

Em Kotlin é **muito mais limpo:**

```kotlin
import java.util.UUID

data class Message(
    val id: String = UUID.randomUUID().toString(),
    val text: String,
    val isFromUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
)
```

---

### 📝 Anotações para o Obsidian (15 min)

Crie: `/Documentos/obsidian/programação/Programação/Linguagens/Kotlin/Dia_4_Collections_Data_Classes.md`

```markdown
# Kotlin: Collections e Data Classes (Dia 4)

## Collections: Os Três Mosqueteiros

| Tipo | Características | Uso |
|------|-----------------|-----|
| **List** | Ordenada, permite duplicatas | Mensagens, histórico |
| **Map** | Chave-valor | Configurações, usuários |
| **Set** | Sem duplicatas | Tags únicas, IDs únicos |

## Data Classes: O Presente do Kotlin

### Geração Automática
```kotlin
data class Message(
    val text: String,
    val isFromUser: Boolean
)
```

Gera automaticamente:
- ✅ `toString()` → Bonito para logs
- ✅ `equals()` → Compara por valor, não referência
- ✅ `hashCode()` → Para HashMap
- ✅ `copy()` → Cria clone com alterações

### Exemplos Práticos (Ilena App)

#### 1. Message (seu modelo)
```kotlin
data class Message(
    val id: String = UUID.randomUUID().toString(),
    val text: String,
    val isFromUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
)

// Uso no ChatViewModel:
val userMessage = Message(text = text, isFromUser = true)
```

#### 2. ChatRequest (para API)
```kotlin
data class ChatRequest(val message: String)
```

#### 3. ChatResponse (da API)
```kotlin
data class ChatResponse(
    val message: String,
    val timestamp: Long?
)
```

## Operações Comuns em Collections

```kotlin
val messages = listOf(...)

// Filtrar
messages.filter { it.isFromUser }

// Transformar
messages.map { it.text }

// Encontrar
messages.find { it.id == "xyz" }

// Validar
messages.any { it.text.isEmpty() }

// Acumular
messages.fold("") { acc, msg -> "$acc\n${msg.text}" }
```

## Conexão com Projeto
- [[Message.kt]] define modelo imutável com data class
- [[ChatAdapter.kt]] itera sobre lista de Messages
- [[ChatViewModel.kt]] filtra e mapeia Messages
- [[MVVM Pattern]] depende fortemente de data classes

## Próximos
- [[Dia_5_Refatoracao_Pratica]]
```

---

### ❓ Perguntas de Fixação

1. **Qual é a diferença entre `listOf()` e `mutableListOf()`?**
   <details>
   <summary>Resposta</summary>
   `listOf()` é imutável (não pode adicionar/remover elementos). `mutableListOf()` permite mudanças. Por padrão, use `listOf()` (mais seguro).
   </details>

2. **Por que usar `data class` em vez de classe normal?**
   <details>
   <summary>Resposta</summary>
   `data class` gera automaticamente `toString()`, `equals()`, `hashCode()` e `copy()`. Sem boilerplate!
   </details>

3. **Escreva uma data class para representar um Chat (título, mensagens, data de criação):**
   <details>
   <summary>Resposta</summary>
   ```kotlin
   data class Chat(
       val title: String,
       val messages: List<Message>,
       val createdAt: Long = System.currentTimeMillis()
   )
   ```
   </details>

4. **O que faz `messages.map { it.text }`?**
   <details>
   <summary>Resposta</summary>
   Transforma uma lista de `Message` em uma lista de `String` (extraindo apenas o texto de cada mensagem).
   </details>

---

## 📅 DIA 5 (Sexta-feira)
### Tema: "Prática Integrada — Refatore Código Real"

#### ⏰ Agenda do Dia (90 min)
- **0-15 min:** Revisão da Semana
- **15-75 min:** Refatoração prática
- **75-90 min:** Consolidação no Obsidian

---

### 🎯 Objetivo do Dia 5
Integrar **tudo** que aprendeu durante a semana refatorando um código real (do seu projeto ou um script Python) para Kotlin, aplicando tipos, funções, lambdas e data classes.

---

### 💻 Ação Prática: Refatore seu código real (60 min)

#### Escolha 1 dos Cenários:

**Cenário A: Refatore uma função Python para Kotlin**

Python original (seu projeto ou imaginário):
```python
def process_chat_messages(messages, filter_user=True):
    """Filtra e processa mensagens do chat"""
    filtered = []
    for msg in messages:
        if filter_user and msg.get('from_user'):
            filtered.append(msg)
        elif not filter_user:
            filtered.append(msg)
    
    # Ordena por timestamp
    filtered.sort(key=lambda x: x['timestamp'])
    
    # Formata para exibição
    result = []
    for msg in filtered:
        result.append(f"{msg['sender']}: {msg['text']}")
    
    return result
```

Refatore para Kotlin:

```kotlin
data class ChatMessage(
    val id: String,
    val text: String,
    val senderName: String,
    val fromUser: Boolean,
    val timestamp: Long
)

fun processChatMessages(
    messages: List<ChatMessage>,
    filterUser: Boolean = true
): List<String> {
    return messages
        .filter { if (filterUser) it.fromUser else true }
        .sortedBy { it.timestamp }
        .map { "${it.senderName}: ${it.text}" }
}

// Uso:
val messages = listOf(
    ChatMessage("1", "Oi", "João", true, 100L),
    ChatMessage("2", "Olá!", "Assistente", false, 101L)
)

val formatted = processChatMessages(messages)
println(formatted)
// [João: Oi, Assistente: Olá!]
```

**Cenário B: Implemente novos métodos em uma data class existente**

Baseado em `Message.kt`:

```kotlin
data class Message(
    val id: String = UUID.randomUUID().toString(),
    val text: String,
    val isFromUser: Boolean,
    val timestamp: Long = System.currentTimeMillis()
) {
    // Métodos úteis
    fun isFromAssistant() = !isFromUser
    
    fun getFormattedTime(): String {
        val date = java.util.Date(timestamp)
        val format = java.text.SimpleDateFormat("HH:mm")
        return format.format(date)
    }
    
    fun getPreview(maxLength: Int = 50): String {
        return if (text.length > maxLength) {
            text.substring(0, maxLength) + "..."
        } else {
            text
        }
    }
}

// Uso no ChatAdapter:
message.getFormattedTime()  // "14:30"
message.getPreview()        // "Olá, como você está hoje?..."
```

---

### 📝 Consolidação no Obsidian (15 min)

Crie: `/Documentos/obsidian/programação/Programação/Linguagens/Kotlin/Dia_5_Pratica_Integracao.md`

```markdown
# Kotlin: Prática Integrada da Semana 1 (Dia 5)

## O Que Aprendemos em 5 Dias

### Segunda (Dia 1)
[[Dia_1_Introducao_Kotlin]] — Por que Kotlin?

### Terça (Dia 2)
[[Dia_2_Tipos_Variaveis]] — val, var, null-safety

### Quarta (Dia 3)
[[Dia_3_Funcoes_Kotlin]] — Funções, lambdas

### Quinta (Dia 4)
[[Dia_4_Collections_Data_Classes]] — Listas, Maps, data classes

### Sexta (Dia 5)
[[Dia_5_Pratica_Integracao]] — ESTE ARQUIVO

## Exercício Final: Refatoração Realizada

### Código Original (Python)
[... cole seu código Python refatorado ...]

### Código Kotlin
[... cole sua versão em Kotlin ...]

### Aprendizados Principais
1. ✅ Kotlin exige tipos, mas os infere automaticamente
2. ✅ Data classes eliminam boilerplate
3. ✅ Lambdas tornam código funcional e conciso
4. ✅ Null-safety previne bugs antes que ocorram
5. ✅ Funções são muito mais elegantes que em Java

## Próximas Semanas
- [[Semana 2]] — Android Fundamentals
- [[Semana 3]] — Ciclo de Vida e MVVM

## Referências Gerais
- [[Kotlin Overview]]
- [[Ilena App Project]]
- [[Roadmap Fullstack]]
```

---

### ❓ Perguntas Finais da Semana

**Responda no papel (Caderno de Engenharia de Software):**

1. **Qual foi o maior "aha!" moment dessa semana?**
   (Sem resposta certa, apenas reflita)

2. **Explique em 3 frases por que Kotlin é melhor que Python para Android:**
   <details>
   <summary>Resposta Modelo</summary>
   Kotlin é **tipado** (evita erros em runtime), tem **null-safety nativa** (previne crashes), e oferece **coroutines** para código assíncrono elegante. Python é ótimo para backend, mas Kotlin foi feito para o mobile.
   </details>

3. **Refatore este código Python para Kotlin sem olhar as respostas anteriores:**
   ```python
   def find_long_messages(messages):
       return [m['text'] for m in messages if len(m['text']) > 10]
   ```
   <details>
   <summary>Resposta</summary>
   ```kotlin
   fun findLongMessages(messages: List<Message>): List<String> {
       return messages
           .filter { it.text.length > 10 }
           .map { it.text }
   }
   ```
   </details>

4. **Qual é o padrão de `data class` que mais usaremos no Ilena App?**
   <details>
   <summary>Resposta Modelo</summary>
   `Message`, `ChatRequest`, `ChatResponse`. Eles representam os dados que trafegam entre a UI, o ViewModel e a API.
   </details>

---

## 📅 DIAS 6-7 (Sábado-Domingo)
### Tema: "Revisão e Consolidação"

#### ⏰ Agenda
- **Sábado (3 horas):** Releia suas anotações do Obsidian, faça 3 exercícios extras
- **Domingo (2 horas):** Finalize seu novo vault do Obsidian (veja próxima seção)

---

### Exercícios Extras (opcional, mas recomendado)

**Exercício 1: Clone de ChatMessage**

```kotlin
data class ChatMessage(
    val id: String,
    val text: String,
    val sender: String,
    val isFromUser: Boolean,
    val timestamp: Long
)

// Crie funções para:
// 1. Validar se a mensagem é válida (text não vazia)
// 2. Formatar para exibição
// 3. Agrupar mensagens por sender

fun isValid(message: ChatMessage): Boolean {
    return message.text.isNotBlank()
}

fun format(message: ChatMessage): String {
    return "${message.sender}: ${message.text}"
}

fun groupBySender(messages: List<ChatMessage>): Map<String, List<ChatMessage>> {
    return messages.groupBy { it.sender }
}
```

**Exercício 2: Operações em Listas**

```kotlin
val messages = listOf(
    ChatMessage("1", "Oi!", "João", true, 100L),
    ChatMessage("2", "Olá", "Bot", false, 101L),
    ChatMessage("3", "", "João", true, 102L),
    ChatMessage("4", "Como você está?", "João", true, 103L)
)

// Encontre:
// a) Todas as mensagens do usuário
// b) Mensagens não vazias
// c) A primeira mensagem
// d) O número de mensagens de cada person
// e) Se há alguma mensagem vazia

val userMessages = messages.filter { it.isFromUser }
val nonEmpty = messages.filter { it.text.isNotBlank() }
val first = messages.firstOrNull()
val grouped = messages.groupingBy { it.sender }.eachCount()
val hasEmpty = messages.any { it.text.isBlank() }

println(userMessages)
println(nonEmpty)
println(first)
println(grouped)
println(hasEmpty)
```

---

## 📊 Resumo de Aprendizagem da Semana 1

**Tempo Total: 6 horas de estudo prático**

| Dia | Tópico | Status |
|-----|--------|--------|
| Segunda | Kotlin vs Python vs Java | ✅ |
| Terça | Tipos e Variáveis | ✅ |
| Quarta | Funções e Lambdas | ✅ |
| Quinta | Collections e Data Classes | ✅ |
| Sexta | Prática Integrada | ✅ |
| Sábado-Domingo | Revisão + Novo Vault Obsidian | ⏳ |

---

## 🎯 Checklist de Conclusão da Semana 1

- [ ] Completou todos os 5 dias de estudo
- [ ] Respondeu todas as perguntas de fixação
- [ ] Criou 5 notas no Obsidian (uma por dia)
- [ ] Refatorou pelo menos 1 código Python para Kotlin
- [ ] Executou código no Kotlin Playground
- [ ] Analisou `Message.kt` e `ChatViewModel.kt` do seu projeto
- [ ] Criou novo vault com estrutura correta (próxima seção)
- [ ] Interligou notas com backlinks `[[...]]`

**Quando tiver tudo marcado, passe para Semana 2!**

---

## 🔗 Links Úteis para Revisão

- [Kotlin Playground](https://play.kotlinlang.org/)
- [Kotlin Docs Completas](https://kotlinlang.org/docs/home.html)
- [Seu Projeto Ilena](~/Documentos/codigos/ilena-app/)
- [[Roadmap Academico Fullstack]]


