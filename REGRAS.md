# REGRAS DO LOOP DE CRIAÇÃO

Regras que conduzem a criação da história do jogo.
Claude (editor) aplica estas regras em toda volta e lembra as outras IAs delas em toda mensagem.

---

## 1. Canon — o que NÃO pode mudar

Definido pelo autor (Lucas). As IAs podem acrescentar detalhes, nunca contradizer:

- **Gênero:** jogo 3D de **romance e mistério**, com sobrevivência.
- **Início:** o jogador acorda depois de **cair do céu numa selva**, sem memória, sem nada — só a roupa do corpo.
- **Sobreviventes:** encontra **12 pessoas (6 homens e 6 mulheres)** que caíram ao mesmo tempo e também não sabem de nada.
- **Lugar:** **não é a Terra** — é outro planeta. Descobrir onde estão é o grande mistério.
- **Planeta:** **sem habitantes nativos inteligentes** — só animais/criaturas.
- **Protagonista:** **criado pelo jogador** (não tem nome nem história fixa).
- **Romance:** o jogador escolhe com quem se relacionar e **pode casar**.
- **Finais:** **vários**, dependendo das escolhas do jogador.
- **Modo:** **solo e multiplayer**.
- **Jogabilidade:** sobrevivência com **construção, combate e plantação** (estilo Stardew Valley), em 3D.
- **Personagens:** modelos **VRM** (visual anime).

Só o autor pode mudar o canon.

### Consequências do canon que as IAs devem respeitar
- Protagonista criado pelo jogador → ele não pode ter falas longas nem passado definido; a história dele é o que o jogador vive. O passado e a perda de memória precisam funcionar para qualquer protagonista.
- Multiplayer → a história precisa funcionar com 1 jogador ou com vários (vários "caídos" jogáveis além dos 12).
- Sem nativos → o mistério é contado pelo planeta, pelas ruínas, pelos objetos e pelos próprios sobreviventes.

---

## 2. Como o loop funciona

Toda IA **cria e critica**. Ninguém só concorda ou discorda.

| Ordem | Quem | Ponto de vista |
|---|---|---|
| 1 | ChatGPT | **Roteirista** — escreve/reescreve a versão atual e propõe ideias |
| 2 | Grok | **Crítico chato** — caça furo, clichê, contradição, personagem raso; e propõe a sua visão |
| 3 | Gemini | **Jogador fã de anime e de Stardew** — onde ficou chato, confuso, previsível ou sem graça de jogar; e propõe a sua visão |
| 4 | Claude | **Editor** — junta tudo, aplica as 6 perguntas, decide o que entra, salva no GitHub e monta a próxima volta |

Em cada volta, cada IA entrega:
- **A sua visão:** ideias próprias (cenas, reviravoltas, detalhes de personagem e de mundo).
- **A crítica:** avaliação do que as outras escreveram.

Toda mensagem às IAs pede que sejam **criteriosas e rigorosas**.

---

## 3. As 6 perguntas obrigatórias

Valem para TODA ideia, cena, fala e detalhe. Repetidas em toda mensagem:

1. **Por que isso?** Qual é o motivo de existir?
2. **Encaixa no resto?** Bate com o que já foi aprovado (BIBLIA.md)?
3. **Por que está aqui?** Por que neste ponto da história, e não em outro?
4. **Está aprovado — mas o que dá pra melhorar?**
5. **Na vida real seria assim?** Uma pessoa de verdade, nessa situação, faria isso?
6. **É humano ou é IA?** O jeito de falar, agir e pensar parece gente ou parece robô?

---

## 4. Critérios de "completo"

Cada IA dá nota de 0 a 10 para cada item:

1. **Mundo e regras** — o planeta, a natureza, os animais, as ruínas, a física e as regras do lugar, sem contradição.
2. **O grande mistério** — onde estão, por que caíram, quem/o que está por trás, com resposta fechada e coerente.
3. **Os 12 personagens** — cada um com passado, motivação, segredo, defeitos, jeito de falar e como muda.
4. **Rotas de romance** — para cada um dos 12: como a relação evolui (eventos de coração), conflito da rota, pedido e casamento.
5. **Estrutura do jogo** — capítulos/estações, eventos principais, gatilhos (o que destrava o quê), sem buracos.
6. **Pistas e revelações** — o que fica escondido, onde aparecem as pistas, quando cada coisa é revelada.
7. **Finais** — cada final com condições claras, consequência e sentido; nenhum final "jogado".
8. **História + jogabilidade** — construção, combate e plantação têm motivo dentro da história (e no multiplayer também).
9. **Tom e diálogos** — falas que soam como gente de verdade; equilíbrio entre leveza, romance e tensão.

**O loop para quando:** todos os itens têm nota **≥ 9 nas três IAs** e nenhum furo grave foi apontado.

**Trava de segurança:** se chegar a **6 voltas** sem bater isso, Claude para, mostra ao autor onde está travando e o autor decide.

---

## 5. Contra o tom robótico

**Proibido:**
- Diálogo explicativo ("como você sabe...").
- Personagem falando bonito/formal demais.
- Frase de efeito em toda cena.
- Resumo no lugar de cena ("eles ficam com medo e fogem").
- Clichês prontos: o escolhido, a coincidência salvadora, o vilão sem motivo.
- Todo mundo falando do mesmo jeito.
- Personagem de romance que existe só para gostar do jogador.

**Obrigatório:**
- Português brasileiro natural, com gíria e frase cortada quando fizer sentido.
- Cada personagem com seu jeito próprio de falar.
- Momentos pequenos e humanos no meio do caos (piada, silêncio, coisa boba).
- Mostrar em vez de explicar.
- Consequências reais: escolhas custam caro.
- Cada um dos 12 tem vida própria: opinião, rotina, conflitos entre eles, mesmo sem o jogador por perto.

---

## 6. Formato das respostas

- **Roteirista:** versão completa organizada pelos 9 critérios + ideias novas.
- **Crítico e jogador:** sua visão (ideias próprias) + nota 0–10 por item + os 3 maiores problemas com sugestão de correção + o que **não** deve ser mexido porque já está bom.

---

## 7. Como os arquivos são usados

- `BIBLIA.md` — só o que foi **aprovado**. É o que as IAs recebem em toda volta.
- `mundo/` — planeta, biomas, animais, ruínas, linha do tempo.
- `personagens/` — um arquivo por personagem (os 12).
- `romances/` — rota de romance de cada personagem.
- `capitulos/` — estrutura do jogo, eventos e gatilhos.
- `finais/` — cada final, com condições.
- `misterios-pistas.md` — o que é escondido, onde aparece a pista, quando revela.
- `voltas/` — registro de cada volta: o que cada IA disse e o que o editor decidiu e por quê.
