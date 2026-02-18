**Slide 1 - Cover**
- Nova Metodologia
- VIBE
- Validate · Investigate · Blueprint · Execute
- Um framework para transformar Vibe Coding de aposta em método.
- Rod Amora · CTO Berry

**Slide 2 - Problem**
- O Problema
- Vibe Coding sem processo é uma aposta.
- Muito movimento, pouca direção. Os mesmos padrões se repetem:
- Estrutura inconsistente — cada arquivo parece escrito por um dev diferente
- Arquiteturas desnecessariamente complexas — overengineering como estilo de vida
- Fragilidade em cascata — mexe num módulo, quebra outros dois
- Alucinação silenciosa — inventa APIs e libs com confiança inabalável
- Loop infinito de correção — corrige A, aparece B, corrige B, volta A
- Perda de contexto — esquece decisões que ele mesmo tomou
- Escopo descontrolado — você pede um botão, ele entrega um design system

**Slide 3 - Shift**
- A Mudança
- Escrever código virou commodity. Programar não se resume a escrever código.
- IA FAZ: Planeja e escreve código
- HUMANO FAZ: Conversa com usuários, entende o negócio e suas necessidades, decide o que vale construir
- "O problema que nunca foi — e continua não sendo — é decidir qual código vale a pena escrever, para quem, por quê, e quais consequências aceitar."

**Slide 4 - Method**
- O Framework
- Quatro fases. Nenhuma pode ser pulada.
- V - Validate
- I - Investigate
- B - Blueprint
-- Cada fase resolve E - Execute
 um problema específico. A saída de uma é a entrada da próxima.

**Slide 5 - Validate**
- Validate
- FASE DE ENTREVISTA
- O agente faz perguntas antes de qualquer implementação
- Clarifica o problema real vs. o problema percebido
- Define escopo — separa requisito de suposição
- Documenta tudo em interview.md
- Impede o agente de assumir que entendeu e sair codando

**Slide 6 - Investigate**
- Investigate
- FASE DE PESQUISA
- Mergulho profundo na codebase existente
- Mapeia padrões, convenções e dependências
- Entende decisões arquiteturais anteriores
- Produz research.md — prova que sabe onde pisa
- Garante que o novo código conversa com o existente

**Slide 7 - Blueprint**
- Blueprint
- FASE DE PLANEJAMENTO
- Projeta a solução completa antes de escrever código
- Ciclos de plano → crítica → refinamento com humano
- Trade-offs explicitados, edge cases antecipados
- Decisões de arquitetura documentadas em plan.md
- O plano precisa sobreviver ao escrutínio antes de virar código

**Slide 8 - Execute**
- Execute
- FASE DE IMPLEMENTAÇÃO
- Tarefas atômicas — pequenas, claras, sequenciais
- Testes definidos antes da implementação
- O agente segue o blueprint sem improvisar
- Sem escopo inflado, sem features surpresa
- Cada tarefa marcada como concluída ao passar nos testes

**Slide 9 - Flow**
- Workflow
- Comandos do agente
- /interview — Entrevista de descoberta → interview.md
- /research — Mergulho na codebase → research.md
- /plan — Planejamento da solução → plan.md
- /critique — Stress test do plano → critique.md
- /update — Refinamento do plano (ciclo com /critique)
- /tasks — Decomposição em tarefas atômicas
- /tests — Definição de testes por tarefa
- /work — Execução + validação → _DONE_

**Slide 10 - Why**
- Por Que Funciona
- Markdown como estado compartilhado entre humano e IA.
- Contexto persistente — Documentos são a fonte de verdade, não threads de chat
- Revisão holística — Veja o todo, identifique inconsistências, refine com calma
- Julgamento humano — Anotações injetam prioridades que a IA não tem como adivinhar

**Slide 11 - Close**
- VIBE
- Se o problema é falta de processo, a solução é dar processo pra IA.
- github.com/berryconsult/berryvibe
