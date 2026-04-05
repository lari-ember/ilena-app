# Roadmap Integradador Acadêmico-Prático: Fullstack (Java/Angular/Android)

Este documento interliga seu plano prático do projeto "Ilena Assistente" com um aprendizado acadêmico profundo (Ciência da Computação, Engenharia e Arquitetura de Software), focado em prepará-la para a vaga Mid-Level Fullstack e adoção da metodologia **Spec-Driven Development (Desenvolvimento Guiado por Especificação)**.

---

## 🧠 1. Sistema de Gestão do Conhecimento (Obsidian x Caderno Físico)

A separação do local de anotação otimiza a retenção (físico) e a organização estruturada e interligada (digital).

### 📓 Caderno Físico (O que vai para o papel)
1. **Rascunhos de Arquitetura (UML):** Desenhe as relações entre `ChatActivity` -> `ViewModel` -> `Repository`.
2. **Diagramas de Fluxo (Flowcharts):** O fluxo de uma requisição saindo do Angular, passando pelo Spring Boot e chegando ao Banco de Dados.
3. **Memória Muscular de Lógica:** Resolução de algoritmos complexos (Árvores, Grafos) e testes de mesa antes de codar.
4. **Mindmaps de Conceitos:** Como Paradigmas de POO (Herança, Polimorfismo, Encapsulamento) se conectam.

### 💻 Obsidian Vault (`/obsidian/programação/`)
Crie as seguintes pastas e Maps of Content (MOC):

*   📂 `Programação/`
    *   📂 `00_Hubs/`
        *   `Mapa de Conteúdo - Programação.md` (Índice mestre)
    *   📂 `Ciencia_Computacao/`
        *   `Estruturas_de_Dados.md` (Listas, Hashes, Árvores - Compare implementações Python vs Java)
        *   `Algoritmos.md` (Complexidade Ciclomática, Notação Big-O)
    *   📂 `Engenharia_Software/`
        *   `Spec-Driven_Development.md` (Práticas, RFCs, Mocking)
        *   `Design_Patterns.md` (Singleton, Factory, Observer - linkado com `[[Android]]`)
        *   `Arquitetura_Limpa.md` (Clean Architecture, SOLID)
    *   📂 `Linguagens/`
        *   `Java/` -> Notas de sintaxe, Streams, JVM, Garbage Collector.
        *   `Kotlin/` -> Coroutines, Null-Safety, Data Classes.
        *   `TypeScript/` -> Interseções de Tipos, Decorators.
    *   📂 `Frameworks/`
        *   `Spring_Boot.md` -> Injeção de Dependências (IoC), Spring Security.
        *   `Angular.md` -> Componentes, RxJS (Interligar com `[[Kotlin Coroutines]]`), NgRx.
        *   `Android.md` -> Jetpack Compose, MVVM, Ciclo de Vida.
    *   📂 `Projetos/Ilena-App/`
        *   `Diário de Engenharia.md` -> Log de decisões arquiteturais (ADRs).

**Regra de Ouro do Obsidian (Zettelkasten):** Sempre use backlinks! Quando estudar Retrofit no Android, escreva: `"O Retrofit usa o padrão de projeto [[Facade]] e [[Proxy]] para simplificar as requisições HTTP, servindo ao nosso plano em [[Milestone 2 - Ilena]]"`.

---

## 🚀 2. O Roadmap Interligado (Teoria Acadêmica + Prática Ilena)

Este roadmap alinha seus **Milestones Nativos (M1 a M5)** com o currículo de Fullstack Mid-Level.

### FASE 1: Fundamentos, Contratos e Especificações (Semanas 1-4)
**Interligação:** `Milestone 1` do Ilena (Fundamentos + Arquitetura)
**Metodologia:** Comece a usar *Spec-Driven Development*. Em vez de codar a API direto, escreva a documentação primeiro (OpenAPI/Swagger).

*   **Ciência da Computação:** Tipos Abstratos de Dados, HTTP Lifecycle, Modelo OSI.
*   **Java/Spring Boot:**
    *   Ecossistema JVM.
    *   POO no Java (Interfaces, Classes Abstratas).
    *   Criando a spec da API do Ilena (OpenAPI/YAML) e implementando o backend de mock *também* em Spring Boot (para estudo da vaga), não só FastAPI.
*   **Ação no Obsidian:** Crie uma nota `[[Spec-Driven Development]]`. Documente o contrato JSON de `/chat` antes de implementar.

### FASE 2: Client-side e Programação Reativa (Semanas 5-8)
**Interligação:** `Milestone 2` do Ilena (MVP de Chat no App) + `Milestone 3` (Integração IA)

*   **Engenharia de Software:** Design Patterns (Repository Pattern, Dependency Injection, Observer).
*   **Kotlin (Android):**
    *   Coroutines e Fluxos Assíncronos (Suspend functions).
    *   Padrão MVVM no Jetpack (LiveData vs StateFlow).
*   **TypeScript (Angular Web):**
    *   Migre o conceito mental do App nativo para a Web.
    *   `ChatActivity` no Android = `ChatComponent` no Angular.
    *   `ChatViewModel` no Android = `ChatService` com RxJS (`BehaviorSubject`) no Angular.
*   **Ação no Obsidian:** Crie uma nota genérica `[[Programação Reativa]]`. Compare como você escuta mudanças de estado (*Loading, Success, Error*) usando LiveData (Kotlin) vs Observables (RxJS/Angular).

### FASE 3: Integração de Sistemas e Arquitetura de Software (Semanas 9-12)
**Interligação:** `Milestone 4` (Qualidade, Testes) e Evolução do Backend (Spring Boot).

*   **Arquitetura:** Clean Architecture, Hexagonal Architecture (Ports and Adapters).
*   **Java/Spring:**
    *   Implementando Integração com IA OpenAI no Java.
    *   Spring WebFlux vs Spring MVC.
    *   Acesso a Dados: JPA / Hibernate. Relance os conceitos de Banco de Dados Relacional (Normalização, ACID).
*   **Testes (Nível Acadêmico):**
    *   Pirâmide de Testes.
    *   Test-Driven Development (TDD).
    *   JUnit e Mockito (Java) / JUnit e MockK (Kotlin) / Karma e Jasmine (Angular).
*   **Ação no Caderno Físico:** Desenhe diagrama arquitetural em camadas (Domain -> Usecases -> Controllers -> DB) garantindo a regra de dependência do SOLID (Principalmente o 'D' - Dependency Inversion).

### FASE 4: DevSecOps, Deploy e Otimizações (Semanas 13-16)
**Interligação:** `Milestone 5` do Ilena (Deploy e release).

*   **Ciência da Computação:** Concorrência, Multithreading, Gerenciamento de Memória (Como evitar Memory Leaks no Android e no Angular).
*   **Segurança (Vaga Mid-level):** JWT (JSON Web Tokens), OAuth2, CORS, Proteção contra CSRF/XSS.
*   **Infraestrutura:** Docker (Entender imagens multicamadas Java vs Python), CI/CD básico (GitHub Actions).
*   **Ação no Obsidian:** Documente o fluxo de publicação na Google Play vs Deploy do backend Spring/FastAPI num roteador proxy reverso (Nginx). `[[Deploy Pipeline]]`.

---

## 📚 3. Referências Bibliográficas de Nível Universitário/Mercado

### Engenharia de Software e Arquitetura 🏗️
*   🇺🇸 *Clean Architecture: A Craftsman's Guide to Software Structure and Design* (Robert C. Martin) - **Obrigatório para nível Mid.**
*   🇺🇸 *Designing Data-Intensive Applications* (Martin Kleppmann) - Para entender base de dados (Leitura densa, vá devagar).
*   🇧🇷 *Engenharia de Software* (Ian Sommerville) - Referência acadêmica base.

### Java e Spring Boot ☕
*   🇺🇸 *Effective Java* (Joshua Bloch) - Ensina a pensar e codar um "Java bonito e seguro", não apenas a sintaxe. Essencial para vagas Mid.
*   🇺🇸 *Spring in Action* (Craig Walls) - A bíblia prática do Spring.
*   🇧🇷 Algaworks (YouTube/Cursos) - Excelente material para Spring/Java focado no mercado de trabalho no Brasil.
*   🇺🇸 [Baeldung.com](https://www.baeldung.com/) - O maior e melhor portal prático de Java/Spring na internet.

### Android e Kotlin 📱
*   🇺🇸/🇧🇷 [Documentação Oficial Android](https://developer.android.com/courses) - Faça os *Codelabs de Kotlin e Jetpack Compose*.
*   🇺🇸 *Kotlin in Action* (Dmitry Jemerov / Svetlana Isakova) - Criadores da linguagem ensinando as nuances.
*   🇺🇸 Philipp Lackner (YouTube) - Conteúdo avançado de Arquitetura Android (Clean Architecture em Kotlin).

### Angular e Frontend 🅰️
*   🇺🇸 [Angular.dev](https://angular.dev/) (Antigo angular.io) - O tutorial "Tour of Heroes" (Essencial).
*   🇺🇸 *Pro Angular* (Adam Freeman).
*   🇺🇸 Loiane Groner (YouTube/Cursos 🇧🇷): Autora e desenvolvedora fenomenal, super didática em Angular e Java.

### Fundamentos Acadêmicos (Computer Science) 🧬
*   🇧🇷 *Entendendo Algoritmos* / *Grokking Algorithms* (Aditya Bhargava) - Visão ilustrada de algoritmos. Excelente ponte inicial.
*   🇺🇸 *Cracking the Coding Interview* (Gayle Laakmann) - A bíblia da prática de algoritmos em Java. Indispensável antes de entrevistas técnicas.

---

## ⚙️ 4. Como praticar "Spec-Driven Development" no Dia a Dia

Para alinhar com empresas maduras que utilizam Especificação Técnica:

1. **Escreva o Design Doc (ADR) no Obsidian primeiro:**
   *Antes* de criar o `ChatActivity` real interligado com a IA, abra uma nota e documente o desafio, a API que será chamada, e quais exceções o sistema deve lidar (Timeout do OpenAI, Falta de internet do usuário).
2. **Defina Contratos (API-First):**
   Utilize o `Swagger Editor` para criar o `/chat` com Request/Response rigorosos. Essa é a "Spec".
3. **Mocking Avançado:**
   Desenvolva o Angular e o Android lendo desse Mock. Se o Mock cumprir a Spec, a UI está pronta. O backend será feito em seguida, com a garantia de que o Front já o entende.
