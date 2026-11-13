# O QUE FALTA PARA O JOGO — lista consolidada (loop de produção, volta 1)

Data: 13/11/2026. Jogo: **Sob o Céu de Néria**, da Formiguinha Açucarada.
**Como foi feita:** o ChatGPT escreveu a lista de 10 tópicos (texto bruto em `lista-v1-chatgpt.md`), o Grok fez a crítica de produtor e o Gemini a crítica de jogador de Stardew. Depois, o Claude, como editor, consolidou.
**Máquina de referência:** notebook Acer Aspire 3, Ryzen 5 3500U, 8 GB de RAM, vídeo integrado.

## Notas da lista do ChatGPT
| Tópico | Grok | Gemini |
|---|---|---|
| Engine e desempenho | 8,5 | 8,5 |
| Game design | 8,0 | 7,5 |
| Economia | 7,5 | 7,0 |
| Mundo e mapas | 7,0 | 7,5 |
| VRM e NPCs | 7,5 | 7,0 |
| UI/UX | 7,0 | 7,5 |
| Multiplayer e saves | 8,0 | 8,0 |
| Áudio | 7,5 | 8,0 |
| Produção | **6,5** | **6,0** |
| Lançamento | 7,0 | 7,5 |

**Veredito unânime:** a lista é boa como inventário de riscos, mas é fraca como plano. O cronograma de 24–42 meses é irreal para uma equipe pequena. **O escopo foi cortado.**

---

## ⚠️ DECISÃO DE ESCOPO (Grok + Gemini; o editor concorda)
- **1º ano: 1 bioma e 3 NPCs.** No começo, solo e 2 jogadores locais. Só depois de provar que o jogo é divertido entram os outros biomas e personagens.
- **Os 3 NPCs:**
  - **Marina:** pilar da fazenda e da sobrevivência.
  - **Augusto:** pilar da construção e das ferramentas, e faz o contraste de humor com a Marina.
  - **Elias:** pilar do mistério e da exploração; quebrar a hostilidade dele é o objetivo do 1º ano.
- **Os outros 9** aparecem como "desaparecidos em outras regiões" (em bilhetes, pelo rádio, em pistas). Isso já combina com a história, porque Lívia e Amara somem no prólogo. Cada atualização traz alguém de volta.

---

# OS 10 TÓPICOS, DO MAIS URGENTE AO MENOS URGENTE

## 1. ENGINE, ARQUITETURA E DESEMPENHO — 🔴 CRÍTICO (semanas 1–2)
> ✅ **DECIDIDO PELO AUTOR (13/11/2026): GODOT 4.** O benchmark agora serve para medir os limites do Godot 4 no notebook, não para escolher a engine.
**Por que falta:** sem saber se o notebook roda 3D com VRM, todo o resto é chute. Ignorar isso significa descobrir no mês 8 que o jogo roda a 12 FPS.
- [ ] **Benchmark Godot 4 × Unity LTS** com a mesma cena: terreno, 1 VRM jogável, **6 NPCs VRM andando** e 50–100 árvores. Medir FPS (média e 1% low), RAM e tempo de carregamento.
- [ ] **Metas que não se negociam:** **30 FPS em 720p** no qualidade baixa. Se cair abaixo de 24 FPS com 6 VRMs, o orçamento de polígonos e materiais cai na hora.
- [ ] **Orçamento por cena:** draw calls (alvo inicial abaixo de 300), polígonos por VRM (abaixo de 15–20 mil), materiais por VRM (de 1 a 3, usando atlas).
- [ ] **Vegetação, que é o que mais pesa numa GPU integrada:** LOD agressivo a partir de 25 m, culling, grama com instancing, nada de sombra dinâmica na folhagem.
- [ ] **Iluminação:** baked (pré-calculada), ou só uma luz direcional simples; sombras curtas.
- [ ] **Arquitetura de dados preparada para rede desde o dia 1:** todo objeto do mundo tem ID único persistente e um "dono" (owner).
- [ ] **Dados separados do código:** itens, culturas e NPCs em arquivos (JSON ou recursos), com hot-reload, para mudar uma receita sem recompilar.
- [ ] **Script de benchmark** que roda a mesma cena a cada build e registra o FPS.
- [ ] **Git com LFS** para arte, uma política para arquivos grandes e **backup offline obrigatório.**
- [ ] **Licenças:** VRoid, VRM, UniVRM ou o plugin VRM do Godot, e shaders (MToon). Confirmar o uso comercial de cada um.
- **Corte de escopo:** se nenhuma engine chegar a 30 FPS, simplificar os personagens (um shader toon próprio, cabelo sem física) antes de mudar o estilo.

## 2. PRODUÇÃO, ESCOPO E MVP — 🔴 CRÍTICO (semana 2 em diante)
**Por que falta:** projeto sem escopo congelado morre no mês 8 (Gemini).
- [ ] **Cronograma reescrito:** vertical slice em **4–6 meses**. Tudo depois disso só acontece se o slice provar que vale.
- [ ] **Quem desenvolve, quantas horas por semana e qual o teto de gastos.** Isso precisa ser escrito.
- [ ] **Contrato simples entre os sócios ou amigos:** quem é dono do quê (propriedade intelectual) e o que acontece se alguém sair (Gemini).
- [ ] **Quem pode dizer "não"** a uma feature nova depois do MVP (Grok).
- [ ] **Critério objetivo de "pronto":** zero bugs bloqueadores, 25 minutos seguidos sendo divertido, 30 FPS.
- [ ] **Build semanal automática** e um changelog.
- [ ] **Limite de horas e prevenção de burnout:** o notebook fraco frustra todo dia (Gemini).
- [ ] **Go/no-go no fim do mês 3:** se não for divertido, o jogo para e o escopo é reavaliado. Não se avança para o bioma 2.

### Plano de 12 semanas (Grok)
| Semana | Entrega |
|---|---|
| 1 | Teste Godot × Unity (terreno + 1 VRM + 50 árvores) |
| 2 | Decisão de engine, Git + LFS, estrutura de pastas |
| 3 | Movimento, câmera, colisão, interação |
| 4 | Inventário, coleta de 3 recursos, **save/load com ID único e 3 backups rotativos** |
| 5 | Solo (umidade e fertilidade) e plantio |
| 6 | Crescimento, colheita, sementes |
| 7 | Construção de canteiro, baú e abrigo (encaixe simples) |
| 8 | Dia e noite (27h12 comprimido), energia, descanso |
| 9 | Marina com rotina (dormir, trabalhar, comer, conversar) e falas |
| 10 | 1 pista ambiental (hortelã ou alicerce) encontrada ao plantar |
| 11 | Otimização (draw calls, LOD, desligar o que está longe) |
| 12 | Teste com 2 jogadores, checklist do MVP, **go/no-go** |

## 3. GAME DESIGN DO CICLO CENTRAL E "GAME FEEL" — 🔴 CRÍTICO
**Por que falta:** se cavar, plantar e colher não for gostoso, 6 biomas e 12 romances não salvam o jogo.
- [ ] **O ciclo principal:** coletar → produzir → melhorar a infraestrutura → explorar → descobrir → decidir.
- [ ] **"Juice" nas ferramentas (Gemini):** hitstop (uma pausa de 0,04 s no impacto), tremor leve de câmera, partículas de lasca e um som seco de madeira rachando.
- [ ] **Mira precisa em 3D:** uma grade invisível com **um quadrado translúcido no chão** mostrando qual célula a ferramenta vai acertar. Buffer de input e alvo automático.
- [ ] **Energia:** pelo menos **15–20 ações significativas por dia** no começo, e frutas silvestres para recuperar fôlego explorando.
- [ ] **Ritmo do relógio contra o tamanho do mapa:** em 3D se anda mais devagar. O dia de 27h12 não pode acabar antes de o jogador fazer o que queria.
- [ ] **Culturas do MVP:** raiz-de-mel (4 estágios visuais) e mais 1. Cada cultura tem exigência de água, nutriente e temperatura.
- [ ] **Construções do MVP:** abrigo, baú, canteiro e fogueira.
- [ ] **Culinária de sobrevivência:** juntar 2 ingredientes na fogueira dá um caldo (energia em dobro e o efeito "corpo quente" no Frio).
- [ ] **Pesca com tensão de linha** (funciona no teclado e no controle). É ali que aparecem os peixes marcados do Elias.
- [ ] **Combate defensivo** fica para depois do MVP.
- **Corte:** nada de chuva amarela, combate ou casamento no MVP.

## 4. MULTIPLAYER, REDE E SAVES — 🔴 CRÍTICO (na arquitetura); ALTO (jogável no mês 3)
**Por que falta:** fazer o jogo solo e depois tentar adicionar rede quebra os saves (Grok).
- [ ] **Host autoritativo:** um host valida o mundo; os clientes mandam ações e recebem estados confirmados.
- [ ] **Quem manda no quê:** solo, inventário, plantação, relacionamentos.
- [ ] **Anti-duplicação de itens,** mesmo no co-op local.
- [ ] **Saves:** JSON legível ou binário com **3 backups rotativos**. Escrita segura (arquivo temporário e depois troca).
- [ ] **Ferramenta de debug de save:** inspecionar, comparar versões, recuperar arquivo corrompido.
- [ ] **O que acontece se o save corromper no multiplayer.**
- [ ] **Final C:** dois arquivos de save com nome (o estado em Néria e o epílogo na Terra) e dois cards na tela.
- [ ] **Separar o mundo compartilhado do estado pessoal:** casamento e voltar à Terra exigem presença; votação com quórum (3 de 4 jogadores).
- [ ] **Teste com 2 jogadores** coletando, construindo, salvando e reconectando antes de aprovar a arquitetura.
- **Corte:** 2 jogadores locais no 1º ano; 4 online depois.

## 5. PERSONAGENS VRM, OTIMIZAÇÃO E ROTINA — 🟠 ALTO
**Por que falta:** VRM não é "só importar". Shader pesado e muitos ossos de cabelo derretem a GPU integrada (Grok e Gemini).
- [ ] **Pipeline de importação:** reduzir materiais (atlas), polígonos e ossos. **SpringBone (física de cabelo e roupa) atualizando a 30 Hz e com poucos ossos.**
- [ ] **LOD dos VRMs** e desligar a animação facial quando o personagem está longe.
- [ ] **Animações mínimas:** andar, correr, cavar, regar, cortar, pescar, sentar, comer, dormir, conversar e 4–6 expressões.
- [ ] **Rotina com prioridades:** emergência → comunidade → compromisso → trabalho → lazer. A Marina tem 4 estados no MVP.
- [ ] **Pelo menos 15 falas de contexto por NPC no MVP,** que mudam com o clima, a hora e o item que o jogador segura (Gemini).
- [ ] **Navmesh e pathfinding** dos NPCs, e uma ferramenta para posicionar objetos (Grok).
- [ ] **Ferramenta de autoria de diálogo e de estados de relação,** em vez de texto escrito direto no código (Grok).
- [ ] **Presentes orgânicos:** o jogador entrega uma fruta ou um chá na mão do NPC fora dos eventos, e ele responde de acordo com a personalidade (Gemini).
- **Corte:** 3 NPCs no 1º ano (Marina, Augusto, Elias).

## 6. ECONOMIA E MATEMÁTICA DE SOBREVIVÊNCIA — 🟠 ALTO
**Por que falta:** sem conta de consumo, os números (24 espaços, pilha de 99, primeira colheita em 30–60 min) são chute.
- [ ] **Planilha de consumo diário** (fome, sede, energia) contra o rendimento de 12 canteiros, primeiro para 1 jogador + 3 NPCs e depois para 13 pessoas.
- [ ] **Simulador de safra offline,** para balancear sem precisar jogar horas.
- [ ] **Sem moeda no começo:** progressão por conhecimento, ferramentas e construções.
- [ ] **Inventário inicial de 24 espaços,** com um baú para expandir.
- [ ] **Tempo de crescimento** de cada cultura, por estação.
- [ ] **Custo de cada construção e ferramenta** (madeira, pedra, fibra).
- [ ] **Curva dos primeiros 30 minutos:** o que o jogador deve ter conseguido ao fim do 1º dia, do 3º e da 1ª estação.
- [ ] **Nenhuma rota de romance trava por grind de item raro** (Gemini).

## 7. INTERFACE, CONTROLES E ACESSIBILIDADE — 🟡 MÉDIO-ALTO
- [ ] **HUD mínima:** energia, hora, item na mão. Sem barra de afeto.
- [ ] **Diário factual** com navegação rápida, sem cara de planilha (Gemini). Registra só desvios significativos.
- [ ] **Hierarquia de informação:** o que aparece sempre e o que só aparece sob demanda (Grok).
- [ ] **Teclado e mouse com remapeamento;** controle depois.
- [ ] **Acessibilidade:** modo para daltonismo, tamanho de fonte, legendas de som (Grok).
- [ ] **Silêncio de interface** nos momentos fortes: 3 s de tela preta depois do gravador, nenhum pop-up de conquista.
- [ ] **Conquistas silenciosas,** registradas no caderno do jogador (Gemini).
- [ ] **Decoração funcional da cabana:** pendurar o relógio parado às 05:17, pôr o gravador na mesa (Gemini).
- [ ] **"Museu" da vila:** uma estante comunitária para os objetos da colônia, que os NPCs olham e comentam (Gemini).
- [ ] **Chaves de localização desde o dia 1,** nunca texto direto no código (exemplo: `npc_clara_food_rejected_01` → "Não serve.").

## 8. ÁUDIO DO DIA A DIA E SISTEMA DE SILÊNCIO — 🟡 MÉDIO
- [ ] **Sons táteis primeiro:** passos na terra, enxada, machado, rega, chuva.
- [ ] **O "plop" da colheita e o som do item entrando na mochila.** O jogador ouve isso milhares de vezes, então não pode irritar (Gemini).
- [ ] **Ambiência de Néria:** insetos, vento, metal da colônia rangendo, os animais da noite clara.
- [ ] **O silêncio como sistema:** no túmulo da Lua e depois do Final C não há música.
- [ ] **Texto ou dublagem:** decidir cedo (a recomendação é texto com sons curtos de voz).
- [ ] **Trilha sonora** só depois do áudio do dia a dia estar pronto.
- [ ] **Licenças** de música e efeitos sonoros.

## 9. MUNDO, MAPAS E EXPANSÃO — 🟢 DEPOIS DO MVP
- [ ] **MVP:** uma clareira de **128 × 128 m** com casa, oficina, horta, rio, ponte e uma pequena mata.
- [ ] **Bioma do 1º ano:** a Mata das Raízes Altas e a entrada do Vale da Água Clara.
- [ ] **Os outros biomas** (Campos de Vidro, Brejo das Lanternas, Serra Partida, Costa das Torres) só entram depois de a clareira ser aprovada em teste.
- [ ] **Barreiras físicas** (rio cheio, ponte quebrada), nunca uma "chave nível 3".
- [ ] **Pipeline de assets 3D:** modelagem → LOD → atlas → importação → validação de draw calls (Grok).
- [ ] **Placement de objetos e validação de navmesh.**

## 10. LANÇAMENTO, STEAM E NEGÓCIO — 🟢 SÓ COM O VERTICAL SLICE
- [ ] **Posicionamento:** "Um RPG 3D de vida e sobrevivência num planeta desconhecido. Cultive, construa uma comunidade, conheça doze sobreviventes e descubra o que aconteceu com quem viveu ali antes de você. Jogue sozinho ou com até três amigos."
- [ ] **Preço (só uma hipótese):** R$ 39,90–69,90. Decidir depois do slice.
- [ ] **Steam Direct:** a taxa costuma ser de US$ 100 por app (confirmar a regra atual no Steamworks). Precisa de documentação fiscal e bancária.
- [ ] **Divulgação por fase:** protótipo → MVP (10–20 min de gameplay) → slice (trailer) → demo → lançamento. **Não prometer 6 regiões com uma só funcionando.**
- [ ] **Idiomas:** PT-BR nativo primeiro, inglês depois.
- [ ] **Classificação indicativa** (ClassInd) e checklist de conteúdo (Grok).
- [ ] **Jurídico e impostos:** marca, contratos, recebimento do exterior, orientação contábil.
- [ ] **Telemetria mínima:** crashes, FPS 1% low, tempo até a primeira colheita (Grok).
- [ ] **Política para conteúdo do jogador** (nomes, mensagens) no multiplayer (Grok).
- [ ] **Suporte:** canal para reportar bugs e recuperação de saves.

---

## MVP "NÉRIA 0.1" (20–30 min)
- [ ] Clareira de 128 × 128 m (rio, mata, área de plantio)
- [ ] 1 personagem VRM com movimento, câmera e animações básicas
- [ ] Coleta de madeira, pedra, fibra e água
- [ ] Inventário de 24 espaços e barra rápida
- [ ] Machado, enxada e regador, com "juice" e um quadrado-alvo no chão
- [ ] 2 culturas (raiz-de-mel e mais 1): plantar, regar, crescer, colher
- [ ] Abrigo, baú, canteiro e fogueira
- [ ] Marina com rotina e pelo menos 15 falas de contexto
- [ ] Dia e noite, chuva simples, descanso
- [ ] 1 pista ambiental encontrada durante o plantio
- [ ] Salvar, fechar, reabrir e recuperar tudo (incluindo os baús)
- [ ] **30 FPS em 720p no Ryzen 5 3500U**
- [ ] Teste à parte com 2 jogadores no mesmo mapa

**Fora do MVP:** combate, os 6 biomas, 12 NPCs, casamento, os finais, multiplayer online, dublagem, chuva amarela.

## AS 3 DECISÕES ANTES DE QUALQUER OUTRA COISA
1. ~~Qual engine~~ → ✅ **Godot 4** (decisão do autor). Falta medir os limites dele no notebook.
2. **Quais são os primeiros 30 minutos:** explorar a clareira, coletar, plantar, construir o abrigo, falar com a Marina e achar uma pista.
3. **Quem desenvolve, quantas horas por semana, qual o teto de gastos,** e um contrato simples entre os sócios.

> "A única coisa que importa nos próximos 90 dias é uma clareira onde plantar, construir, falar com uma pessoa e salvar o jogo sem o notebook derreter." — Grok
