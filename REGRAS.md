# REGRAS DO LOOP DE CRIAÇÃO

Regras que conduzem a criação da história da série de apocalipse zumbi.
Claude (editor) aplica estas regras em toda volta e lembra as outras IAs delas em toda mensagem.

---

## 1. Canon — o que NÃO pode mudar

Vem do roteiro base do autor (Lucas). As IAs podem acrescentar detalhes, nunca contradizer:

- Lucas é contador num escritório minúsculo; no escritório estão o patrão e o amigo João.
- Sexta-feira → viagem de férias → o avião cai numa ilha.
- A única outra sobrevivente é uma aeromoça, ferida e com febre. Ela **NÃO** foi mordida por zumbi.
- Lucas fica uns 3 meses preso na ilha; nesse tempo, o mundo acaba.
- Narrada pelo próprio Lucas, falando com quem assiste, com momentos dele conversando com outras pessoas.
- Tom: começa engraçado e vai ficando tenso.
- Pistas do apocalipse discretas, nunca escancaradas.
- Formato: 3D com visual de anime; episódios de 20–30 min no YouTube + shorts (TikTok/Instagram).

Só o autor pode mudar o canon.

---

## 2. Como o loop funciona

Toda IA **cria e critica**. Ninguém só concorda ou discorda.

| Ordem | Quem | Ponto de vista |
|---|---|---|
| 1 | ChatGPT | **Roteirista** — escreve/reescreve a versão atual e propõe ideias |
| 2 | Grok | **Crítico chato** — caça furo, clichê, contradição, personagem raso; e propõe a sua visão |
| 3 | Gemini | **Espectador fã de anime** — onde ficou chato, confuso ou previsível; e propõe a sua visão |
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

1. **Mundo e regras** — origem do vírus, como se espalha, o que os zumbis fazem, sem contradição.
2. **Personagens** — passado, motivação, defeitos, como cada um muda.
3. **Arco geral** — começo, meio, clímax e final fechados.
4. **Episódios** — o que acontece em cada um, com gancho no final.
5. **Acontecimentos** — cenas principais em ordem, sem buracos.
6. **Mistérios e pistas** — o que fica escondido, quando é revelado, pistas discretas antes.
7. **Tom e temas** — a passagem do engraçado para o tenso funciona.
8. **Diálogos** — soam como gente de verdade.

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

**Obrigatório:**
- Português brasileiro natural, com gíria e frase cortada quando fizer sentido.
- Cada personagem com seu jeito próprio de falar.
- Momentos pequenos e humanos no meio do caos (piada, silêncio, coisa boba).
- Mostrar em vez de explicar.
- Consequências reais: escolhas custam caro.

---

## 6. Formato das respostas

- **Roteirista:** versão completa organizada pelos 8 critérios + ideias novas.
- **Crítico e espectador:** sua visão (ideias próprias) + nota 0–10 por item + os 3 maiores problemas com sugestão de correção + o que **não** deve ser mexido porque já está bom.

---

## 7. Como os arquivos são usados

- `BIBLIA.md` — só o que foi **aprovado**. É o que as IAs recebem em toda volta.
- `mundo/`, `personagens/`, `episodios/`, `misterios-pistas.md` — o detalhe completo (pode virar livro).
- `voltas/` — registro de cada volta: o que cada IA disse e o que o editor decidiu e por quê.
