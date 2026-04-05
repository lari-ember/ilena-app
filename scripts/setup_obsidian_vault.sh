#!/bin/bash

##############################################################################
# Script: Criar Estrutura Completa do Obsidian Vault - Programação
# Propósito: Automatizar a criação de pastas e MOCs para estudo estruturado
# Autor: Gerado para Larissa
# Data: Abril 2026
##############################################################################

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Caminho base do Obsidian Vault
VAULT_PATH="$HOME/Documentos/obsidian/programação/Programação"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Criando Estrutura Completa do Vault - Programação       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}\n"

# Função para criar diretório com feedback
criar_pasta() {
    local path="$1"
    if [ ! -d "$path" ]; then
        mkdir -p "$path"
        echo -e "${GREEN}✓${NC} Criada: $path"
    else
        echo -e "${YELLOW}→${NC} Já existe: $path"
    fi
}

# Função para criar arquivo com conteúdo
criar_arquivo() {
    local filepath="$1"
    local content="$2"

    if [ ! -f "$filepath" ]; then
        echo "$content" > "$filepath"
        echo -e "${GREEN}✓${NC} Arquivo criado: $(basename $filepath)"
    else
        echo -e "${YELLOW}→${NC} Arquivo já existe: $(basename $filepath)"
    fi
}

# ============================================================================
# FASE 1: Criar Estrutura de Pastas
# ============================================================================

echo -e "\n${BLUE}FASE 1: Criando Estrutura de Pastas...${NC}\n"

# Pasta raiz
criar_pasta "$VAULT_PATH"

# 00_Hubs (Mapa de Conteúdo - MOCs)
criar_pasta "$VAULT_PATH/00_Hubs"

# Ciência da Computação
criar_pasta "$VAULT_PATH/Ciencia_Computacao"
criar_pasta "$VAULT_PATH/Ciencia_Computacao/_recursos"

# Engenharia de Software
criar_pasta "$VAULT_PATH/Engenharia_Software"
criar_pasta "$VAULT_PATH/Engenharia_Software/_recursos"

# Linguagens de Programação
criar_pasta "$VAULT_PATH/Linguagens"
criar_pasta "$VAULT_PATH/Linguagens/Java"
criar_pasta "$VAULT_PATH/Linguagens/Kotlin"
criar_pasta "$VAULT_PATH/Linguagens/Python"
criar_pasta "$VAULT_PATH/Linguagens/TypeScript"

# Frameworks
criar_pasta "$VAULT_PATH/Frameworks"
criar_pasta "$VAULT_PATH/Frameworks/Spring_Boot"
criar_pasta "$VAULT_PATH/Frameworks/Android"
criar_pasta "$VAULT_PATH/Frameworks/Angular"

# Projetos
criar_pasta "$VAULT_PATH/Projetos"
criar_pasta "$VAULT_PATH/Projetos/Ilena-App"
criar_pasta "$VAULT_PATH/Projetos/Ilena-App/Diarios"
criar_pasta "$VAULT_PATH/Projetos/Ilena-App/Decisoes_Arquiteturais"

# Templates
criar_pasta "$VAULT_PATH/_templates"

# ============================================================================
# FASE 2: Criar Arquivos MOC (Maps of Content)
# ============================================================================

echo -e "\n${BLUE}FASE 2: Criando Maps of Content (MOCs)...${NC}\n"

# MOC Principal
criar_arquivo "$VAULT_PATH/00_Hubs/Mapa_de_Conteudo_Programacao.md" '# 📚 Mapa de Conteúdo — Programação

## Índice Hierárquico

### 🔬 Ciência da Computação
- [[Estruturas_de_Dados]]
- [[Algoritmos]]
- [[Paradigmas_de_Programacao]]
- [[Complexidade_Computacional]]

### 🏗️ Engenharia de Software
- [[Spec-Driven_Development]]
- [[Design_Patterns]]
- [[Arquitetura_Limpa]]
- [[SOLID_Principles]]
- [[Testes_Unitarios]]

### 💻 Linguagens
- [[Java_Overview]]
- [[Kotlin_Overview]]
- [[Python_Overview]]
- [[TypeScript_Overview]]

### 🛠️ Frameworks
- [[Spring_Boot_Overview]]
- [[Android_Overview]]
- [[Angular_Overview]]

### 📱 Projetos Ativos
- [[Ilena-App_Overview]]

---

**Última atualização:** Abril 2026
**Status:** Em desenvolvimento
'

# MOC Ciência da Computação
criar_arquivo "$VAULT_PATH/Ciencia_Computacao/MOC_Ciencia_Computacao.md" '# 🔬 Ciência da Computação

## Estruturas de Dados
- [[Estruturas_de_Dados]] — Visão geral
- [[Listas_Arrays]]
- [[Pilhas_Filas]]
- [[Árvores]]
- [[Grafos]]
- [[Tabelas_Hash]]

## Algoritmos
- [[Algoritmos_Overview]]
- [[Busca_Pesquisa]]
- [[Ordenação]]
- [[Grafos_Algoritmos]]
- [[Programação_Dinamica]]

## Conceitos Fundamentais
- [[Complexidade_Assintotica]] (Big-O, Big-Theta)
- [[Recursão]]
- [[Divisão_e_Conquista]]
- [[Paradigmas_de_Programacao]]

## Relacionado com Projetos
- [[Ilena-App]] usa [[Estruturas_de_Dados]] para gerenciar mensagens
- [[ChatViewModel]] implementa padrões [[Observer]]

---

**Referências:**
- [[Entendendo Algoritmos — Aditya Bhargava]]
- [[Introduction to Algorithms — CLRS]]
'

# MOC Engenharia de Software
criar_arquivo "$VAULT_PATH/Engenharia_Software/MOC_Engenharia_Software.md" '# 🏗️ Engenharia de Software

## Metodologias e Práticas
- [[Spec-Driven_Development]] ⭐ FOCO VAGA
- [[Test-Driven_Development]]
- [[Continuous_Integration]]
- [[Agile_Scrum]]

## Arquitetura
- [[Arquitetura_Limpa]] (Clean Architecture)
- [[Arquitetura_Hexagonal]] (Ports and Adapters)
- [[MVVM]] — Usado no Ilena-App
- [[MVC_Pattern]]
- [[Repository_Pattern]]

## Design Patterns
- [[Design_Patterns_Overview]]
- [[Padrões_Criacionais]] (Singleton, Factory, Builder)
- [[Padrões_Estruturais]] (Facade, Proxy, Decorator)
- [[Padrões_Comportamentais]] (Observer, Strategy, Command)

## Princípios SOLID
- [[Single_Responsibility_Principle]]
- [[Open_Closed_Principle]]
- [[Liskov_Substitution_Principle]]
- [[Interface_Segregation_Principle]]
- [[Dependency_Inversion_Principle]]

## Testes
- [[Testes_Unitarios]]
- [[Testes_Integracao]]
- [[Testes_Ponta_a_Ponta]]
- [[Pirâmide_Testes]]
- [[Mocking_e_Stubbing]]

---

**Aplicação no Ilena-App:**
- [[MVVM_em_Android]]
- [[Repository_Pattern_no_Android]]
- [[Testes_ChatViewModel]]

**Referências:**
- [[Clean Architecture — Robert C. Martin]]
- [[Effective Java — Joshua Bloch]]
'

# MOC Linguagens - Java
criar_arquivo "$VAULT_PATH/Linguagens/Java/MOC_Java.md" '# ☕ Java

## Fundamentos
- [[Java_Overview]]
- [[JVM_Java_Virtual_Machine]]
- [[Tipos_Basicos_Java]]
- [[Controle_Fluxo]]
- [[Funções_Métodos_Java]]

## Programação Orientada a Objetos
- [[Classes_Objetos]]
- [[Herança_Java]]
- [[Polimorfismo_Java]]
- [[Interfaces_Java]]
- [[Classes_Abstratas]]
- [[Encapsulamento]]

## Collections e Generics
- [[Collections_Framework]]
- [[List_ArrayList]]
- [[Map_HashMap]]
- [[Set_HashSet]]
- [[Generics_Java]]

## Streams e Functional
- [[Streams_API]]
- [[Lambda_Expressions_Java]]
- [[Functional_Interfaces]]

## Concorrência
- [[Threads_Java]]
- [[Sincronização]]
- [[Concurrent_Collections]]

## Para a Vaga Mid-Level
- [[Effective_Java_Best_Practices]]
- [[Spring_Boot_Integration]]
- [[Testing_Java]]

---

**Referência Principal:** [[Effective Java — Joshua Bloch]]
'

# MOC Linguagens - Kotlin
criar_arquivo "$VAULT_PATH/Linguagens/Kotlin/MOC_Kotlin.md" '# 🎯 Kotlin

## Fundamentos
- [[Kotlin_Overview]]
- [[Kotlin_vs_Java]]
- [[Kotlin_vs_Python]]
- [[Tipos_Basicos_Kotlin]]
- [[Null_Safety]]

## Sintaxe e Características
- [[Variáveis_val_var]]
- [[Funções_Kotlin]]
- [[Lambda_Expressions_Kotlin]]
- [[String_Interpolation]]
- [[Data_Classes]]
- [[Sealed_Classes]]

## Programação Funcional
- [[Programação_Funcional_Kotlin]]
- [[Higher_Order_Functions]]
- [[Inline_Functions]]
- [[Extension_Functions]]
- [[Scope_Functions]] (let, run, apply, with, also)

## Coroutines
- [[Coroutines_Kotlin]] ⭐
- [[Suspend_Functions]]
- [[Coroutine_Builders]]
- [[Dispatchers]]
- [[Channels_Flow]]

## Collections
- [[Collections_Kotlin]]
- [[Immutable_Collections]]
- [[Collection_Operations]]

## No Projeto Ilena
- [[ChatViewModel_Kotlin]]
- [[Message_Data_Class]]
- [[ChatActivity_Kotlin]]

---

**Diários de Aprendizado:**
- [[Dia_1_Introducao_Kotlin]]
- [[Dia_2_Tipos_Variaveis]]
- [[Dia_3_Funcoes_Kotlin]]
- [[Dia_4_Collections_Data_Classes]]
- [[Dia_5_Pratica_Integracao]]

**Referência Principal:** [[Kotlin in Action]]
'

# MOC Linguagens - TypeScript
criar_arquivo "$VAULT_PATH/Linguagens/TypeScript/MOC_TypeScript.md" '# 📘 TypeScript

## Fundamentos
- [[TypeScript_Overview]]
- [[TypeScript_vs_JavaScript]]
- [[Tipos_TypeScript]]
- [[Interfaces_TypeScript]]
- [[Genéricos_TypeScript]]

## Características Avançadas
- [[Decorators_TypeScript]]
- [[Type_Guards]]
- [[Utility_Types]]
- [[Advanced_Types]]

## Para Angular
- [[TypeScript_no_Angular]]
- [[Strongly_Typed_Components]]
- [[Services_TypeScript]]
- [[RxJS_Observables]]

---

**Conexão com Projeto:** [[Angular_Chat_Component]]
'

# MOC Frameworks - Spring Boot
criar_arquivo "$VAULT_PATH/Frameworks/Spring_Boot/MOC_Spring_Boot.md" '# ☕ Spring Boot

## Fundamentos
- [[Spring_Boot_Overview]]
- [[Spring_Architecture]]
- [[IoC_Container]]
- [[Dependency_Injection]]

## Web e REST
- [[Spring_MVC]]
- [[REST_Controllers]]
- [[Request_Response_Mapping]]
- [[Exception_Handling]]

## Dados
- [[JPA_Hibernate]]
- [[Repositories_Spring_Data]]
- [[Transações]]

## Segurança
- [[Spring_Security]]
- [[JWT_Authentication]]
- [[OAuth2]]

## Testing
- [[Spring_Test]]
- [[MockMvc]]
- [[TestContainers]]

## Para o Ilena-App Backend
- [[Chat_Endpoint_Spring]]
- [[IA_Integration_Spring]]
- [[Database_Design]]

---

**Referência Principal:** [[Spring in Action — Craig Walls]]
**Portal Prático:** [[Baeldung.com]]
'

# MOC Frameworks - Android
criar_arquivo "$VAULT_PATH/Frameworks/Android/MOC_Android.md" '# 📱 Android

## Fundamentos
- [[Android_Overview]]
- [[Activity_Lifecycle]]
- [[Fragment_Lifecycle]]
- [[Intents]]

## Arquitetura
- [[MVVM_Architecture]]
- [[Repository_Pattern]]
- [[Dependency_Injection_Android]]
- [[Hilt_Framework]]

## UI
- [[Views_Layouts]]
- [[View_Binding]]
- [[RecyclerView]]
- [[Jetpack_Compose]] (futuro)

## Data
- [[Room_Database]]
- [[SharedPreferences]]
- [[DataStore]]

## Networking
- [[Retrofit]]
- [[OkHttp]]
- [[Coroutines_Android]]

## No Ilena-App
- [[ChatActivity]]
- [[ChatViewModel]]
- [[ChatAdapter]]
- [[Message_Model]]
- [[Retrofit_Setup]]

---

**Documentação Oficial:** [[Android Developers]]
**Cursos:** [[Google Codelabs Android]]
'

# MOC Frameworks - Angular
criar_arquivo "$VAULT_PATH/Frameworks/Angular/MOC_Angular.md" '# 🅰️ Angular

## Fundamentos
- [[Angular_Overview]]
- [[Components]]
- [[Templates]]
- [[Data_Binding]]

## Arquitetura
- [[Angular_Architecture]]
- [[Services_Dependency_Injection]]
- [[RxJS_Observables]]
- [[NgRx_State_Management]]

## Routing
- [[Angular_Router]]
- [[Route_Guards]]
- [[Lazy_Loading]]

## Formulários
- [[Template_Driven_Forms]]
- [[Reactive_Forms]]
- [[Validação_Formulários]]

## HTTP
- [[HttpClient_Angular]]
- [[Interceptors]]

## Testing
- [[Jasmine_Karma]]
- [[Component_Testing]]

## No Projeto Ilena-App Web
- [[ChatComponent_Angular]]
- [[ChatService_Angular]]
- [[MessageList_Component]]

---

**Tutorial Oficial:** [[Angular.dev]]
**Cursos:** [[Angular University]]
'

# MOC Projetos - Ilena-App
criar_arquivo "$VAULT_PATH/Projetos/Ilena-App/Ilena-App_Overview.md" '# 🤖 Ilena App — Assistente Virtual com IA

## 📋 Visão Geral
**Projeto:** Assistente Virtual multiplatforma (Mobile + Web)
**Status:** Em Desenvolvimento (Milestone 1)
**Stack:**
- Mobile: Android + Kotlin + MVVM
- Web: Angular + TypeScript + RxJS
- Backend: Spring Boot (Java) + FastAPI (Python)
- IA: OpenAI / Anthropic

## 🎯 Objetivos
1. Aprender Fullstack Development (Java/Angular/Android)
2. Preparar-se para vaga Mid-Level
3. Praticar Spec-Driven Development
4. Integrar com IA (OpenAI/Anthropic)

## 📱 Plataformas
- [[Ilena_Mobile_Android]]
- [[Ilena_Web_Angular]]
- [[Ilena_Backend_Java]]
- [[Ilena_Backend_Python]]

## 🚀 Roadmap
- [[Milestone_1_Fundamentos]]
- [[Milestone_2_MVP_Chat]]
- [[Milestone_3_IA_Real]]
- [[Milestone_4_Testes]]
- [[Milestone_5_Deploy]]

## 📖 Diários de Engenharia
- [[Dia_1_Introducao_Kotlin]]
- [[Dia_2_Tipos_Variaveis]]
- [[ADR_001_MVVM_Pattern]]
- [[ADR_002_Retrofit_Setup]]

## 🔗 Documentação
- [[ARQUITETURA_CHAT]]
- [[ROADMAP_ACADEMICO_FULLSTACK]]
- [[plano-desenvolvimento-assistente-ia]]

---

**Repositório:** ~/Documentos/codigos/ilena-app/
**Data de Criação:** Março 2026
**Última Atualização:** Abril 2026
'

# ============================================================================
# FASE 3: Criar Templates Reutilizáveis
# ============================================================================

echo -e "\n${BLUE}FASE 3: Criando Templates...${NC}\n"

criar_arquivo "$VAULT_PATH/_templates/Template_Aula.md" '# Template: Aula / Tópico

## Metadata
- **Disciplina:** [Linguagem/Conceito]
- **Data:** [Data]
- **Tempo Gasto:** [minutos]
- **Referência:** [Link/Livro]

## 📌 Resumo Executivo
[1-2 parágrafos do que você aprendeu]

## 🎯 Conceitos-Chave
- [ ] Conceito 1
- [ ] Conceito 2
- [ ] Conceito 3

## 💡 Exemplo Prático
```kotlin
// ou java, typescript, etc
```

## 🔗 Conexões
- [[Conceito_Relacionado_1]]
- [[Conceito_Relacionado_2]]
- [[Projeto_em_que_Uso]]

## ❓ Perguntas de Fixação
1. Pergunta 1?
2. Pergunta 2?

## 📚 Referências
- [Referência 1]
- [Referência 2]

---

**Status:** 🟢 Completo | 🟡 Em progresso | 🔴 Por fazer
'

criar_arquivo "$VAULT_PATH/_templates/Template_Anotacao_Codigo.md" '# Template: Análise de Código

## 📝 Fichamento de Código
- **Arquivo:** [caminho/arquivo.kt]
- **Projeto:** [[Projeto]]
- **Componente:** [UI/ViewModel/Data/etc]

## 🔍 O que Este Código Faz
[Descrição clara da responsabilidade]

## 📍 Localização no Projeto
```
app/src/main/java/com/ilena/app/
└── [componente]
    └── NomeClasse.kt
```

## 💻 Código Analisado
```kotlin
// Copie o código relevante aqui
```

## 🧠 O Que Aprender
1. Padrão: [[Design_Pattern_Usado]]
2. Técnica: [[Técnica_Kotlin]]
3. Prática: [[Best_Practice]]

## 🔗 Relacionado
- [[Classe_Relacionada_1]]
- [[Interface_Usada]]

---

**Última revisão:** [Data]
'

criar_arquivo "$VAULT_PATH/_templates/Template_ADR.md" '# ADR: Architectural Decision Record

## Registro de Decisão Arquitetural
**ADR-XXX:** [Título da Decisão]

### Status
- [ ] Proposto
- [x] Aceito
- [ ] Rejeitado
- [ ] Descontinuado

### Contexto
[Por que essa decisão foi necessária? Quais eram as alternativas?]

### Decisão
[Qual foi a decisão tomada?]

### Justificativa
[Por que escolhemos isso em vez das alternativas?]

### Implicações
✅ Vantagens:
- [Vantagem 1]
- [Vantagem 2]

❌ Desafios:
- [Desafio 1]
- [Desafio 2]

### Alternativas Consideradas
1. **Alternativa A**: [Descrição]
   - Pros: ...
   - Cons: ...

2. **Alternativa B**: [Descrição]
   - Pros: ...
   - Cons: ...

### Referências
- [[Ilena-App]]
- [[MVVM_Architecture]]

---

**Data:** [YYYY-MM-DD]
**Autor:** [Seu Nome]
**Revisado por:** [Se aplicável]
'

criar_arquivo "$VAULT_PATH/_templates/Template_Livro.md" '# Fichamento: [Título do Livro]

## 📚 Metadata
- **Autor:** [Nome]
- **Ano:** [Ano]
- **Páginas:** [Total]
- **Status:** 📖 Lendo | ✅ Concluído | 📋 Planejado
- **Progresso:** [Página X de Y]

## 🎯 Por Que Ler Este Livro
[Qual é a relevância para seus objetivos?]

## 📝 Capítulos Principais
- [ ] Capítulo 1: [Tema]
- [ ] Capítulo 2: [Tema]
- [ ] Capítulo 3: [Tema]

## 💡 Aprendizados Principais
1. [Aprendizado 1]
2. [Aprendizado 2]
3. [Aprendizado 3]

## 🔗 Conexões
- [[Conceito_Relacionado_1]]
- [[Projeto_em_que_Aplico]]

## ⭐ Citações Importantes
> "[Citação importante com número da página]" — p. XXX

## 📌 Anotações Detalhadas
### Capítulo X: [Título]
- Ponto 1
- Ponto 2
- [[Nota_Relacionada]]

## 💬 Reflexão Pessoal
[O que você achou? Como isso muda sua perspectiva?]

---

**Leitura Recomendada para:** [[Vaga_Mid_Level]], [[Java]], etc
'

# ============================================================================
# FASE 4: Criar Arquivos de Inicialização
# ============================================================================

echo -e "\n${BLUE}FASE 4: Criando Arquivos Iniciais...${NC}\n"

# README para cada seção
criar_arquivo "$VAULT_PATH/Ciencia_Computacao/README.md" '# 🔬 Ciência da Computação

Fundações teóricas para programação avançada.

## Tópicos
1. [[Estruturas_de_Dados]]
2. [[Algoritmos]]
3. [[Complexidade_Computacional]]

Consulte [[MOC_Ciencia_Computacao]] para visão completa.
'

criar_arquivo "$VAULT_PATH/Engenharia_Software/README.md" '# 🏗️ Engenharia de Software

Práticas, padrões e princípios para código robusto.

## Foco da Vaga Mid-Level
- ⭐ [[Spec-Driven_Development]]
- ⭐ [[Arquitetura_Limpa]]
- ⭐ [[SOLID_Principles]]

Consulte [[MOC_Engenharia_Software]] para visão completa.
'

criar_arquivo "$VAULT_PATH/Linguagens/README.md" '# 💻 Linguagens de Programação

Documentação de sintaxe e paradigmas.

## Linguagens Estudadas
- [[Java]] — Backend, Spring Boot
- [[Kotlin]] — Mobile, Android
- [[TypeScript]] — Frontend, Angular
- [[Python]] — Backend Alternativo (já sabe)

Cada linguagem tem seu próprio MOC.
'

criar_arquivo "$VAULT_PATH/Frameworks/README.md" '# 🛠️ Frameworks

Ecossistemas e bibliotecas para desenvolvimento prático.

## Frameworks Estudados
- [[Spring_Boot]] — Backend Java
- [[Android]] — Mobile
- [[Angular]] — Frontend Web

Cada framework tem seu próprio MOC.
'

criar_arquivo "$VAULT_PATH/Projetos/Ilena-App/README.md" '# 🤖 Ilena-App

Projeto prático integrado com aprendizado.

## Documentação
- [[Ilena-App_Overview]]
- [[ARQUITETURA_CHAT]]
- [[ROADMAP_ACADEMICO_FULLSTACK]]

## Diários
- [[Dia_1_Introducao_Kotlin]]
- [[Dia_2_Tipos_Variaveis]]

## Decisões Arquiteturais
- [[ADR_001_MVVM_Pattern]]

---

Repositório: ~/Documentos/codigos/ilena-app/
'

# ============================================================================
# FASE 5: Criar Primeira Nota de Dia 1
# ============================================================================

echo -e "\n${BLUE}FASE 5: Criando Primeira Nota (Dia 1 — Kotlin)...${NC}\n"

criar_arquivo "$VAULT_PATH/Linguagens/Kotlin/Dia_1_Introducao_Kotlin.md" '# Kotlin: Introdução (Dia 1 — Semana 1)

## Metadata
- **Data:** 5 de Abril de 2026
- **Tempo Gasto:** 60 minutos
- **Status:** ✅ Completo

## 📖 Fichamento
Aprendemos por que Kotlin foi escolhido para Android e como se posiciona entre Python (simples, dinâmico) e Java (verboso, tipado).

## 🎯 Conceitos-Chave
- ✅ Null-Safety nativa
- ✅ Type Inference
- ✅ Coroutines
- ✅ Interoperabilidade com Java

## 💡 Exemplo Prático
```kotlin
// Python: sem proteção contra null
name = None
name.upper()  // ❌ Crash!

// Kotlin: null-safety obrigatória
val name: String? = null
name?.uppercase()  // ✅ Seguro!
```

## 🔗 Conexões
- [[Kotlin_Overview]]
- [[Null_Safety]]
- [[Android_Overview]]
- [[Ilena-App]]

## ❓ Perguntas de Fixação
1. Por que Kotlin é melhor que Python para Android?
2. O que significa `String?`?
3. Qual é a vantagem de Coroutines?

## 📚 Referências
- [Kotlin Playground](https://play.kotlinlang.org/)
- [Why Kotlin?](https://kotlinlang.org/docs/home.html)

---

**Próxima Aula:** [[Dia_2_Tipos_Variaveis]]
'

# ============================================================================
# RESUMO FINAL
# ============================================================================

echo -e "\n${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║         ✓ Estrutura Criada com Sucesso!                   ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}\n"

# Contar pastas criadas
PASTA_COUNT=$(find "$VAULT_PATH" -type d | wc -l)
ARQUIVO_COUNT=$(find "$VAULT_PATH" -type f -name "*.md" | wc -l)

echo -e "${BLUE}Resumo:${NC}"
echo -e "  📁 Pastas criadas: ${GREEN}$PASTA_COUNT${NC}"
echo -e "  📄 Arquivos .md criados: ${GREEN}$ARQUIVO_COUNT${NC}"
echo ""

echo -e "${BLUE}Próximos Passos:${NC}"
echo -e "  1. ${YELLOW}Abra o Obsidian${NC}"
echo -e "  2. ${YELLOW}Vá em Settings → Vault → Abra a pasta${NC}"
echo -e "  3. ${YELLOW}Navegue para:${NC} $VAULT_PATH"
echo -e "  4. ${YELLOW}Comece em:${NC} 00_Hubs/Mapa_de_Conteudo_Programacao.md"
echo ""

echo -e "${BLUE}Estrutura Criada:${NC}"
echo ""
echo -e "${GREEN}Programação/${NC}"
echo -e "├── 📂 00_Hubs/ ${BLUE}(Índices e MOCs)${NC}"
echo -e "├── 📂 Ciencia_Computacao/ ${BLUE}(Teória)${NC}"
echo -e "├── 📂 Engenharia_Software/ ${BLUE}(Padrões e Princípios)${NC}"
echo -e "├── 📂 Linguagens/ ${BLUE}(Java, Kotlin, TypeScript, Python)${NC}"
echo -e "├── 📂 Frameworks/ ${BLUE}(Spring Boot, Android, Angular)${NC}"
echo -e "├── 📂 Projetos/ ${BLUE}(Ilena-App)${NC}"
echo -e "├── 📂 _templates/ ${BLUE}(Templates Reutilizáveis)${NC}"
echo ""

echo -e "${YELLOW}⚠️  Importante:${NC}"
echo -e "  • Cada pasta tem um MOC (Mapa de Conteúdo)"
echo -e "  • Use [[backlinks]] para interligar conceitos"
echo -e "  • Siga os templates em _templates/ para consistência"
echo -e "  • Comece pelo arquivo de Dia 1 em Kotlin/"
echo ""

echo -e "${BLUE}Para Explorar:${NC}"
echo -e "  • ${YELLOW}Dia 1:${NC} Dia_1_Introducao_Kotlin.md"
echo -e "  • ${YELLOW}Mapa Principal:${NC} Mapa_de_Conteudo_Programacao.md"
echo -e "  • ${YELLOW}Projeto:${NC} Projetos/Ilena-App/Ilena-App_Overview.md"
echo ""

echo -e "${GREEN}✓ Script Concluído com Sucesso!${NC}\n"
'

