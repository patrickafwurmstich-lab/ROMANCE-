# O que falta para o jogo — lista do ChatGPT (loop de produção, volta 1)

> Texto bruto da resposta do ChatGPT. A parte final (o tópico 10 completo, o MVP e as 3 decisões) está resumida no arquivo consolidado `O-QUE-FALTA.md`.


SOB O CÉU DE NÉRIA

Plano de produção técnica e game design — Auditoria 1.0

Projeto: Formiguinha Açucarada
Gênero: RPG de vida e sobrevivência, fazenda, construção, exploração, romance e mistério
Visual: 3D estilizado, personagens anime VRM/VRoid
Plataforma inicial: PC Windows
Jogadores: 1–4, cooperativo
Hardware de desenvolvimento: Acer Aspire 3, Ryzen 5 3500U, 8 GB RAM, GPU integrada

Diagnóstico

A bíblia narrativa está suficientemente madura para iniciar a produção. O jogo, entretanto, ainda não possui uma especificação técnica e sistêmica fechada.

Uma boa história não determina automaticamente como plantar, construir, salvar, carregar um mapa, sincronizar quatro jogadores ou manter 30 FPS num notebook sem placa de vídeo dedicada.

O maior risco não é faltar conteúdo. É começar a produzir centenas de personagens, prédios e animações antes de descobrir se os sistemas fundamentais funcionam juntos.

META TÉCNICA INICIAL PROPOSTA

30 FPS
Alvo mínimo sustentado no notebook de referência
720p
Resolução inicial, com qualidade baixa
4
Jogadores, primeiro em teste local de rede
10–15 min
Tempo desejado para o primeiro ciclo de gameplay
Metas de projeto, não resultados de benchmark. Devem ser medidas numa build real.
Os dez tópicos que faltam

Ordem de trabalho

Tópico

Prioridade

1

Engine, arquitetura e desempenho

Crítica

2

Game design dos sistemas principais

Crítica

3

Economia, progressão e balanceamento

Crítica

4

Mundo, mapas e exploração

Crítica

5

Personagens VRM, NPCs e animação

Alta

6

Interface, controles e acessibilidade

Alta

7

Multiplayer, rede e salvamentos

Crítica

8

Áudio, música e feedback

Média

9

Produção, MVP, cronograma e orçamento

Crítica

10

Lançamento, Steam e negócio

Alta

A ordem é de decisão e prototipagem, não uma sequência em que se termina completamente um tópico antes de iniciar o seguinte. O multiplayer, por exemplo, precisa influenciar a arquitetura desde o começo, mesmo que sua implementação completa venha depois.

1. ENGINE, ARQUITETURA E DESEMPENHO
Prioridade crítica — começar imediatamente
Por que falta?

Ainda não existe uma decisão técnica sobre motor gráfico, pipeline VRM, renderização, física, salvamento, organização de código e orçamento de desempenho.

Se isso for ignorado, o projeto pode terminar com mapas bonitos que rodam a 12 FPS, personagens incompatíveis com o sistema de animação ou um jogo solo impossível de converter em multiplayer sem reescrever quase tudo.

Decisões e entregas obrigatórias

Escolher a engine. Comparar Godot 4 e Unity LTS numa mesma cena de teste, não apenas por preferência pessoal.

Escolher o pipeline VRM. Verificar importação de VRM 0.x/1.0, expressões, ossos humanoides, materiais, animações e licenças dos modelos. Para Godot, testar conversão para glTF como alternativa.

Definir o renderizador. Priorizar um caminho compatível com GPU integrada, sem depender de efeitos modernos caros.

Definir linguagem e arquitetura. Exemplo em Godot: GDScript, cenas reutilizáveis, dados externos para itens, culturas e NPCs.

Definir câmera. Terceira pessoa elevada, rotacionável de maneira limitada, ou isométrica fixa? Isso muda a quantidade de modelos e animações necessárias.

Definir física. Movimento de personagem, colisão com árvores, degraus, rampas, água e construções.

Definir sistema de tempo. Dia de 27h12, quatro estações, noite clara a cada nove dias e eventos climáticos persistentes.

Definir sistema de dados. Itens, receitas, culturas, NPCs e eventos não devem depender de números espalhados pelo código.

Definir salvamentos versionados. Mundo, jogadores, inventários, plantações, relações, capítulos e estados dos finais.

Definir orçamento gráfico. Limites para polígonos, texturas, sombras, luzes, partículas e personagens visíveis.

Definir testes automatizados. Carregar/salvar, plantar/colher, fabricar itens e recuperar saves interrompidos.

Definir controle de versão. Git, Git LFS para arquivos grandes, estrutura de pastas, backups externos e convenções de nomenclatura.

Números iniciais propostos

Recurso

Meta de protótipo

Resolução

1280 × 720

FPS

30 sustentados, 1% low desejável acima de 24

RAM total do jogo

Preferencialmente até 2,5–3 GB no notebook de referência

Personagens ativos visíveis

4 jogadores + até 6 NPCs no teste inicial

Personagem VRM

10 mil–20 mil triângulos inicialmente

Texturas de personagem

Preferir atlas de 1024², evitando materiais redundantes

Texturas de ambiente

512² ou 1024² para a maioria dos objetos

Luzes com sombras dinâmicas

Uma principal; adicionais sem sombras quando possível

Distância de detalhes altos

Aproximadamente 15–25 m, ajustável

Tempo de carregamento

Meta inicial inferior a 20 segundos para uma área pequena

Tamanho do primeiro mapa

128 × 128 m

Salvamento

Manual e automático, com escrita segura e cópia de recuperação

Esses números são hipóteses de orçamento técnico, não garantias de desempenho. Um VRM com 15 mil triângulos pode custar mais que outro com 30 mil se possuir muitos materiais, transparências, ossos e draw calls.

Engine: recomendação inicial

Critério

Godot 4

Unity LTS

Licenciamento

Código aberto, sem royalties da engine

Licença proprietária com condições por plano

Fluxo de trabalho

Leve e relativamente simples

Ecossistema amplo, mas projeto/editor podem consumir mais recursos

VRM

Exige validar plugin ou conversão

Ecossistema VRM consolidado, incluindo soluções como UniVRM

Multiplayer

APIs de rede disponíveis; trabalho próprio necessário

Soluções de rede variadas, também exigem integração

Desempenho no notebook

Depende do renderizador e da cena

Depende do pipeline e da cena

Risco principal

Pipeline VRM e ferramentas específicas

Complexidade de projeto, dependências e consumo de recursos

Recomendação provisória: testar Godot 4 com renderização Compatibility primeiro, devido ao hardware modesto e ao custo operacional. Mas não fechar a decisão antes de importar um personagem VRM real e testar animação, materiais, sombras e desempenho.

Se o pipeline VRM for significativamente mais estável em Unity no teste, Unity pode ser a escolha mais barata em horas de desenvolvimento, mesmo que a engine pareça mais pesada.

Teste obrigatório de engine

Construir a mesma cena nas duas opções:

Terreno de 128 × 128 m.

100 árvores simples.

20 objetos interativos.

6 personagens VRM animados.

1 lago.

1 casa com interior.

1 plantação de 64 células.

1 ciclo de dia/noite.

1 chuva simples.

Inventário e salvamento.

Medir FPS, uso de RAM, tempo de abertura do editor, tempo de importação e estabilidade.

Corte de escopo: eliminar iluminação global em tempo real, sombras em múltiplas luzes, cabelo físico, reflexos complexos, volumetria e vegetação individualizada em grande distância.

Não cortar: movimento responsivo, interação confiável, salvamento seguro e legibilidade visual.

2. GAME DESIGN DOS SISTEMAS PRINCIPAIS
Prioridade crítica — prototipar logo após a engine
Por que falta?

A bíblia diz que o jogador cultiva, constrói, pesca, cozinha, sobrevive e explora. Mas não define as regras jogáveis dessas ações.

Sem regras concretas, cada programador ou artista imaginará um jogo diferente.

O maior perigo é criar dez sistemas superficiais: plantar apertando um botão, pescar apertando outro, construir fazendo um objeto aparecer do nada e combater clicando até o inimigo desaparecer.

Néria precisa de um ciclo central satisfatório.

Sistemas que precisam ser especificados

Movimentação: caminhar, correr, pular ou não, atravessar água rasa, subir rampas, usar ferramentas e interagir.

Interação contextual: distância, prioridade entre objetos próximos, feedback visual e ação cancelável.

Agricultura: preparar solo, plantar, regar, fertilizar, crescimento, doenças, colheita e replantio.

Solo: umidade, fertilidade e contaminação. Evitar simulação química excessiva.

Estações: culturas apropriadas, alterações de produtividade, temperatura e riscos.

Construção: fundação, posicionamento, rotação, encaixe, colisão, custos e desmontagem.

Fabricação: receitas, bancada, ferramentas, materiais, tempo de produção e desbloqueios.

Sobrevivência: fome, sede, energia, temperatura e saúde, com regras claras sobre o que realmente pode matar.

Pesca: lançar linha, esperar, fisgar, controlar tensão, capturar e soltar.

Fauna: comportamento passivo, alerta, fuga, perseguição, ataque e retorno ao território.

Combate: ataques, esquiva, alcance, dano, resistência e recuo; sem transformar o jogo num RPG de combate complexo.

Cozinha: ingredientes, receitas, conservação, deterioração e risco de consumir alimento estragado.

Ferramentas: machado, enxada, regador, martelo, pá, vara de pesca e faca de uso geral.

Água: coleta, armazenamento, filtragem e tratamento adequado para riscos biológicos; contaminação química exige solução diferente.

Clima: chuva normal, chuva amarela, vento, frio, tempestade e efeitos nas atividades.

NPCs ajudando: tarefas atribuíveis, limites de disponibilidade, autonomia e interrupção por emergência.

Descanso: dormir, recuperar energia e avançar o tempo sem invalidar eventos importantes.

Morte/desmaio do jogador: consequências de perder saúde ou energia, recuperação, perda de itens ou resgate.

Inventário físico: empilhamento, peso ou limite por espaços, armazenamento e transferência.

Cooperação: dois jogadores cultivando, construindo ou carregando materiais sem duplicar recursos.

Proposta de ciclo de jogo
O jogador coleta recursos, produz, melhora sua infraestrutura, explora, descobre informações e toma decisões que mudam suas próximas necessidades.

O ciclo não deve exigir que todo jogador faça todas as atividades.

Um jogador pode preferir agricultura e construção.

Outro pode explorar.

Outro pode se dedicar a NPCs e cozinha.

Agricultura — proposta inicial

Cultura

Estação favorável

Crescimento

Rendimento

Uso

Raiz-de-mel

Brotação

4 dias locais

2 unidades

Cozinha, alimento básico

Grão-solar

Calor

7 dias

3 unidades

Farinha e ração

Folha-de-prata

Brotação/Ventos

5 dias

2 unidades

Cozinha

Tubérculo-pedra

Ventos

9 dias

3 unidades

Reserva de alimento

Fruta-lanterna

Calor

8 dias

2 unidades

Cozinha e conservação

Erva-amarga

Frio

6 dias

2 unidades

Bebida e receitas

Hortelã terrestre

Condições controladas

5 dias

2 unidades

Pista histórica, culinária

São nomes e valores de protótipo, sujeitos a balanceamento. A hortelã terrestre deve surgir inicialmente como vestígio da antiga colônia, não como cultura disponível desde o começo.

Sistema de solo mínimo

Cada célula cultivável possui três estados principais:

Umidade: 0–100.

Fertilidade: 0–100.

Contaminação: ausente, suspeita ou confirmada.

Não simular dezenas de nutrientes no MVP.

A chuva aumenta umidade.

O calor acelera secagem.

A chuva amarela pode danificar culturas desprotegidas.

Uma plantação contaminada não deve ficar automaticamente segura após uma rega.

Construção — proposta inicial

Construção

Dimensão aproximada

Materiais iniciais

Função

Abrigo improvisado

3 × 3 m

20 madeira, 10 fibra

Descanso e proteção

Baú de madeira

1 × 1 m

8 madeira

Armazenamento

Canteiro

1 × 1 m

Enxada + sementes

Cultivo

Coletor de chuva

2 × 2 m

12 madeira, 6 fibra

Água não tratada

Bancada

2 × 1 m

15 madeira, 5 pedra

Fabricação

Fogueira

2 × 2 m

6 pedra, 5 madeira

Cozinha e calor

Cerca

2 m por módulo

4 madeira

Proteção e manejo

Casa simples

5 × 5 m

80 madeira, 30 pedra, 20 fibra

Moradia

Oficina

6 × 5 m

100 madeira, 40 pedra, 15 metal

Manutenção

Moinho

4 × 4 m

60 madeira, 20 metal

Processamento e pista elétrica

Os custos não representam valores finais. Servem para testar tempo de coleta e progressão.

Sobrevivência — proposta inicial

Indicador

Escala

Efeito

Energia

0–100

Limita trabalho e corrida

Fome

0–100

Afeta recuperação

Sede

0–100

Afeta desempenho rapidamente

Saúde

0–100

Ferimentos, doença e recuperação

Temperatura

Faixas qualitativas

Frio, confortável, calor

Decisão recomendada: não criar uma barra separada para sanidade, felicidade, higiene, sono, estresse e moral no MVP.

Isso produziria manutenção constante e desviaria o jogo da fazenda, da comunidade e da investigação.

Combate — escopo inicial

Um ataque leve.

Um ataque forte ou carregado.

Uma esquiva.

Um bloqueio simples, se os testes justificarem.

Dois tipos de ameaça no protótipo: predador territorial e animal que ataca ao ser acuado.

Fuga como opção válida.

Sem árvore de habilidades de combate no MVP.

Corte de escopo: não criar dez armas, dezenas de inimigos, chefes e combos antes de validar a agricultura e a construção.

Risco no notebook

A agricultura pode gerar centenas de objetos individuais e chamadas de atualização.

A construção pode criar colisões demais.

A IA animal pode consumir CPU.

Solução: atualizar crescimento por eventos e intervalos, não a cada frame; usar instanciamento para vegetação; limitar agentes ativos; agrupar objetos estáticos; descarregar áreas distantes.

Prioridade interna: primeiro movimento e interação, depois agricultura, inventário e construção; sobrevivência, pesca e combate entram em camadas.

3. ECONOMIA, PROGRESSÃO E BALANCEAMENTO

Prioridade crítica — definir junto com o ciclo principal

Por que falta?

Néria ainda não possui uma economia jogável. Sabemos que o jogador coleta, planta, fabrica e constrói, mas não sabemos quanto produz, quanto consome, o que vale a pena guardar ou por que melhorar uma ferramenta.

Se isso for ignorado, podem surgir quatro problemas graves: recursos infinitos, trabalho repetitivo, progressão rápida demais e jogadores presos porque gastaram um material raro.

Decisão recomendada: Néria não deve começar com uma economia monetária tradicional. Treze pessoas isoladas não precisam imediatamente de uma loja com moedas, impostos e preços de mercado.

A economia inicial deve ser de produção, consumo, estoque e trocas de trabalho. Uma moeda ou sistema de comércio formal só deve surgir se houver uma necessidade real de design.

Tudo que precisa ser decidido e implementado

Catálogo de recursos: madeira, pedra, fibra, argila, sucata da colônia, metal recuperável, água, sementes, alimentos e componentes elétricos.

Origem dos recursos: árvores regeneram? Pedras reaparecem? Metal antigo é finito? Onde se obtém cada material?

Inventário: quantidade de espaços, limite por pilha, itens exclusivos, objetos de missão e ferramentas.

Armazenamento: baús individuais, depósito comunitário, permissões no multiplayer e identificação de proprietários.

Consumo: quantidade de alimento, água e combustível necessária por dia local.

Deterioração: alimento fresco, seco, cozido e conservado; impacto do calor e armazenamento.

Receitas: materiais, ferramentas, bancada necessária e tempo de fabricação.

Progressão de ferramentas: versões improvisada, reforçada e especializada, sem dez níveis artificiais.

Progressão agrícola: novos cultivos, irrigação, conservação, fertilização e proteção climática.

Progressão de construção: abrigo, casa, depósito, oficina, estruturas de água e instalações avançadas.

Recursos raros: componentes da antiga colônia devem ser limitados, mas não podem causar bloqueio permanente por uso acidental.

Trocas com NPCs: ajuda comunitária, empréstimos, reparos, compartilhamento e recusas.

Custos de manutenção: estruturas deterioram? Quanto trabalho exigem? Há manutenção preventiva?

Desbloqueios: conhecimento por experimentação, observação de NPCs, manuais ou descoberta ambiental.

Recompensas de exploração: ferramentas, receitas, materiais, pistas ou atalhos — não apenas documentos.

Recuperação de erros: desmontagem, reciclagem, reparos e alternativas para recursos gastos.

Balanceamento solo e cooperativo: quatro jogadores não podem quadruplicar a produção enquanto o consumo permanece igual.

Medição de tempo: quanto tempo real leva para construir a primeira casa, colher a primeira safra e alcançar autonomia alimentar?

Números iniciais propostos

Elemento

Valor inicial de teste

Inventário pessoal

24 espaços

Pilha de madeira/pedra

99 unidades

Pilha de sementes

50 unidades

Ferramentas equipadas

4 atalhos rápidos

Baú pequeno

20 espaços

Depósito comunitário

80 espaços

Madeira de árvore pequena

4–8 unidades

Pedra de depósito pequeno

3–6 unidades

Fibra por arbusto

2–4 unidades

Fabricação de item simples

1–3 segundos reais

Fabricação em bancada

3–10 segundos reais

Recuperação ao desmontar

70–90% dos materiais comuns

Primeira colheita

Dentro de 30–60 minutos reais de jogo

Primeiro abrigo melhorado

Dentro de 45–90 minutos reais

Progressão proposta em cinco etapas

Etapa 1 — Sobreviver

Água, abrigo, fogueira, ferramentas improvisadas e alimentos coletados.

Etapa 2 — Produzir

Canteiros, sementes, baús, cozinha e armazenamento.

Etapa 3 — Estabilizar

Casa, oficina, irrigação, conservação e defesas ambientais.

Etapa 4 — Recuperar

Eletricidade limitada, moinho, instalações antigas e ferramentas especializadas.

Etapa 5 — Decidir

Autossuficiência, comunicação, investigação final e destinos da comunidade.

As etapas não devem impedir a exploração antecipada. Representam capacidade material, não capítulos obrigatórios.

Uma conta que precisa fechar

Suponha que uma família comunitária de quatro pessoas consuma quatro porções de alimento por dia local.

Uma plantação de 12 células de raiz-de-mel, com rendimento de duas unidades a cada quatro dias, produz em média seis unidades por dia, antes de perdas.

Isso permite alimentar o grupo, mas deixa pouca margem para falhas, sementes e conservação.

Esse é o tipo de conta que precisa ser simulado. Caso contrário, uma horta minúscula poderá alimentar doze NPCs indefinidamente.

Para o assentamento completo, é necessário decidir se os NPCs produzem e consomem recursos reais ou se a economia comunitária é abstraída. Recomendo uma solução híbrida: estoques coletivos reais para crises e construções, mas sem simular individualmente cada garfada de cada NPC.

Risco e corte de escopo

O maior risco não é gráfico: é balanceamento exponencial. Cada cultura, receita, ferramenta e construção acrescenta combinações.

Corte recomendado para o MVP: 12 recursos, 4 culturas, 8 receitas, 5 construções e 3 ferramentas principais.

Não criar mercado, moedas, vendedores, impostos, leilões ou árvore tecnológica gigantesca na primeira versão.

4. MUNDO, MAPAS E EXPLORAÇÃO

Prioridade crítica — construir em blocos, não um mundo inteiro

Por que falta?

Existem seis biomas na história, mas ainda não há definição de tamanho, topografia, rotas, densidade de objetos, interiores, streaming, pontos de interesse ou limites do mundo.

Se os seis mapas forem construídos imediatamente, o projeto pode consumir meses em cenário antes de existir uma atividade interessante.

A escolha mais perigosa seria anunciar um mundo aberto enorme sem orçamento de arte, otimização ou conteúdo para preenchê-lo.

Decisões e entregas obrigatórias

Estrutura do mundo: áreas conectadas com transições ou mapa contínuo com carregamento por setores.

Escala: quantos metros o jogador percorre por minuto? Qual distância é agradável entre casa e rio?

Topografia: altura, inclinação, rios, encostas, cavernas e áreas alagadas.

Rotas: caminhos principais, atalhos, pontes, passagens bloqueadas e alternativas.

Pontos de interesse: ruínas, depósitos, oficinas, estações agrícolas, túmulos, torres e acampamentos.

Construção permitida: onde o jogador pode construir? Pode bloquear trilhas e entradas de NPCs?

Terrenos cultiváveis: solo fértil, rochoso, alagado e contaminado.

Biomas visuais: vegetação, rochas, iluminação, água, partículas e paletas próprias.

Fauna por região: locais de aparecimento, territórios, ciclos e comportamento.

Recursos por região: distribuição de madeira, minério, fibra, alimentos e materiais recuperáveis.

Interiores: carregamento separado ou integrado? Como funcionam portas e câmera?

Navegação de NPCs: rotas utilizáveis após o jogador construir ou desmontar estruturas.

Streaming: ativação e descarregamento de setores distantes.

Clima localizado: chuva amarela, enchente, vento e efeitos de altitude.

Ciclo visual: iluminação ao longo de 27h12, noites claras e sombras.

Mapa do jogador: mapa desenhado progressivamente ou visão completa desde o início?

Orientação sem marcadores: trilhas, marcos naturais, placas da antiga colônia e conversas.

Persistência: árvores cortadas, construções, plantações e objetos deixados no chão.

Limites seguros: impedir quedas fora do mapa, objetos presos em rochas e construção sobre pontos narrativos.

Ferramentas de produção: editor de terrenos, posicionamento de objetos, vegetação procedural controlada e validação de caminhos.

Escala inicial proposta

Região

Tamanho-alvo futuro aproximado

Papel

Mata das Raízes Altas

350 × 350 m

Queda e sobrevivência

Vale da Água Clara

500 × 500 m

Vila e agricultura

Campos de Vidro

300 × 350 m

Recursos e exploração

Brejo das Lanternas

300 × 300 m

História da colônia

Serra Partida

400 × 400 m

Risco ambiental e ruínas

Costa das Torres

350 × 450 m

Investigação final

Atenção: são áreas conceituais, não compromisso de tamanho. A soma já ultrapassa 700 mil m² de terreno bruto. Isso é muito conteúdo para uma equipe pequena.

Não recomendo produzir essas dimensões de imediato.

Vertical slice de mapa
Esquema funcional do primeiro mapa, não layout artístico definitivo. Deve conter uma casa, oficina, horta, rio, ponte e pequena área florestal.
Densidade sugerida para o primeiro mapa de 128 × 128 m

1 acampamento central.

1 rio atravessável por ponte.

1 casa antiga.

1 oficina.

2 clareiras cultiváveis.

3 pequenas áreas de coleta.

1 zona de fauna.

1 ruína com pista.

2 caminhos alternativos.

1 área de risco climático.

O objetivo é que o jogador tenha algo interessante para fazer a cada 20–40 segundos de deslocamento, sem transformar o mapa num parque de atrações.

Risco e corte de escopo

Vegetação, transparência de folhas, sombras e água são especialmente caros em GPU integrada.

Corte: árvores com poucas variantes, LOD, folhas opacas ou alpha-test cuidadosamente limitado, água simples e mapas separados por transição.

Para o MVP, construir somente uma parte do Vale da Água Clara e uma pequena borda da Mata das Raízes Altas.

Não produzir seis biomas antes de provar o ciclo principal.

5. PERSONAGENS VRM, ANIMAÇÃO E INTELIGÊNCIA DOS NPCs

Prioridade alta — prototipar desde o começo; produzir o elenco completo depois

Por que falta?

Ter personagens criados no VRoid Studio não significa ter personagens prontos para um jogo.

É necessário importar, otimizar, animar, configurar colisões, expressões, roupas, cabelos, rotinas, interações e comportamento.

O risco é criar doze modelos detalhados e descobrir que seis deles simultaneamente derrubam o FPS.

Decisões e entregas obrigatórias

Padrão de modelo: versão VRM, escala, orientação, posição inicial e hierarquia de ossos.

Proporções: altura, tamanho da cabeça, mãos, pés e compatibilidade com ferramentas.

Rig: estrutura humanoide compatível com animações compartilhadas.

Materiais: shaders de pele, cabelo, roupa e olhos compatíveis com a engine escolhida.

Expressões: neutro, sorriso, irritação, tristeza, surpresa, cansaço e dor.

Animações básicas: parado, andar, correr, sentar, levantar, dormir e virar.

Animações de trabalho: cavar, plantar, regar, colher, cortar madeira, martelar, cozinhar, pescar e carregar objetos.

Animações sociais: conversar, olhar, acenar, entregar objeto, comer e abraçar.

Animações de risco: esquivar, cair, receber dano, levantar e fugir.

Retargeting: usar o mesmo conjunto de animações em personagens de alturas diferentes.

Cabelo e roupas: decidir se terão física ou animação simplificada.

LOD de personagens: reduzir custo de personagens distantes.

Agenda de NPCs: horários, locais de trabalho, descanso, alimentação e convivência.

Prioridades de IA: emergências interrompem tarefas comuns.

Navegação: evitar obstáculos e reagir a construções do jogador.

Interação social: proximidade, disponibilidade, eventos, confiança e conflitos.

Objetos nas mãos: posicionamento de ferramentas, pratos, canecas e equipamentos.

Casamento: mudança de moradia sem duplicar NPCs.

Ausência multiplayer: eventos românticos só com o jogador presente.

Ferramenta de depuração: visualizar estado atual, destino, tarefa, relação e motivo de uma recusa.

Orçamento inicial de animação

Grupo

Animações-base

Locomoção

6

Trabalho agrícola

6

Construção e ferramentas

5

Interação social

6

Descanso e cotidiano

5

Combate e dano

5

Total inicial

33

Não são 33 animações exclusivas por personagem.

São aproximadamente 33 clipes compartilháveis, com ajustes quando necessário.

Primeiros personagens

Produzir inicialmente:

1 protagonista personalizável de teste.

Marina, para agricultura.

Rafael, para construção.

Hana, para interação e cuidados.

1 NPC genérico de depuração.

Somente depois criar os demais.

Sistema de rotina — exemplo de Augusto

Período do dia

Atividade

Início da manhã

Inspecionar e lubrificar o moinho

Manhã

Trabalhar na oficina

Meio do dia

Comer e descansar

Tarde

Reparar equipamentos

Fim do dia

Organizar ferramentas

Noite

Voltar ao alojamento

Na manutenção matinal:

AUGUSTO: "Passa a chave 12."

Isso deve corresponder a uma interação real: o jogador pode entregar a chave correta, e Augusto utiliza a ferramenta na animação.

Se o moinho não existir, Augusto não pode continuar fingindo que o lubrifica. Sua agenda precisa ter uma tarefa alternativa.

Arquitetura de comportamento recomendada

Usar uma máquina de estados hierárquica ou um planejador simples com prioridades.

Exemplo:

Emergência > Saúde > Compromisso marcado > Trabalho > Necessidades > Lazer

Não usar um modelo generativo de IA para controlar cada NPC em tempo real. Isso acrescentaria custo, imprevisibilidade, dependência de serviço e dificuldade de testar continuidade.

Os NPCs podem parecer humanos com rotinas, memória de eventos, decisões condicionais e animações bem dirigidas.

Risco no notebook

O gargalo pode vir de materiais VRM, transparências, cabelo, blendshapes, skinning e número de personagens ativos.

Corte de escopo:

Sem simulação física individual de cada mecha.

Sem troca dinâmica de dezenas de peças de roupa no MVP.

Sem animações faciais complexas em personagens distantes.

Sem 12 NPCs simultaneamente executando IA detalhada.

Sem modelagem exclusiva para cada ferramenta na mão de cada NPC.

Prioridade interna: primeiro importar um VRM e fazê-lo andar; depois compartilhar animações; depois agenda; só então produzir as doze identidades visuais finais.

6. INTERFACE, CONTROLES, UX E ACESSIBILIDADE

Prioridade alta — começar no primeiro protótipo

Por que falta?

Um jogo pode possuir bons sistemas e ainda ser desagradável se o jogador não souber qual objeto está selecionado, por que uma construção não encaixa ou onde foi guardado um material.

A bíblia determina que não haverá barra de afeto nem marcadores artificiais de pistas. Isso não significa esconder informações operacionais.

A interface precisa distinguir mistério narrativo de dificuldade desnecessária.

Telas e componentes que precisam existir

Menu inicial: novo jogo, continuar, configurações, multiplayer e sair.

Criação de personagem: aparência, nome, voz opcional, configurações básicas.

HUD: energia, saúde, fome, sede e ferramentas, com opção de simplificação.

Inventário: arrastar, dividir pilhas, equipar, transferir e descartar.

Barra rápida: seleção por teclado, mouse e controle.

Construção: prévia fantasma, rotação, custo, colisão e motivo de bloqueio.

Agricultura: indicação de solo preparado, umidade e crescimento.

Fabricação: receitas, materiais disponíveis, bancada necessária e resultado.

Diário factual: acontecimentos importantes, sem pontos de afeto.

Mapa: regiões conhecidas, construções e anotações do jogador.

Conversas: escolhas legíveis, possibilidade de avançar texto e histórico recente.

Leitura de documentos: zoom, rolagem, contraste e marcação de páginas.

Calendário: dia local, estação, previsão aproximada e eventos comunitários conhecidos.

Gerenciamento de NPCs: tarefas, disponibilidade e compromissos, sem revelar emoções ocultas.

Multiplayer: convidar, entrar, permissões, conexão e desconexão.

Salvamento: slots, data, tempo jogado, versão e estados do Final C.

Configurações gráficas: resolução, escala, sombras, distância e limite de FPS.

Configurações de áudio: música, ambiente, efeitos, vozes e volume geral.

Acessibilidade: tamanho de fonte, legendas, remapeamento, redução de movimento e opções de contraste.

Mensagens de erro: explicar falhas sem apresentar códigos técnicos ao jogador.

Controles iniciais para PC

Ação

Teclado/mouse

Movimento

WASD

Câmera

Mouse

Interagir

E

Usar ferramenta

Botão esquerdo

Ação secundária

Botão direito

Correr

Shift

Inventário

Tab

Diário

J

Mapa

M

Construção

B

Pausa/configurações

Esc

Atalhos

1–8

Esses controles são proposta inicial. Precisam ser remapeáveis.

Regra importante: pistas sem marcadores, operações com feedback

Exemplo correto:

O jogador encontra um brinquedo enterrado.

Não aparece "MISSÃO ATUALIZADA: DESCUBRA A CRIANÇA".

Mas pode examinar o objeto, guardá-lo e consultar uma descrição factual.

Exemplo incorreto:

O jogador tenta construir uma casa e nada acontece, sem saber que falta pedra.

A interface deve mostrar:

Faltam 12 unidades de pedra.

Mistério não deve significar interface ruim.

Diário factual — exemplo

Diário — Dia 46

Marina encontrou manchas azuis em três canteiros perto do antigo duto.

Samuel pediu para repetir uma análise de água.

Clara recusou o convite para jantar. Disse que já tinha combinado outra coisa.

A chuva amarela atingiu o depósito descoberto.

O diário registra fatos que o personagem presenciou ou soube por alguém. Não informa estados psicológicos ocultos.
Regras do diário

Registrar somente mudanças significativas.

Não registrar cada presente, cumprimento ou interação.

Não revelar informações que o jogador não poderia conhecer.

Permitir filtrar por pessoas, construção, agricultura, exploração e comunidade.

Números iniciais

Elemento

Proposta

Escala de UI

75–150%

Fonte principal em 720p

16–18 px equivalentes, ajustável

Barra rápida

8 espaços

Histórico de diálogo

Últimas 20 falas da conversa

Diário

Entradas por evento significativo

Autosave

A cada 10–15 minutos reais e em transições seguras

Slots manuais

Pelo menos 5

Idiomas iniciais

Português brasileiro; arquitetura pronta para tradução

Risco e corte de escopo

UI sofisticada consome tempo de programação e arte.

Corte: usar uma identidade visual simples e consistente. Primeiro garantir navegação, legibilidade e controle por teclado/mouse.

Não desenvolver dezenas de animações de menu, interfaces 3D holográficas ou um editor de personagem excessivamente complexo antes de validar o jogo.

7. MULTIPLAYER, REDE E SALVAMENTOS

Prioridade crítica — definir a arquitetura antes dos sistemas persistentes

Por que falta?

Multiplayer não é uma funcionalidade que se adiciona no final. Ele altera a forma como objetos são criados, itens são transferidos, o tempo avança, NPCs tomam decisões e o mundo é salvo.

Néria possui complicações adicionais: quatro jogadores podem cultivar a mesma terra, disputar romances, construir no mesmo terreno e chegar ao Final C com decisões diferentes.

Se a arquitetura nascer exclusivamente solo, a conversão posterior pode exigir reescrever agricultura, inventário, IA, construção e salvamento.

Tudo que precisa ser decidido e implementado

Modelo de hospedagem: servidor dedicado, host entre jogadores ou ambos.

Autoridade: quem determina posições, recursos, dano, clima e decisões dos NPCs.

Entrada de jogadores: convite, código de sessão, lista de amigos ou conexão direta.

Descoberta de partidas: integração futura com Steam, LAN e solução de conectividade.

Sincronização de movimento: interpolação, correção de posição e tolerância a latência.

Inventários: transferências atômicas, prevenção de duplicação e propriedade dos itens.

Agricultura compartilhada: impedir dois jogadores de colher a mesma planta duas vezes.

Construção compartilhada: impedir colocação simultânea no mesmo espaço.

Tempo e sono: como avançar a noite quando nem todos querem dormir.

Clima: uma única simulação autoritativa de chuva, vento e temperatura.

NPCs: agenda, posição, decisões e estados sociais controlados por uma autoridade.

Romances: compromisso exclusivo, presença obrigatória e recusa visível.

Votação: quórum, prazos, jogadores desconectados e decisões pessoais protegidas.

Mortalidade: regras para eventos fatais e jogadores ausentes.

Desconexão: o que acontece com o personagem, ferramentas e inventário?

Reconexão: recuperar posição, estado pessoal e mudanças ocorridas.

Salvamento: mundo compartilhado, estados individuais e versões de arquivo.

Migração de host: será suportada? O que acontece se o anfitrião sair?

Integridade: impedir comandos inválidos, itens negativos e ações duplicadas.

Depuração: logs de eventos, IDs de objetos e reprodução de erros.

Testes de latência: conexões lentas, perda de pacotes e reconexão.

Compatibilidade: impedir jogadores com versões de dados incompatíveis de entrarem sem aviso.

Arquitetura recomendada

Para uma equipe pequena, começar com host autoritativo: um jogador hospeda, e o mundo é simulado no processo dele.

Os demais enviam intenções.

Exemplo:

O cliente pede para colher uma raiz-de-mel.

O host verifica se a planta está madura, se o jogador está perto e se ela ainda não foi colhida.

O host concede o item, altera a planta e replica o resultado.

O cliente não pode simplesmente anunciar que ganhou dez raízes.

Um único host valida o mundo. Os clientes enviam ações e recebem estados confirmados.
Números iniciais propostos

Elemento

Meta

Jogadores

1–4

Frequência de simulação de rede

20 ticks/s inicialmente

Atualização de movimento

10–20 Hz, com interpolação

Latência-alvo para teste

Até 100 ms

Testes adicionais

150–250 ms e perda de pacotes

Autosave do host

10–15 minutos reais

Backups rotativos

3–5 versões

Tamanho desejável de save inicial

Inferior a 10 MB para o mapa de teste

Tempo de reconexão

Meta inferior a 30 segundos em sessão pequena

Persistência de eventos

IDs únicos e registros de mudanças críticas

Esses valores precisam de medição. A quantidade de dados transmitidos depende muito mais da frequência e do tipo de atualização do que apenas do número de jogadores.

Modelo de salvamento

Separar o estado em quatro partes:

Bloco

Exemplos

Mundo

Dia, clima, árvores, plantações, construções, recursos

NPCs

Agenda, posição, relações, casamento, saúde, eventos

Jogadores

Identidade, inventário, posição, progresso pessoal

Narrativa

Capítulos, pistas conhecidas, decisões e finais

Todo objeto persistente precisa de um identificador estável.

Um baú não pode mudar de identidade toda vez que o mapa é carregado.

Um casamento não pode ser registrado apenas no arquivo do jogador se também altera a moradia do NPC no mundo.

Final C

O solo exige os dois estados:

Néria — o operador fica: campanha continuável.

Epílogo na Terra: encerramento narrativo.

No cooperativo, o sistema precisa registrar separadamente quem permaneceu, quem partiu e quem ainda não decidiu.

Não se deve simplesmente apagar personagens que retornaram.

Testes obrigatórios

Teste

Resultado esperado

Dois jogadores colhem a mesma planta

Apenas um recebe o recurso

Dois colocam parede no mesmo lugar

Uma operação é aceita

Host fecha durante salvamento

Arquivo anterior permanece recuperável

Jogador desconecta durante conversa

Evento pessoal não é concluído incorretamente

Dois pedem compromisso ao mesmo NPC

Apenas um compromisso é aceito

Jogador ausente durante votação

Direitos pessoais preservados

Jogador entra após 30 dias locais

Recebe estado atualizado do mundo

Host reinicia depois do Final C

Estados narrativos permanecem consistentes

Jogador tenta usar item inexistente

Ação rejeitada

Save de versão antiga é carregado

Migração ou aviso de incompatibilidade

Risco e corte de escopo

O maior risco é sincronizar todos os detalhes.

Corte recomendado:

Sem servidores dedicados no lançamento inicial, salvo necessidade comprovada.

Sem migração automática de host no MVP.

Sem mundo persistente 24 horas.

Sem jogadores entrando em campanhas públicas aleatórias.

Sem voz integrada inicialmente.

Sem física de objetos soltos sincronizada em grande quantidade.

Não cortar: integridade de inventário, salvamento, reconexão, exclusividade de romance e autoridade sobre recursos.

O multiplayer deve ser desenvolvido em pequenas provas técnicas desde cedo, mas não precisa estar completo no primeiro protótipo público.

8. ÁUDIO, MÚSICA, AMBIÊNCIA E FEEDBACK

Prioridade média — arquitetura cedo, produção musical depois

Por que falta?

Néria depende muito de atmosfera: chuva nas folhas, vento nas estruturas, silêncio da cabana de Elias, ferramentas trabalhando, noite clara e o gravador da colônia.

Sem áudio, as cenas podem parecer vazias.

Mas música constante também pode destruir o efeito de momentos importantes.

O silêncio precisa ser projetado como parte do sistema, não apenas como ausência acidental de arquivo musical.

Tudo que precisa ser decidido e implementado

Identidade musical: instrumentos, andamento, densidade e relação entre música e ambiente.

Temas de biomas: Mata, Vale, Campos, Brejo, Serra e Costa.

Variação por estação: não necessariamente quatro trilhas completas para cada região.

Ciclo dia/noite: transições suaves, sem reiniciar música a cada mudança.

Noites claras: sons e música diferentes, sem transformar o fenômeno em terror sobrenatural.

Chuva amarela: vento, partículas, trovões distantes e abafamento ambiental.

Ferramentas: impactos de machado, enxada, martelo, serra, água e moinho.

Construções: madeira rangendo, portas, telhados, passos em superfícies diferentes.

Fauna: chamados, passos, alertas e sinais de aproximação.

NPCs: passos, respiração, esforços, reações e falas curtas, se houver dublagem.

Diálogos: definir dublagem completa, parcial ou apenas texto.

Gravador: tratamento de áudio antigo, ruído, distância e inteligibilidade.

Silêncio do túmulo de Lua: retirada absoluta da música.

Silêncio do Final C: ausência de trilha durante a permanência do operador.

Feedback de UI: selecionar, confirmar, negar, fabricar, colher e salvar.

Mixagem: volumes independentes e prioridade de sons.

Áudio espacial: distância, paredes, interiores e posicionamento.

Acessibilidade: legendas e indicadores visuais para sons relevantes.

Licenciamento: trilhas, efeitos, vozes e contratos de uso comercial.

Ferramentas de teste: medir picos de volume, transições e sons simultâneos.

Biblioteca inicial proposta

Categoria

Quantidade para vertical slice

Trilhas musicais

3

Ambiências em loop

6

Efeitos de ferramentas

15

Passos e superfícies

12

Fauna

10

UI

8

Construção e objetos

12

Eventos especiais

5

Total de arquivos/variações

71

É possível produzir mais variedade a partir de camadas, alterações discretas de volume e variações de execução, sem precisar de centenas de arquivos.

Três momentos de áudio que precisam funcionar
A chuva amarela

Antes da chuva, o jogador ouve mudança de vento e percebe o céu.

O aviso não deve depender exclusivamente do som, porque há jogadores com deficiência auditiva.

O túmulo de Lua

Ao entrar na pequena área do túmulo, a música é retirada.

Não deve tocar uma melodia triste especial.

O silêncio musical é o efeito.

Sons ambientais podem permanecer, mas a transição precisa ser cuidadosa para não parecer defeito de áudio.

O operador do Final C

Depois da transferência, não toca música.

O jogador escuta os equipamentos, o ambiente e os próprios passos.

Quando as luzes são apagadas, a cena termina sem crescendo orquestral.

Números iniciais

Música em formato comprimido adequado ao motor.

Efeitos curtos carregados conforme necessidade.

No máximo 24–32 vozes simultâneas no protótipo, ajustando conforme desempenho.

Transições musicais normais de 1–3 segundos.

Silêncios narrativos com regras específicas, não fades genéricos.

Três controles mínimos de volume: música, efeitos e ambiente; idealmente também voz e interface.

Risco e corte de escopo

Dublar doze NPCs em português e outros idiomas é caro e trabalhoso.

Recomendação: lançar inicialmente com texto e sons vocais discretos, sem dublagem integral.

Criar música original para as cenas principais e usar uma biblioteca licenciada de efeitos quando apropriado.

Não investir num álbum completo antes de existir gameplay que determine o ritmo musical.

9. PRODUÇÃO, MVP, CRONOGRAMA, EQUIPE E ORÇAMENTO

Prioridade crítica — definir antes de encomendar conteúdo

Por que falta?

A Formiguinha Açucarada precisa transformar uma bíblia narrativa em tarefas, responsáveis, entregas e critérios de aceitação.

Sem gestão de produção, o projeto pode crescer indefinidamente.

O maior risco para uma empresa pequena é trabalhar durante meses em conteúdo que nunca chega a uma build jogável.

A unidade de progresso deve ser a versão executável testada, não a quantidade de modelos criados.

Tudo que precisa ser definido

Responsável técnico: quem decide arquitetura e aprova mudanças?

Responsável por game design: quem controla números, progressão e balanceamento?

Responsável por arte: estilo, qualidade, otimização e consistência visual.

Responsável por narrativa: integração de cenas, diálogos e estados.

Escopo do MVP: o que precisa existir e o que fica de fora.

Escopo do vertical slice: qual trecho representa a experiência final?

Backlog: tarefas pequenas, com estimativa e critérios de conclusão.

Cronograma: fases, marcos, testes e folga para correções.

Orçamento: ferramentas, assets, serviços, contratação, taxas e marketing.

Controle de versões: branches, revisão, builds e histórico.

Backups: código, modelos, texturas, áudio e documentação.

Testes de qualidade: bugs, regressões, desempenho e usabilidade.

Controle de mudanças: novas ideias entram por avaliação, não automaticamente.

Documentação técnica: dados, APIs internas, formatos e dependências.

Pipeline de assets: modelagem, exportação, importação, otimização e validação.

Licenças: VRoid, VRM, modelos de terceiros, músicas, fontes e plugins.

Terceirização: o que contratar e o que produzir internamente.

Distribuição de builds: testes internos e externos.

Métricas de progresso: horas estimadas, tarefas concluídas, bugs críticos e FPS.

Critérios de cancelamento ou redução: quando uma funcionalidade está custando mais que seu benefício.

MVP, vertical slice e jogo completo são coisas diferentes

Etapa

Objetivo

O que demonstra

Protótipo técnico

Provar engine, VRM, movimento e salvamento

O projeto roda

MVP mínimo jogável

Provar o ciclo principal

O jogo é divertido por 20–30 minutos

Vertical slice

Representar qualidade final em uma pequena área

O jogo pode ser produzido naquele padrão

Alpha

Sistemas principais completos, conteúdo parcial

A campanha é percorrível

Beta

Conteúdo integrado e correção de bugs

O jogo está próximo de lançamento

Lançamento

Versão estável e comercial

O produto pode ser vendido e mantido

Cronograma inicial — equipe pequena

Estimativa de planejamento para uma equipe de 2–4 pessoas com experiência intermediária. Não é promessa de prazo.

Fase 0 — Decisão de engine e testes VRM

4–6 semanas

Fase 1 — Protótipo de movimento, coleta, plantio e save

2–3 meses

Fase 2 — MVP jogável

3–5 meses

Fase 3 — Vertical slice com NPCs e multiplayer básico

4–6 meses

Fase 4 — Produção das regiões e sistemas

8–14 meses

Fase 5 — Alpha, beta, otimização e lançamento

4–8 meses

As barras representam esforço relativo ilustrativo, não uma escala cronológica exata.

Prazo total realista: aproximadamente 24–42 meses para uma primeira versão comercial com seis regiões, doze NPCs e multiplayer, supondo equipe pequena dedicada, reaproveitamento de assets e disciplina de escopo.

Para uma pessoa sozinha, trabalhando parcialmente, esse prazo pode ser muito maior.

Uma versão de acesso antecipado menor pode ser possível antes, mas somente se for estável e oferecer conteúdo suficiente.

Orçamento — cenários de referência

Cenário

Estrutura

Custo aproximado

A — Desenvolvimento próprio

1 pessoa, ferramentas gratuitas, assets pontuais

R$ 5 mil–25 mil de despesas diretas, excluindo remuneração e custo de vida

B — Microequipe

2–3 pessoas, terceirizações pontuais

R$ 150 mil–450 mil ao longo do projeto

C — Pequeno estúdio dedicado

3–5 pessoas por 2–3 anos

R$ 500 mil–1,5 milhão ou mais

Essas faixas são cenários de planejamento, não cotações de mercado. Encargos, remuneração, contratos, terceirização e duração podem alterar muito o total.

Um erro comum é chamar um projeto de barato porque o proprietário trabalha sem receber salário. O trabalho continua tendo custo econômico.

Recomendação para a Formiguinha Açucarada

Começar com um núcleo de produção pequeno e verificável:

Uma pessoa responsável por programação e integração.

Uma pessoa responsável por arte 3D, VRM e animação, ainda que parcialmente.

Uma pessoa responsável por design, conteúdo e testes, podendo acumular funções.

Se a empresa tiver apenas uma pessoa disponível, o escopo precisa ser reduzido proporcionalmente.

Risco e corte de escopo

Os maiores riscos são excesso de funcionalidades, retrabalho artístico, bugs de salvamento e multiplayer.

Cortes que preservam a identidade:

Lançar com menos regiões e expandir depois.

Usar animações compartilhadas.

Reduzir variedade de culturas e construções.

Priorizar dois NPCs profundamente implementados no vertical slice.

Adiar dublagem integral.

Adiar servidores dedicados.

Evitar mundo aberto contínuo gigantesco.

Não cortar: agricultura satisfatória, construção funcional, personagens com rotina, pistas ambientais, salvamento seguro e desempenho aceitável.

10. LANÇAMENTO, STEAM, MARKETING E NEGÓCIO

Prioridade alta — planejar cedo, executar depois da validação

Por que falta?

Ainda não existe uma definição comercial: público-alvo, preço, estratégia de lançamento, idiomas, demonstração, divulgação, suporte ou expectativa de vendas.

Um jogo pode estar tecnicamente pronto e não encontrar público.

Também pode atrair atenção cedo demais, prometer funcionalidades que não consegue entregar e perder credibilidade.

O principal produto a vender não é a quantidade de sistemas. É uma experiência clara.

Tudo que precisa ser decidido e feito

Posicionamento: Néria é principalmente fazenda aconchegante, sobrevivência cooperativa, RPG romântico ou mistério? A comunicação precisa estabelecer uma hierarquia.

Público-alvo: jogadores de Stardew Valley, My Time at Sandrock, Sun Haven e RPGs de exploração, sem prometer ser igual a eles.

Identidade visual: logotipo, tipografia, paleta, arte principal e capturas consistentes.

Nome comercial: verificar disponibilidade de marca, domínio, redes sociais e possíveis conflitos.

Página Steam: descrição, tags, imagens, trailer, requisitos e idiomas.

Preço: posicionamento perante jogos independentes semelhantes e poder de compra brasileiro.

Modelo comercial: compra única, acesso antecipado, expansões ou conteúdo gratuito.

Demo: duração, sistemas incluídos e ponto de encerramento.

Trailer: mostrar gameplay real, não apenas cenas bonitas.

Marketing de desenvolvimento: vídeos curtos de plantação, construção, NPCs, clima e exploração.

Comunidade: canal de comunicação, atualizações e coleta de feedback.

Localização: português brasileiro nativo e tradução planejada.

Requisitos mínimos: definidos por benchmark, não por estimativa otimista.


