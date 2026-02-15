# Metodologia VIBE - Validate, Investigate, Blueprint, Execute


## Minha Perspectiva

Até recentemente, Vibe Coding me dava mais dor de cabeça do que resultado. Eu sentava, descrevia o que queria, deixava o Claude trabalhar 15, 20 minutos — e no final, o que eu tinha era uma bagunça sofisticada.

O padrão se repetia: ele gerava código pra caramba, refatorava, melhorava, criava abstrações bonitas... mas não entregava o que eu pedi. Muito movimento, pouca direção.

E os problemas eram sempre os mesmos:

Estrutura inconsistente — cada arquivo parecia ter sido escrito por um dev diferente. Naming, organização de pastas, padrões de código mudavam de um componente pro outro.

Arquiteturas desnecessariamente complexas — pra resolver um CRUD ele criava três camadas de abstração, dois design patterns e um event bus. Overengineering como estilo de vida.

Fragilidade em cascata — funcionava bonito no cenário feliz, mas bastava a complexidade aumentar um pouco e tudo desmoronava. Mexia num módulo, quebrava outros dois.

Alucinação silenciosa — inventava APIs que não existiam, importava libs com métodos errados, criava integrações com serviços que funcionavam diferente do que ele assumia. E fazia tudo isso com uma confiança inabalável.

Loop infinito de correção — corrigia o erro A, introduzia o erro B. Corrigia o B, o A voltava. Depois de três ciclos você já tinha perdido mais tempo do que se tivesse escrito na mão.

Perda de contexto — no começo da conversa ele entendia tudo. Quarenta mensagens depois, esquecia decisões que ele mesmo tinha tomado e começava a contradizer o próprio código.

Escopo descontrolado — você pedia um botão e ele entregava um design system. Adicionava features que ninguém pediu, tratava edge cases imaginários e ignorava o requisito principal.

Não existia processo. E sem processo, eu passava mais tempo gerenciando o trabalho dele do que seria necessário pra fazer eu mesmo.

Mas algo me incomodava, porque...

## Os Pioneiros

https://www.wired.com/story/why-did-a-10-billion-dollar-startup-let-me-vibe-code-for-them-and-why-did-i-love-it
WIRED reports that **Notion**’s engineering team has “fully embraced vibe coding,” using tools like Cursor and Claude Code to build and ship product features, with estimates that 30–40% of their code is now AI-generated and then reviewed and tested by engineers before going to production.

https://vestbee.com/insights/articles/who-and-how-is-driving-the-vibe-coding-revolution
An analysis of the “vibe coding revolution” describes **Replit**’s evolution from an in-browser IDE into a platform where developers can write, debug, provision databases, and deploy apps from natural‑language prompts, positioning it as one of the leading environments for vibe-coded applications.

https://indianexpress.com/article/technology/tech-news-technology/sporify-ai-vibe-coding-developers-review-10530446
This article explains how **Spotify**’s internal AI system, called **Honk**, writes, fixes and deploys code with minimal human input. Engineers mostly interact by giving instructions (often via Slack “ChatOps”) and then reviewing and approving changes, which matches the vibe‑coding model where humans guide and curate rather than hand‑write most of the code. It also notes that Honk is built on top of Claude Code and is integrated into Spotify’s existing tooling.

https://www.theverge.com/entertainment/879492/spotify-ceo-vibe-coding-developers-ai
This piece reports comments from **Spotify**’s CEO on a Q4 earnings call, saying the company has “fully embraced vibe coding” and that its best engineers hadn’t written a line of code in 2026 because AI now generates the code they supervise. The article frames this as an example of how AI is changing software developer roles, shifting them from typing code to directing and validating AI‑generated implementations.


## A Dura Realidade

Obviamente o problema **não é a tecnologia**, os novos modelos (Opus 4.6, Codex 5.3 e Minimax 2.5) deram um salto incrível em termos de qualidade e capacidade e com certeza são melhores em planejar e escrever código que a grande maioria dos programadores hoje.

**Escrever código virou commodity, mas programar não se resume a escrever código.** 

Existe uma camada acima — mais estratégica, mais ambígua, mais humana — que os modelos ainda não dominam (e talvez demorem para dominar).

**Definir o problema certo** — antes de qualquer linha de código, alguém precisa olhar para o caos do mundo real e decidir o que vale ser resolvido, o que é sintoma vs. causa, o que é viável vs. desejável. IA resolve problemas bem definidos; humanos definem quais problemas resolver.

**Navegar trade-offs sem resposta certa** — arquitetura de software é feita de decisões onde não existe "correto", só consequências diferentes. Monolito ou microserviços? Consistência ou disponibilidade? Velocidade de entrega ou robustez? Essas decisões dependem de contexto organizacional, político, financeiro — coisas que a IA não vive.

**Traduzir entre mundos** — o programador mais valioso não é o que escreve o melhor código, é o que consegue sentar com outro humano e entender que quando ele diz "preciso de um sistema" na verdade ele precisa de um processo. Essa tradução entre linguagem de negócio e linguagem técnica exige empatia e julgamento ainda reservados à um humano.

> Escrever código é um problema resolvido. O problema que nunca foi — e continua não sendo — é decidir qual código vale a pena escrever, para quem, por quê, e quais consequências aceitar. Isso é programação. E isso ainda é humano.


## O futuro

O futuro já está se desenhando e a divisão de trabalho é clara: a IA planeja e escreve código. Nós decidimos o que vale a pena construir.

Nosso papel muda. Subimos uma camada. Definimos problemas, tomamos decisões de arquitetura, navegamos trade-offs, traduzimos necessidade de negócio em direção técnica. O trabalho pesado de implementação? Delegado.

E isso não é opcional — é inevitável. Humanos não podem mais competir escrevendo código na mão. Não é mais viável economicamente, não faz mais sentido estrategicamente. Um modelo gera em minutos o que levava dias. Insistir em competir nesse nível é como insistir em fazer conta de cabeça depois que a calculadora existe.

Mas aqui está o ponto que pouca gente está enxergando: isso não elimina o programador. Isso muda o que significa ser programador.

Precisamos mudar a forma como organizamos nosso trabalho. Mudar nossos rituais, nossos processos, a maneira como pensamos sobre desenvolvimento. Quem continuar operando do jeito antigo — abrindo o editor, digitando linha por linha, medindo produtividade por commits — vai se tornar irrelevante. Não por falta de talento, mas por falta de adaptação.

Os programadores que vão se destacar — e se manter na profissão — são os que entenderem rápido que o jogo mudou. Que as habilidades que importam agora são outras: pensamento sistêmico, definição de requisitos, gestão de contexto, tomada de decisão sob ambiguidade.

E essa transição é urgente.

## Uma Nova Metodologia

Se o problema do Vibe Coding é falta de processo, a solução é dar processo pra ele.

Foi por isso que eu criei o **VIBE** — um framework que define como agentes de IA devem trabalhar para produzir código de qualidade. Não é sobre escrever código melhor. É sobre organizar o trabalho antes de escrever qualquer coisa.

A ideia é simples: antes de deixar a IA sair codando, ela precisa passar por quatro fases. Cada fase resolve um dos problemas que a gente viu antes. E nenhuma fase pode ser pulada.

**V — Validate.** A fase de entrevista. Antes de qualquer coisa, o agente precisa entender o que precisa ser construído. Isso significa fazer perguntas, clarificar o problema, definir escopo, separar o que é requisito real do que é suposição. A maioria dos desastres de Vibe Coding começa aqui — o agente assume que entendeu e sai implementando. Validate força ele a parar e confirmar.

**I — Investigate.** A fase de pesquisa no código. O agente mergulha na codebase que já existe. Entende padrões, convenções, dependências, o que já foi decidido antes. O resultado é um `research.md` — um documento que prova que ele sabe onde está pisando. Sem isso, ele vai criar código que parece bonito isolado mas não conversa com nada do que já existe.

**B — Blueprint.** A fase de planejamento. Aqui o agente projeta a solução, mas não para no primeiro rascunho. Ele entra em ciclos de plano, crítica e anotação junto com um humano — ambos desenhando, questionando, refinando, até o plano estar blindado. É aqui que decisões de arquitetura são tomadas, trade-offs são explicitados e edge cases são antecipados. Antes de escrever uma linha de código, o plano precisa sobreviver ao escrutínio.

**E — Execute.** A fase de implementação. Só agora o agente escreve código — e faz isso de forma mecânica. O plano é quebrado em tarefas atômicas, cada tarefa tem seus testes definidos antes da implementação, e o agente segue o blueprint sem improvisar. Property-based testing, unit tests, tudo já especificado. Sem surpresas, sem escopo inflado, sem criatividade onde precisa ter disciplina. Sem tocar em nada fora do necessário.

Quatro letras. Quatro fases. Um processo que transforma Vibe Coding de aposta em método.

## Claude Commands

Para que o VIBE não fique só na teoria, eu criei um conjunto de comandos que o Claude executa em cada fase. São skills customizadas que guiam o agente pelo processo inteiro — da descoberta até a implementação.

A regra é simples: qualquer feature, bug fix ou refatoração que vá além de uma mudança trivial em uma função ou componente passa por essa sequência.

`/interview` — Entrevista de descoberta. O agente me faz perguntas para entender o que eu realmente quero construir. Clarifica requisitos, elimina ambiguidades, documenta tudo em `interview.md`. Opcional, mas vale ouro quando o escopo não está claro na minha cabeça.

`/research` — Mergulho na codebase. O agente investiga tudo que é relevante para a feature: arquivos, padrões, dependências, decisões anteriores. Produz um `research.md` que serve como mapa do território.

`/plan` — Planejamento da solução. Recebe o `research.md` e o `interview.md` como insumo e projeta a implementação completa. Requisitos, arquitetura, decisões de design — tudo documentado em `plan.md`.

`/critique` — Stress test do plano. O agente vira o próprio revisor: procura falhas, inconsistências, edge cases ignorados, decisões frágeis. Documenta tudo em `critique.md`. Se o plano não sobrevive à crítica, não merece virar código.

`/update` — Refinamento. Cruza o `plan.md` com o `critique.md` e atualiza o plano incorporando as melhorias. O ciclo `/critique` → `/update` pode rodar quantas vezes for necessário até o plano estar sólido.

`/tasks` — Decomposição. Quebra o plano em tarefas atômicas, sequenciais, com dependências explícitas. Cada tarefa é pequena o suficiente para ser executada sem ambiguidade.

`/tests` — Definição de testes. Antes de implementar qualquer coisa, define os testes para cada tarefa. Property-based testing, unit tests — o que a tarefa exigir. O código nasce já sabendo como vai ser validado.

`/work` — Execução. O agente pega uma tarefa, implementa seguindo o plano, roda os testes e marca como concluída. Sem improvisação, sem desvios, sem features surpresa.

Cada comando alimenta o próximo. A saída de um é a entrada do outro. O agente nunca trabalha no vazio — sempre tem contexto, sempre tem direção, sempre tem critério de pronto.

## Estrutura de Pastas

Todo o conteúdo produzido é armazenado em uma pasta chamada `.docs` e cada feature, bug-fix ou melhorias tem sua subpasta com a documentação.

Conforme vou trabalhando nas funcionalidades solicito ao agente para atualizar o `prd.md`, a fonte de verdade sobre tudo do projeto.

![[Pasted image 20260215115332.png]]

Dentro de uma pasta eu encontro os principais arquivos que foram gerados pela metodologia: `research.md`, `critique.md`, `plan.md` e a lista de `tasks/*.md` a serem executadas.

As tarefas finalizadas são marcadas com o prefixo `_DONE_` (o Claude faz isso quando chamado o método `/work`) para rastrear o trabalho que já foi feito.

### Por Que Isso Funciona Tão Bem

Os arquivos markdown funcionam como **estado mutável compartilhado** entre mim e o Claude. É isso que faz o processo funcionar de verdade.

Eu posso pensar no meu próprio ritmo. Abrir o `plan.md`, ler com calma, identificar exatamente onde algo está errado — e anotar a correção ali mesmo, no ponto exato do documento. Não preciso tentar explicar tudo numa mensagem de chat, torcendo pra ele entender o que eu quis dizer. Eu aponto pro problema e escrevo a solução do lado.

E quando eu volto, o contexto está lá. Intacto. Não importa se parei pra almoçar, se dormi, se mudei de ideia três vezes. O documento é a fonte de verdade — não uma thread de chat que eu precisaria rolar por vinte minutos pra reconstruir o que foi decidido.

Isso é fundamentalmente diferente de guiar implementação por conversa. Um plano é uma especificação estruturada que eu consigo revisar de forma holística — ver o todo, identificar inconsistências, avaliar se as peças encaixam. Uma conversa de chat é uma sequência linear que se degrada com o tempo. O plano ganha sempre.

E o ciclo de refinamento é onde a mágica acontece. Três rodadas de "adicionei notas, atualize o plano" são suficientes pra transformar uma proposta genérica numa especificação que se encaixa perfeitamente no sistema existente. Porque o Claude é excelente em entender código, propor soluções e escrever implementações. Mas ele não sabe minhas prioridades de produto. Não conhece os pontos de dor dos meus usuários. Não tem como adivinhar quais trade-offs de engenharia eu estou disposto a aceitar.

O ciclo de anotação é como eu injeto esse julgamento no processo. É onde o humano entra — não escrevendo código, mas dirigindo as decisões que o código precisa refletir.

## Ficando no Comando

Mesmo delegando execução para Claude, **nunca dou autonomia total sobre o que será construído**. Faço a vasta maioria da direção ativa nos documentos `plan.md`.

Isso importa porque Claude às vezes vai propor soluções que são tecnicamente corretas mas erradas para o projeto. Talvez a abordagem seja sobre-engenheirada, ou muda uma assinatura de API pública que outras partes do sistema dependem, ou escolhe uma opção mais complexa quando uma mais simples funcionaria. Tenho contexto sobre o sistema mais amplo, a direção do produto, e a cultura de engenharia que Claude não tem.

**Selecionando de propostas:** Quando Claude identifica múltiplos problemas, percorro um por um: _"para o primeiro, apenas use Promise.all, não complique demais; para o terceiro, extraia numa função separada para legibilidade; ignore o quarto e quinto, não valem a complexidade."_ Estou fazendo decisões item-a-item baseado no meu conhecimento do que importa agora.

**Cortando escopo:** Quando o plano inclui coisas boas-de-ter, corto ativamente. _"remova a feature de download do plano, não quero implementar isso agora."_ Isso previne scope creep.

**Protegendo interfaces existentes:** Defino restrições firmes quando sei que algo não deve mudar: _"as assinaturas dessas três funções não devem mudar, o caller deve se adaptar, não a biblioteca."_

**Sobrescrevendo escolhas técnicas:** Às vezes tenho uma preferência específica que Claude não saberia: _"use este model ao invés daquele"_ ou _"use o método built-in desta biblioteca ao invés de escrever um customizado."_ Sobrescritas rápidas e diretas.

Claude lida com a execução mecânica, enquanto faço as decisões de julgamento. O plano captura as grandes decisões na frente, e direcionamento seletivo lida com as menores que emergem durante implementação.

Logo, uma vez que a lista de tarefas foi gerada, a implementação é segura e com qualidade muito superior.

# Install Commands

Run this command to install the commands:

```bash
curl -fsSL https://raw.githubusercontent.com/berryconsult/berryvibe/main/install-commands.sh | bash -s -- berryconsult/berryvibe
```