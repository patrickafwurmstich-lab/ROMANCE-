# Lista v2 do ChatGPT (loop de produção, volta 2): texto bruto, parte 1

> A parte 2 (cronograma de 6 meses solo/dupla, orçamento e autoavaliação) está resumida em `O-QUE-FALTA.md` v2.


SOB O CÉU DE NÉRIA

Plano de Produção V2.0 — Godot 4 | Formiguinha Açucarada

Função: especificação de pré-produção, implementação e controle de escopo.
Horizonte de planejamento: 12 semanas para a prova técnica; 6 meses para avaliar o primeiro vertical slice.
Hardware de referência: Acer Aspire 3, Ryzen 5 3500U, 8 GB RAM, GPU integrada.

Parecer inicial

A crítica ao cronograma anterior procede. A estimativa de 24–42 meses não foi derivada da capacidade real de produção. Ela misturou uma visão de jogo completo com a capacidade de uma microequipe e, portanto, não servia como compromisso operacional.

A V2 corrige isso com orçamento de horas, entregáveis verificáveis, limites de escopo e decisões de continuidade ou cancelamento.

Há uma distinção indispensável:

Protótipo funcional: demonstra que o jogo roda e que os sistemas principais podem ser implementados.

Vertical slice: demonstra um trecho pequeno, mas integrado e representativo da experiência pretendida.

Jogo comercial: exige conteúdo, estabilidade, acessibilidade, testes, distribuição e suporte.

Em seis meses, com 15 ou 30 horas semanais somadas, não é responsável prometer um jogo comercial completo com seis biomas, doze romances e quatro jogadores online.

É possível, porém, produzir uma base tecnicamente verificável e, no cenário de dupla, buscar um vertical slice reduzido.

Cânone de produção aprovado

Decisão

Estado

Engine

Godot 4

Renderização

A selecionar por benchmark entre Mobile e Compatibility; Forward+ somente se comprovadamente viável

Área inicial

Mata das Raízes Altas e entrada do Vale da Água Clara

NPCs do primeiro ano

Marina, Augusto e Elias

Outros nove NPCs

Desaparecidos em outras regiões; introduzidos posteriormente

Multiplayer inicial

Dois jogadores em rede local

Multiplayer futuro

Até quatro jogadores online

Meta de desempenho

30 FPS médios e 1% low acima de 24 FPS em 720p

Meta inicial de entrega

Prova técnica em 12 semanas

Meta de seis meses

Protótipo integrado ou vertical slice reduzido, conforme horas disponíveis

Uma ressalva narrativa importante: os nove NPCs ausentes não podem aparecer nas cenas iniciais e depois simplesmente desaparecer por conveniência. O prólogo jogável do primeiro ano precisa ser uma versão específica, compatível com a bíblia completa. A ausência dos nove deve ser estabelecida por pistas, buscas e registros, sem afirmar que o protagonista já os encontrou.

1. ENGINE, ARQUITETURA E DESEMPENHO
Prioridade crítica — ordem 1
Por que falta?

A engine está decidida, mas a arquitetura interna não.

Escolher Godot 4 não resolve automaticamente renderização, VRM, persistência, física, vegetação, carregamento, rede e otimização.

Consequência de ignorar: uma cena que funciona isoladamente pode consumir toda a memória quando receber personagens, UI, inventário e salvamento. Refazer a arquitetura depois de seis meses pode custar mais do que o protótipo inteiro.

Decisões e tarefas concretas

Fixar a versão exata do Godot 4. Escolher uma versão estável, registrar o número no repositório e atualizar somente após testar compatibilidade dos addons.

Testar os renderizadores. Executar o benchmark em Mobile e Compatibility, com mesma resolução e cena. Forward+ entra apenas como comparação opcional.

Estabelecer a resolução de referência. 1280 × 720, escala de renderização ajustável e limite configurável de FPS.

Manter o benchmark da clareira como cena permanente. Não substituir a cena de teste a cada mudança visual.

Separar sistemas globais. Usar Autoloads somente para serviços realmente globais, como GameClock, SaveManager e EventBus.

Criar arquitetura baseada em dados. Resource para definições de culturas, itens, receitas e NPCs; estados persistentes separados dessas definições.

Definir IDs persistentes. Cada construção, baú, canteiro, NPC e item único deve possuir identificador estável.

Criar ferramenta de medição. Registrar FPS médio, 1% low, RAM, tempo de carregamento, objetos ativos e draw calls.

Definir orçamento de renderização. Controlar materiais, transparências, luzes, sombras e instâncias.

Implementar LOD e culling. Usar GeometryInstance3D com faixas de visibilidade, MultiMeshInstance3D para vegetação repetida e ocultação de setores.

Configurar física em camadas. Jogador, terreno, ferramentas, construções, fauna e objetos interativos.

Criar política de logs. Mensagens de depuração separadas de erros reais; logs persistentes para falhas de save.

Automatizar verificações de importação. Assets com materiais inválidos, texturas grandes ou escala errada devem ser sinalizados.

Definir exportação Windows. Criar builds fora do editor desde a primeira semana.

Criar testes de regressão. Testar serialização, crescimento de culturas, inventário e carregamento.

Registrar versões de dependências. Godot, addons, importadores VRM e formatos de arquivos devem ter versão documentada.

Arquitetura proposta
Separação entre cenas, sistemas e definições de dados. O host de rede deve validar as mudanças persistentes, não a interface do jogador.
Estrutura inicial de pastas
Texto simples
res://
├── core/
│ ├── game_clock.gd
│ ├── event_bus.gd
│ ├── save_manager.gd
│ └── network_session.gd
├── data/
│ ├── items/
│ ├── crops/
│ ├── recipes/
│ └── npcs/
├── scenes/
│ ├── world/
│ ├── player/
│ ├── npcs/
│ ├── farming/
│ ├── building/
│ └── ui/
├── assets/
│ ├── characters/
│ ├── environment/
│ ├── animations/
│ └── audio/
├── addons/
├── tests/
└── tools/
Orçamento técnico inicial

Métrica

Alvo

Limite de atenção

FPS médio

≥30

Abaixo de 30

1% low

>24

≤24

Resolução

720p

Não reduzir abaixo sem reavaliar o estilo

RAM do processo do jogo

≤2,0 GB desejável

Acima de 2,5 GB

Draw calls de cena principal

150–300 desejáveis

Acima de 450 exige investigação

Triângulos visíveis

150 mil–350 mil desejáveis

Acima de 500 mil exige medição

Luzes com sombras

1

Mais de 1 requer justificativa

NPCs ativos na primeira área

3

Não simular os nove ausentes

SpringBone

30 Hz

Desativável em qualidade baixa

LOD de árvores

Iniciar em 25 m

Ajustar pelo benchmark

Os orçamentos de draw calls e triângulos são tetos exploratórios, não limites universais do Ryzen. Transparência, overdraw, materiais, CPU e driver podem ser mais importantes que a contagem bruta.

Vegetação

Usar MultiMeshInstance3D para gramíneas, arbustos decorativos e árvores repetidas quando compatível com o sistema de interação.

Árvores cortáveis precisam de estado próprio. Uma solução é representar visualmente árvores distantes por instâncias agrupadas e ativar uma cena interativa individual quando o jogador se aproxima.

Não usar MultiMeshInstance3D como se cada instância possuísse automaticamente física e identidade persistente independente.

Materiais

Preferir texturas atlas e materiais compartilhados.

Evitar sombra dinâmica nas folhas.

Usar sombras no tronco e iluminação simplificada na copa, conforme resultado visual.

Oculação, distância de visibilidade e LOD devem ser testados juntos.

Risco específico do notebook

Os 8 GB são compartilhados entre sistema, editor e GPU integrada. Rodar editor, navegador, Blender, VRoid e duas instâncias do jogo simultaneamente pode exceder a memória disponível.

Corte: fechar ferramentas durante benchmarks, testar builds exportadas e usar uma segunda máquina quando possível para rede local.

Critério de pronto

O tópico 1 estará pronto para o início da produção quando:

A mesma cena for executada em build Windows.

O renderizador estiver escolhido com resultados registrados.

FPS médio ≥30 e 1% low >24 no notebook.

A cena incluir pelo menos um VRM animado, vegetação, água simples, construções e UI.

O projeto abrir em outra máquina a partir do repositório.

Um teste de save/load funcionar após reiniciar o executável.

A build não depender de arquivos presentes apenas na máquina do autor.

Entrega: relatório de benchmark + build reproduzível + arquitetura-base aprovada.

2. PRODUÇÃO, ESCOPO E CONTROLE DE ENTREGA
Prioridade crítica — ordem 2
Por que falta?

O projeto possui muitas ideias, mas precisa de um sistema que impeça expansão descontrolada.

A decisão do primeiro ano reduz corretamente o escopo para um bioma inicial e três NPCs. Porém, isso ainda é muito trabalho se cada NPC receber todas as animações, rotinas, romances e cenas planejadas.

Consequência de ignorar: a equipe passa meses produzindo conteúdo incompleto, sem saber se existe um jogo funcional.

Tarefas obrigatórias

Nomear o responsável final pelo escopo. Uma pessoa precisa ter autoridade para recusar novas funcionalidades.

Criar contrato entre sócios. Definir participação, propriedade intelectual, decisões, saída de sócios e uso de assets.

Definir disponibilidade semanal real. Horas produtivas, reuniões, testes e documentação contam no orçamento.

Estabelecer limite contra burnout. Não compensar atrasos sistematicamente com noites e fins de semana.

Criar backlog único. Cada tarefa precisa de responsável, estimativa, dependência e critério de aceitação.

Definir o que é pronto. Código compilando não basta: precisa funcionar em build, salvar e não quebrar testes anteriores.

Criar build semanal. Toda semana termina com uma versão executável ou um registro claro de impedimento.

Usar Git e Git LFS. Binários grandes em LFS, código e arquivos textuais no Git.

Criar backup offline. Pelo menos uma cópia externa ao repositório remoto.

Separar protótipo de produção artística. Assets temporários são permitidos e devem ser identificados.

Controlar licenças. Registrar origem, licença e restrições de VRM, plugins, texturas, fontes e músicas.

Criar registro de riscos. Probabilidade, impacto, responsável e plano de contingência.

Criar ferramenta de debug de save. Visualizar IDs, versão, número de objetos e erros de serialização.

Criar testes automatizados mínimos. Plantio, crescimento, colheita, inventário, salvamento e duplicação.

Criar simulador de safra. Executar centenas de dias virtuais sem renderizar o mundo.

Definir política de conteúdo do jogador. Nomes, mensagens, construções, denúncias e eventuais conteúdos compartilhados.

Definir telemetria mínima. Preferencialmente local e opt-in para envio de diagnósticos; não coletar dados pessoais desnecessários.

Definir processo de go/no-go. O que fazer quando uma meta falha?

Registrar decisões técnicas. Uma decisão aprovada não deve ser reaberta por preferência estética sem evidência.

Planejar classificação indicativa e requisitos legais. Não deixar isso para a semana de lançamento.

Regra de trabalho

Uma tarefa só é considerada concluída quando passa por:

Implementação → teste local → teste de regressão → build exportada → aprovação

Limite de trabalho em andamento

Para uma pessoa: no máximo uma tarefa principal e uma pequena correção paralela.

Para duas pessoas: no máximo duas tarefas principais, evitando que ambas modifiquem simultaneamente os mesmos sistemas centrais.

Cronograma obrigatório de 12 semanas

Semana

Entrega

Critério verificável

1

Benchmark da clareira

FPS médio, 1% low e RAM registrados

2

Git, LFS, pastas e backups

Projeto restaurável em outro diretório

3

Movimento, câmera e interação

Jogador alcança e usa 10 objetos

4

Inventário, 3 recursos e save/load

IDs únicos e 3 backups funcionais

5

Solo e plantio

Preparar e semear 16 células

6

Crescimento e colheita

Ciclo completo sem duplicar itens

7

Canteiro, baú e abrigo

Construir, desmontar e salvar

8

Dia/noite, energia e descanso

Tempo e energia persistem corretamente

9

Marina com rotina e falas

15 falas contextuais e agenda simples

10

Pista ambiental

Descoberta integrada ao cultivo

11

Otimização

Meta de FPS medida novamente

12

Teste com 2 jogadores + decisão

Rede local mínima e go/no-go documentado

Correção de planejamento: essa tabela é um plano de sequência, não garantia de conclusão para uma pessoa com 15 horas semanais. Na seção de cronograma de seis meses, as entregas são ajustadas por capacidade.

Escopo do primeiro ano

Dentro: região inicial, Marina, Augusto, Elias, fazenda, construção, inventário, clima básico, pistas ambientais, rotina de NPCs, salvamento e multiplayer local para dois.

Fora: nove NPCs restantes, seis biomas completos, quatro jogadores online, finais completos, casamento de todas as rotas, dublagem integral e grandes sistemas de combate.

Riscos

O principal risco é a equipe considerar cada nova ideia pequena.

Uma receita adicional exige dados, ícone, ingredientes, balanceamento, UI, save, testes e possivelmente animação.

Um NPC adicional exige modelo, materiais, animações, agenda, navegação, diálogos, estados sociais e testes.

Corte: qualquer funcionalidade nova precisa substituir outra de esforço equivalente ou entrar numa versão posterior.

Critério de pronto

Backlog priorizado e estimado.

Responsáveis definidos.

Build semanal durante quatro semanas consecutivas.

Backup remoto e offline testados por restauração.

Nenhuma tarefa marcada como pronta sem critério de aceitação.

Riscos críticos registrados.

Cronograma compatível com horas disponíveis.

Uma pessoa autorizada a dizer não a mudanças de escopo.

3. GAME FEEL E CICLO CENTRAL DE JOGO

Prioridade crítica — ordem 3

Por que falta?

A versão anterior definiu ações, mas não suficientemente como elas devem parecer, responder e se conectar.

É possível programar uma enxada que altera uma célula de solo e ainda assim produzir uma experiência ruim: atraso no clique, animação longa, impacto sem som e falta de indicação da célula atingida.

O game feel não é apenas acabamento. É a qualidade da resposta entre comando, ação e consequência.

Tarefas concretas

Definir câmera. Terceira pessoa elevada, com distância de 6–9 m e inclinação inicial de 35–50 graus, sujeitas a teste.

Definir velocidade. Caminhada inicial de 3,5 m/s e corrida de 5,5 m/s.

Definir aceleração. Aproximadamente 10–16 m/s² para iniciar movimento; desaceleração ajustada para não parecer deslizamento.

Definir alcance de interação. Começar com 2,2 m.

Criar indicador de alvo. Um quadrado projetado no chão mostra a célula que será afetada.

Implementar grid snapping. Canteiros e construções simples encaixam numa grade de 1 m.

Criar feedback de ferramenta. Animação, impacto, som, partículas e alteração visível do objeto.

Testar hitstop. Pausa visual de aproximadamente 0,04 s em impactos relevantes, sem congelar relógio, rede ou simulação autoritativa.

Criar tremor de câmera configurável. Deslocamento discreto de 0,02–0,05 m, com opção de desligar.

Criar partículas leves. Terra ao cavar, madeira ao cortar e pequenas folhas na colheita.

Criar áudio satisfatório de colheita. Sons curtos, suaves e distintos por categoria.

Definir duração de animações. Enxada e colheita devem ser rápidas o suficiente para tarefas repetidas.

Definir cancelamento. O jogador pode cancelar ações antes do momento de impacto, sem consumir energia.

Definir energia. Um dia deve permitir aproximadamente 15–20 ações de trabalho pesado sem alimentação adicional.

Criar recuperação. Frutas silvestres e descanso recuperam energia, sem tornar a comida obrigatória a cada minuto.

Definir culinária mínima. Dois ingredientes podem produzir um caldo que concede o efeito temporário Corpo Quente.

Criar pesca com tensão de linha. A dificuldade vem do controle, não de uma barra aleatória impossível de prever.

Criar decoração funcional. Objetos como relógio parado, gravador e móveis podem ser colocados na cabana.

Criar museu ou sala de memória. Inicialmente um espaço simples onde o jogador expõe objetos históricos encontrados.

Criar conquistas silenciosas. Reconhecimentos discretos, sem interromper cenas emocionais.

Testar ritmo do relógio. O tempo local deve permitir trabalho, exploração e conversa sem pressa constante.

Definir sono multiplayer. Dormir não pode avançar o mundo enquanto outro jogador está realizando uma ação crítica.

Números iniciais de interação

Ação

Duração real proposta

Energia

Preparar solo

0,65 s

4

Plantar semente

0,45 s

1

Regar célula

0,55 s

2

Colher

0,50 s

1

Cortar árvore — golpe

0,75 s

5

Minerar pedra — golpe

0,80 s

5

Construir peça simples

0,80 s

3

Pescar — tentativa

20–50 s

6

Cozinhar caldo

2,0 s de interação

2

Os custos são por ação concluída. Um golpe de machado não equivale necessariamente a uma árvore inteira.

Energia diária

Proposta: 100 pontos após descanso completo.

Um dia de trabalho agrícola poderia incluir:

6 preparações de solo: 24 energia.

6 plantios: 6 energia.

6 regas: 12 energia.

4 colheitas: 4 energia.

Total: 46 energia em 22 interações, incluindo ações leves.

Isso mostra por que a meta de 15–20 ações/dia precisa ser interpretada como ações pesadas equivalentes, não como limite rígido de cliques. Caso contrário, plantar uma horta pequena já consumiria o dia inteiro.

Fruta silvestre: recuperar 12 energia, com limite de recuperação alimentar diária para evitar exploração.

Caldo Corpo Quente: recuperar 15 energia e reduzir penalidade de frio por 6 minutos reais, sem curar doenças.

Relógio de Néria

Um dia local possui 27h12.

A duração real de um dia é decisão de design, não conversão física obrigatória.

Proposta para teste: 36 minutos reais por dia local.

Evento

Tempo real aproximado

Um dia completo

36 min

Uma estação de 98 dias

58,8 h

Um ano de 390 dias

234 h

Isso seria excessivamente lento para eventos que dependam de várias estações.

Correção recomendada: usar avanço de tempo por sono e permitir atividades que acelerem períodos sem exigir espera real. Testar também dias de 24 minutos.

Não fechar 36 minutos antes de observar jogadores cultivando, construindo e explorando.

Loop dos primeiros 15 minutos

Tempo real

Experiência

0–2 min

Acordar, mover, observar o relógio

2–4 min

Encontrar madeira e fibra

4–6 min

Fabricar ferramenta improvisada

6–9 min

Preparar e plantar canteiro

9–12 min

Construir abrigo simples

12–15 min

Conversar com Marina e encontrar vestígio da colônia

A primeira colheita não precisa ocorrer nesses quinze minutos. O jogador deve perceber progresso antes dela.

Riscos e cortes

Risco: excesso de efeitos causa travamentos e torna ações lentas.

Corte: um efeito de impacto bem executado por ferramenta, poucas partículas, áudio reutilizável e animações compartilhadas.

O hitstop não deve pausar a simulação global nem bloquear outros jogadores. Deve ser implementado como efeito local de animação/câmera, com duração configurável.

Critério de pronto

Em teste com pelo menos cinco pessoas que não participaram do desenvolvimento:

Todas conseguem plantar e colher sem explicação verbal do desenvolvedor.

Pelo menos quatro identificam corretamente a célula-alvo.

Nenhuma ação comum apresenta atraso perceptível recorrente.

A maioria considera a coleta satisfatória após dez repetições.

O jogo mantém a meta de FPS durante plantio, colheita e construção.

Energia e tempo não impedem o primeiro abrigo.

O jogador consegue interromper uma ação sem perder recursos indevidamente.

4. MULTIPLAYER, AUTORIDADE E SALVAMENTOS

Prioridade crítica — ordem 4

Por que falta?

O primeiro objetivo é dois jogadores em rede local, mas os sistemas precisam nascer preparados para quatro jogadores online no futuro.

Isso exige separar ações solicitadas pelo cliente de alterações confirmadas pelo host.

O maior risco é duplicar recursos ou corromper salvamentos durante desconexões.

Tarefas concretas

Usar ENetMultiplayerPeer para a primeira implementação LAN.

Definir host autoritativo. O host controla recursos, plantações, NPCs, relógio e estados persistentes.

Criar NetworkSession. Gerenciar criação de partida, conexão, desconexão e identificação dos participantes.

Usar MultiplayerSpawner. Replicar criação e remoção de jogadores e objetos de rede apropriados.

Usar MultiplayerSynchronizer. Sincronizar propriedades selecionadas, evitando replicar todo o estado indiscriminadamente.

Definir RPCs. Pedidos de plantar, colher, construir e transferir itens devem ser validados pelo host.

Criar IDs persistentes. Um objeto não pode depender somente de seu caminho na árvore de cenas.

Criar operações atômicas. Colher planta, retirar item e colocar construção precisam confirmar uma única alteração.

Criar proteção contra repetição. Cada comando crítico recebe um identificador de operação para impedir processamento duplicado.

Criar formato de save versionado. Incluir versão de esquema, data, identificador do mundo e checksum quando apropriado.

Criar escrita segura. Salvar em arquivo temporário, validar e substituir o arquivo principal mantendo backups.

Manter três backups rotativos. Não sobrescrever todos durante uma sessão corrompida.

Criar ferramenta de inspeção de save. Listar objetos, IDs, recursos e estados de NPCs.

Definir reconexão. Jogador retorna com inventário e estado corretos.

Definir avanço do tempo. Inicialmente, todos os jogadores ativos precisam aceitar dormir.

Definir propriedade de objetos. Baús privados, comunitários e permissões de construção.

Definir eventos pessoais. Romance e destino individual exigem presença e consentimento.

Criar logs de rede. Registrar pedidos rejeitados, divergências e desconexões.

Testar perda de pacotes. Não apenas conexão perfeita na mesma máquina.

Separar LAN de internet. Não prometer conexão online futura sem solução de NAT, relay ou integração de plataforma.

Exemplo: colheita sem duplicação
Texto simples
Cliente A solicita colher planta #104
Cliente B solicita colher planta #104

Host:
verifica planta #104
confirma maturidade
aceita primeira operação válida
altera estado para "colhida"
adiciona rendimento ao inventário autorizado
rejeita segunda operação

Host replica o resultado.

O cliente não deve adicionar o item localmente como resultado definitivo antes da confirmação.

Estrutura de save proposta
Texto simples
save/
├── manifest.json
├── world.json
├── players.json
├── npcs.json
├── narrative.json
└── backups/
├── backup_01/
├── backup_02/
└── backup_03/

Para o MVP, JSON facilita inspeção. Em versões maiores, pode ser substituído por formato binário ou banco local se houver justificativa de desempenho e integridade.

Campos obrigatórios

Mundo: dia, estação, clima, objetos, plantas e construções.

Jogador: ID, inventário, posição, energia e descobertas pessoais.

NPC: ID, agenda, posição, disponibilidade e estados sociais.

Narrativa: eventos concluídos, pistas e decisões.

Testes de regressão

Teste

Aceitação

Dois jogadores colhem a mesma planta

Um único rendimento concedido

Dois jogadores retiram o último item do baú

Apenas uma retirada

Host fecha durante save

Backup anterior recuperável

Jogador reconecta

Inventário e posição consistentes

Construção é removida e save carregado

Não reaparece indevidamente

Jogador desconecta durante evento pessoal

Evento não avança automaticamente

Arquivo de save tem versão antiga

Migração ou erro explicativo

Comando duplicado é reenviado

Não duplica recompensa

Números iniciais

Parâmetro

Proposta

Jogadores no teste

2

Transporte

ENet em LAN

Simulação autoritativa

20 ticks/s para lógica de rede relevante

Replicação de movimento

10–20 Hz, com interpolação

Autosave

10 minutos reais

Backups

3

Teste de latência

0, 100 e 200 ms simulados

Perda de pacotes simulada

1%, 3% e 5%

Reconexão

Sem perda ou duplicação de itens

Risco e corte

Risco: tentar implementar matchmaking, Steam networking, host migration e quatro jogadores online antes de a LAN funcionar.

Corte: LAN com dois jogadores, sem migração de host, sem servidor dedicado e sem voz integrada.

Critério de pronto

Duas instâncias conectadas em máquinas diferentes.

Ambos conseguem andar, plantar, colher e construir.

O host valida todas as alterações persistentes.

Nenhum item duplica em 100 tentativas simultâneas automatizadas.

Save/load preserva o mundo após encerrar ambas as instâncias.

Reconexão funciona em pelo menos dez ciclos consecutivos.

Desconexão durante save não destrói o último estado íntegro.

5. PIPELINE VRM, PERSONAGENS E ANIMAÇÃO NO GODOT

Prioridade alta — ordem 5

Por que falta?

O VRoid Studio facilita a criação visual de personagens, mas os modelos exportados podem possuir excesso de materiais, cabelo complexo, transparências, ossos secundários e configurações incompatíveis com a renderização escolhida.

O objetivo não é apenas importar Marina, Augusto e Elias. É criar um pipeline repetível para os outros nove personagens no futuro.

Pipeline obrigatório, passo a passo

1. VRoid Studio — modelo original

Criar o personagem, padronizar proporções, reduzir acessórios e evitar cabelo com excesso de mechas.

2. Exportação VRM

Exportar em versão compatível com o addon escolhido. Registrar versão, licença, autor e restrições de uso.

3. Otimização

Reduzir geometria, materiais, texturas e ossos secundários. Se usar Blender, validar um importador/exportador VRM compatível para não perder metadados e expressões.

4. Atlas e materiais

Consolidar materiais quando possível, preservar expressões faciais e verificar transparência de cabelo e olhos.

5. Importação no Godot

Instalar uma versão compatível do addon godot-vrm, importar e verificar rig, escala, materiais, expressões e física secundária.

6. MToon e iluminação

Testar o material MToon fornecido ou suportado pelo pipeline. Verificar comportamento no renderizador escolhido; não presumir paridade visual entre Mobile e Compatibility.

7. Animação e SpringBone

Retargeting de animações humanoides, ajuste de ferramentas e simulação reduzida de cabelo a 30 Hz.

8. LOD e validação

Criar versões de menor custo, medir draw calls e testar três personagens simultaneamente na clareira.

Metas técnicas por personagem

Elemento

LOD0 — próximo

LOD1 — médio

LOD2 — distante

Triângulos

12 mil–18 mil

6 mil–9 mil

2 mil–4 mil

Materiais

3–5

2–3

1–2

Textura principal

1024²

512²–1024²

512²

Ossos deformadores

Até ~75, conforme rig

Preferir mesmo rig

Simplificar se viável

Ossos secundários simulados

8–16

0–8

0

Expressões faciais

Completas

Reduzidas

Desativadas

Sombras

Conforme orçamento

Simplificadas

Desativadas quando apropriado

Atenção: LOD de personagem não deve ser implementado simplesmente removendo ossos de uma malha existente. Isso pode quebrar skinning e animações. É preciso exportar versões válidas e testar a compatibilidade.

Personagens do primeiro ano

Personagem

Função jogável

Animações prioritárias

Marina

Agricultura

Andar, cavar, plantar, regar, colher, conversar

Augusto

Construção e manutenção

Andar, martelar, carregar, reparar, lubrificar moinho

Elias

Mistério e estação agrícola

Andar com limitação no joelho, pescar, cuidar da calha, sentar, tossir

A lesão de Elias não pode ser representada apenas por uma velocidade menor. Precisa de animação de marcha própria, mas sem caricatura.

Tarefas adicionais

Criar cena-base VRMCharacter.

Padronizar altura e escala dos modelos.

Validar esqueleto humanoide.

Criar biblioteca compartilhada de animações.

Criar sistema de encaixe de ferramentas na mão.

Criar controlador de expressões.

Criar rotina simples por horário.

Criar navegação com NavigationAgent3D.

Reconstruir ou atualizar navegação quando construções bloquearem caminhos.

Criar sistema de diálogo por eventos.

Criar estados de relação independentes de pontos visíveis.

Criar ferramenta de depuração de NPC.

Criar exportação de LOD.

Criar relatório de materiais e draw calls por personagem.

Registrar licença e origem de cada asset.

Testar personagens simultâneos em build exportada.

Falas contextuais mínimas

Cada um dos três NPCs deve possuir pelo menos 15 falas de contexto, não quinze variações genéricas de cumprimento.

Exemplo de distribuição:

Contexto

Quantidade por NPC

Cumprimento conforme horário

3

Trabalho

3

Clima

2

Falta de recursos

2

Evento narrativo

2

Estado social

2

Despedida

1

Total

15

Marina comenta solo, colheita e chuva.

Augusto comenta ferramentas, construções e moinho.

Elias fala pouco e pode recusar conversa. Suas quinze falas não precisam estar disponíveis desde o primeiro encontro.

Risco e corte

Risco: gastar semanas ajustando cabelo, roupa e rosto antes de validar movimento e animação.

Corte: um modelo-base funcional primeiro; depois Marina, Augusto e Elias com materiais simplificados. Adiar troca de roupa, física de acessórios e personalização avançada.

Critério de pronto

Três VRMs importados sem erros críticos.

Todos utilizam animações compartilhadas quando apropriado.

Materiais funcionam no renderizador escolhido.

SpringBone pode ser desligado sem quebrar o personagem.

LOD muda sem desaparecimentos ou deformações graves.

Três NPCs e um jogador mantêm a meta de desempenho.

Cada NPC executa uma rotina de trabalho e uma conversa contextual.

O pipeline está documentado de modo que um quarto personagem possa ser produzido sem inventar um processo novo.

6. ECONOMIA, AGRICULTURA E PROGRESSÃO

Prioridade crítica — ordem 6

Por que falta?

A versão anterior apresentava rendimentos e custos, mas não demonstrava que a produção alimentaria o jogador e os três NPCs.

O sistema precisa ser fechado matematicamente antes de virar dezenas de receitas.

Também é necessário distinguir economia do assentamento de consumo individual. Não é viável simular cada refeição de cada NPC com a mesma complexidade do jogador.

Modelo econômico proposto para o MVP

Quatro pessoas: protagonista, Marina, Augusto e Elias.

Ressalva narrativa: Elias inicialmente vive separado. Para o simulador econômico, seu consumo é contabilizado como demanda equivalente, mas sua comida não sai automaticamente do depósito do jogador. A estação agrícola de Elias possui estoque próprio até que haja integração voluntária.

Duas culturas iniciais

Cultura

Crescimento

Custo de semente

Rendimento bruto

Reserva para replantio

Alimento líquido

Raiz-de-mel

4 dias locais

1 semente

3 raízes

1 raiz convertível em semente

2 porções

Grão-solar

6 dias locais

1 semente

5 grãos

1 grão convertido em semente

4 porções

Para simplificar o MVP, cada raiz ou grão consumível vale uma porção alimentar. Isso não representa equivalência nutricional real; é uma unidade abstrata de balanceamento.

Consumo diário

Pessoa

Porções/dia

Jogador

2

Marina

2

Augusto

2

Elias

2

Total

8

O consumo de oito porções/dia é a demanda-alvo da simulação. Os NPCs não precisam executar oito animações de refeição para isso.

Planilha econômica — regime permanente

Plantio inicial: 16 células de raiz-de-mel e 12 de grão-solar.

Indicador

Raiz-de-mel

Grão-solar

Total

Células

16

12

28

Ciclo de crescimento

4 dias

6 dias

—

Rendimento bruto por ciclo

48

60

—

Reserva para replantio por ciclo

16

12

—

Porções líquidas por ciclo

32

48

—

Produção líquida média/dia

8

8

16

Consumo comunitário/dia

—

—

8

Excedente médio/dia

—

—

8

Resultado: a produção proposta é o dobro do consumo, antes de perdas, cozimento e conservação.

Isso é deliberadamente folgado para um MVP, mas pode tornar a sobrevivência trivial.

Ajuste recomendado para o teste

Reduzir a área cultivada para 8 células de raiz-de-mel e 6 de grão-solar.

Indicador

Raiz-de-mel

Grão-solar

Total

Células

8

6

14

Porções líquidas por ciclo

16

24

—

Produção líquida média/dia

4

4

8

Consumo diário

—

—

8

Excedente médio

—

—

0

Esse segundo cenário fecha exatamente em regime permanente, sem margem para perdas.

Por isso, o assentamento precisa começar com estoque de segurança e permitir expansão gradual.

Estoque inicial e primeira colheita

Proposta:

Estoque comunitário inicial: 48 porções.

Consumo: 8 porções/dia.

Autonomia sem produção: 6 dias.

Primeira colheita de raiz-de-mel: dia 4.

Primeira colheita de grão-solar: dia 6.

Com plantio simultâneo no dia zero:

Dia

Estoque inicial

Consumo

Colheita líquida

Estoque final

1

48

8

0

40

2

40

8

0

32

3

32

8

0

24

4

24

8

16

32

5

32

8

0

24

6

24

8

24

40

7

40

8

0

32

8

32

8

16

40

9

40

8

0

32

10

32

8

0

24

11

24

8

0

16

12

16

8

40

48

A tabela assume replantio imediato, sem perdas, e que a produção está disponível no mesmo dia da colheita.

Importante: o estoque inicial de 48 porções não pode aparecer magicamente no prólogo. Para preservar a história, o simulador econômico completo deve começar após a comunidade estabelecer seu primeiro depósito. Antes disso, há coleta, racionamento e contribuição de estoques pessoais, incluindo o de Elias separadamente.

Energia e agricultura

A proposta anterior de 100 energia/dia não permite manter sozinho 14 células com rega diária e ainda explorar confortavelmente.

É preciso corrigir isso.

Custo de implantação

Trabalho

Quantidade

Energia por ação

Total

Preparar 14 células

14

4

56

Plantar 14 sementes

14

1

14

Total

70

O jogador consegue implantar a horta em um dia, mas quase não sobra energia para construção.

Isso é aceitável se Marina ajudar e se a implantação for distribuída em dois dias.

Manutenção diária

Regar 14 células manualmente custaria 28 energia/dia.

Proposta: chuva natural pode suprir água e um regador melhorado irriga quatro células por ação, custando 4 energia.

Com irrigação melhorada, 14 células exigem quatro ações e 16 energia.

A progressão da ferramenta produz ganho real de qualidade de vida.

Construções e custos

Construção

Madeira

Pedra

Fibra

Tempo de montagem

Canteiro de 1 célula

0

0

0

0,65 s para preparar solo

Baú

8

0

0

3 s

Abrigo 3 × 3 m

20

0

10

12 s

Fogueira

5

6

0

4 s

Total inicial

33

6

10

—

O tempo de montagem é tempo de interação, não tempo de coleta.

Tarefas obrigatórias adicionais

Criar CropDefinition como Resource.

Criar ItemDefinition.

Criar RecipeDefinition.

Criar simulador de safra sem renderização.

Testar 30, 90 e 390 dias locais.

Simular chuva, perdas e atraso de plantio.

Simular um jogador que não cultiva.

Simular dois jogadores cultivando juntos.

Testar estoque mínimo e máximo.

Impedir comida negativa.

Impedir duplicação de sementes.

Separar estoques pessoais e comunitários.

Criar recuperação de recursos ao desmontar.

Criar culinária simples: raiz-de-mel + grão-solar = caldo.

Criar buff Corpo Quente com duração definida.

Definir deterioração simples.

Definir limites de empilhamento.

Criar testes para saves de planta em crescimento.

Risco e corte

Risco: transformar agricultura num simulador agronômico excessivamente complexo.

Corte: duas culturas, umidade simples, fertilidade simplificada, sem nutrientes individuais e sem genética de sementes.

Critério de pronto

Simulação de 90 dias sem estoque negativo por erro de cálculo.

Consumo e produção rastreáveis.

Plantio, crescimento e colheita persistem após save/load.

Nenhuma semente ou alimento duplica.

A horta mínima de 14 células sustenta quatro pessoas em regime permanente sem perdas.

Eventos de perda mostram necessidade de estoque de segurança.

O jogador consegue construir os quatro objetos iniciais sem bloqueio de recursos raros.

7. INTERFACE, CONTROLES E FERRAMENTAS DE NARRATIVA

Prioridade alta — ordem 7

Por que falta?

A bíblia proíbe barras de afeto e marcadores artificiais de investigação. Porém, isso não dispensa uma interface clara.

O jogador precisa compreender o funcionamento da fazenda e da construção sem receber informações que seu personagem não conhece.

Além disso, diálogos, relações e diário precisam ser dirigidos por dados, não por dezenas de condições espalhadas em scripts.

Tarefas concretas

Criar CanvasLayer para HUD e menus.

Criar HUD adaptável a 720p.

Criar inventário com Control, GridContainer, TextureRect e componentes reutilizáveis.

Criar barra rápida de ferramentas.

Criar indicador de célula-alvo no mundo 3D.

Criar menu de construção com custos e prévia.

Criar sistema de diálogo baseado em dados.

Criar condições de diálogo: clima, horário, confiança, eventos e trabalho.

Criar diário factual com entradas por evento.

Criar menu de pausa.

Criar tela de save/load.

Criar configurações gráficas e de áudio.

Criar remapeamento de controles.

Criar escala de interface.

Criar sistema de localização com chaves desde o primeiro dia.

Criar suporte a teclado e mouse.

Preparar navegação por controle, mesmo que não seja implementada integralmente no MVP.

Criar mensagens de erro compreensíveis.

Criar ferramenta de debug de diálogo.

Criar ferramenta de inspeção de estados de relação.

Wireframes textuais do MVP
Tela 1 — HUD
Texto simples
┌────────────────────────────────────────────────────────┐
│ DIA 08 • BROTAÇÃO 07:40 • Céu nublado │
│ │
│ │
│ [MUNDO 3D] │
│ │
│ ┌───────────────┐ │
│ │ Canteiro seco │ │
│ │ [E] Examinar │ │
│ └───────────────┘ │
│ │
│ VIDA ██████████ 100 │
│ ENERGIA ███████░░░ 70 │
│ FOME ████████░░ 80 │
│ SEDE █████████░ 90 │
│ │
│ [1 Machado] [2 Enxada] [3 Regador] [4 Sementes] ... │
└────────────────────────────────────────────────────────┘

Regra: o HUD deve ser discreto fora de combate ou trabalho. Não mostrar barra de afeto, porcentagem de mistério ou pontuação social.

Tela 2 — Inventário
Texto simples
┌─────────────────────────────────────────────────────┐
│ INVENTÁRIO [FECHAR] │
├───────────────────────────┬─────────────────────────┤
│ [Madeira x12] [Pedra x8] │ ITEM SELECIONADO │
│ [Fibra x5 ] [Semente x6] │ Raiz-de-mel │
│ [Enxada ] [Regador ] │ Alimento cultivável │
│ [vazio ] [vazio ] │ │
│ ... 24 espaços │ [USAR] [MOVER] [DESCARTAR]│
├───────────────────────────┴─────────────────────────┤
│ [1] [2] [3] [4] [5] [6] [7] [8] │
└─────────────────────────────────────────────────────┘

O inventário deve permitir dividir pilhas, mover itens entre baús e mostrar claramente a quantidade disponível.

Tela 3 — Diário factual
Texto simples
┌─────────────────────────────────────────────────────┐
│ DIÁRIO │
├───────────────┬─────────────────────────────────────┤
│ Tudo │ DIA 08 — BROTAÇÃO │
│ Pessoas │ │
│ Construções │ Marina encontrou manchas azuis │
│ Agricultura │ em alguns canteiros. │
│ Exploração │ │
│ Comunidade │ Augusto pediu madeira para │
│ │ reparar uma cerca. │
│ │ │
│ │ Encontrei uma fundação antiga │
│ │ perto da horta. │
└───────────────┴─────────────────────────────────────┘

O diário não deve escrever "Marina está apaixonada" ou "Elias confia 72% no jogador".

Tela 4 — Menu de pausa
Texto simples
┌──────────────────────────────┐
│ SOB O CÉU DE NÉRIA │
│ │
│ CONTINUAR │
│ SALVAR │
│ CARREGAR │
│ CONFIGURAÇÕES │
│ SAIR AO MENU │
│ │
│ Modo: Solo │
│ Dia 08 — Brotação │
└──────────────────────────────┘

Em multiplayer, abrir o menu não deve pausar o mundo para todos automaticamente.

Tela 5 — Save/load
Texto simples
┌──────────────────────────────────────────────────┐
│ SALVAR / CARREGAR │
├──────────────────────────────────────────────────┤
│ SLOT 1 — Vale da Água Clara │
│ Dia 08 • 03h12 de jogo • Solo │
│ Versão de save: 1 │
│ [CARREGAR] [SOBRESCREVER] │
│ │
│ SLOT 2 — Vazio │
│ [CRIAR SAVE] │
│ │
│ BACKUP AUTOMÁTICO │
│ Dia 07 • 02h48 de jogo │
│ [RESTAURAR] │
└──────────────────────────────────────────────────┘

No Final C, a tela futura precisa distinguir explicitamente os estados Néria — o operador fica e Epílogo na Terra.

Ferramenta de diálogo

Proposta: criar arquivos de diálogo em formato estruturado, com chaves de localização e condições.

Exemplo conceitual:

Texto simples
dialogue_id: marina_crop_001
speaker: marina
condition:
season: brotacao
crop_problem: true
text_key: npc_marina_crop_problem_001
effects:
journal_event: crop_problem_observed

O texto não deve ser a própria condição lógica.

Hot-reload

Dados de culturas, itens e diálogos podem ser recarregados em ferramentas de desenvolvimento, mas não é seguro alterar arbitrariamente definições persistentes durante uma sessão multiplayer.

Recomendação: hot-reload apenas em modo de desenvolvimento, com validação e reinicialização controlada quando houver mudanças estruturais.

Critério de pronto

Cinco telas funcionam em 720p.

Textos são legíveis e escaláveis.

Inventário e baú compartilham componentes.

Diário registra somente eventos significativos.

Nenhuma informação emocional oculta aparece na UI.

Diálogos são editáveis sem alterar código principal.

O jogador consegue salvar e restaurar pelo menu.

Os textos usam chaves de localização.

A interface funciona com teclado e mouse sem cliques imprecisos.

8. ÁUDIO, MÚSICA E FEEDBACK

Prioridade média — ordem 8

Por que falta?

A identidade sonora de Néria precisa existir desde o vertical slice, mas não exige um álbum completo.

A prioridade é dar peso às ações repetidas e preservar os silêncios narrativos.

Tarefas concretas

Criar barramentos de áudio: Master, Music, Ambience, SFX, UI e Voice.

Usar AudioStreamPlayer para música e UI.

Usar AudioStreamPlayer3D para ferramentas, fauna e fontes posicionais.

Criar sons de machado, enxada, regador e colheita.

Criar variações para evitar repetição idêntica.

Criar ambiente de floresta diurno.

Criar ambiente de floresta noturno.

Criar chuva e vento.

Criar passos em terra, madeira e pedra.

Criar som de água e rio.

Criar som de construção e encaixe.

Criar feedback de inventário e fabricação.

Criar transições de música.

Criar sistema de prioridade de áudio.

Criar silêncio musical do túmulo de Lua.

Criar som do relógio parado sem tique-taque contínuo.

Criar efeitos do gravador antigo.

Criar configurações de volume.

Criar indicadores visuais para avisos sonoros importantes.

Registrar licenças e origem de todos os arquivos.

Quantidades iniciais

Categoria

MVP

Vertical slice

Música

1

3

Ambientes

3

6

Ferramentas e colheita

8

15

Passos

4

8

UI

5

8

Construção

4

8

Eventos narrativos

1

4

Total

26

52

Direção sonora

Colheita: som curto e agradável, sem exagerar volume. O objetivo é satisfação repetível.

Chuva: deve permitir perceber sua intensidade, inclusive quando o jogador está dentro de uma cabana.

Elias: o silêncio perto do túmulo de Lua deve ser implementado como uma zona de controle musical, não como trilha triste.

Augusto: ferramenta e metal precisam soar diferentes de madeira.

Risco e corte

O risco é gastar com trilhas antes de conhecer o ritmo do gameplay.

Corte: uma música principal original, ambientes bem produzidos e efeitos licenciados. Adiar dublagem completa.

Critério de pronto

Todas as ações principais possuem feedback sonoro.

Sons repetidos não se tornam irritantes em teste de 20 minutos.

Volumes são ajustáveis.

O silêncio musical de Lua funciona sem cortar abruptamente efeitos necessários.

Nenhum aviso crítico depende exclusivamente de áudio.

Todos os arquivos possuem licença comercial registrada.

9. MUNDO, MAPAS E CONTEÚDO DA REGIÃO INICIAL

Prioridade alta — ordem 9

Por que falta?

A decisão de produzir um bioma inicial é correta, mas ainda é necessário determinar qual área será jogável, onde ficam recursos, construções, rotas e NPCs.

Uma clareira vazia de 128 × 128 m não constitui um vertical slice apenas por possuir terreno e árvores.

Tarefas concretas

Definir a borda da Mata e a entrada do Vale.

Criar mapa topográfico em escala.

Definir rio, encostas e clareiras.

Posicionar área inicial do jogador.

Posicionar primeira horta.

Posicionar oficina de Augusto.

Posicionar área de trabalho de Marina.

Posicionar acesso à estação de Elias.

Criar uma trilha principal e uma alternativa.

Criar pontos de coleta.

Criar áreas de construção permitidas.

Criar áreas protegidas contra construção.

Criar vegetação com LOD e culling.

Criar sistema de navegação de NPCs.

Criar água simples.

Criar uma pista ambiental integrada ao cultivo.

Criar um objeto histórico decorável.

Criar um evento climático.

Criar pontos de spawn de fauna.

Criar transição para áreas ainda inacessíveis.

Criar mapa de depuração.

Testar colisões e caminhos após construir estruturas.

Dimensões propostas

Área

Dimensão

Clareira técnica

128 × 128 m

Área cultivável inicial

20 × 20 m

Acampamento

25 × 25 m

Oficina

6 × 5 m

Abrigo inicial

3 × 3 m

Rio

4–8 m de largura

Trilha principal

2,5–3 m

Estação de Elias

Pequena área separada, acessível por trilha

O vertical slice pode expandir a clareira com uma área adjacente de aproximadamente 128 × 128 m, mas somente se o desempenho e o cronograma permitirem.

Conteúdo mínimo

3 modelos de árvores.

4 modelos de arbustos.

3 tipos de rocha.

2 culturas.

4 construções funcionais.

1 oficina.

1 rio.

1 ponte.

1 objeto histórico.

1 área de fauna.

1 evento de chuva.

3 NPCs.

Não construir uma cidade completa.

Navegação de NPCs

Usar NavigationRegion3D e NavigationAgent3D.

Construções do jogador podem bloquear caminhos.

Para o MVP, restringir construção em corredores essenciais é mais seguro que tentar reconstruir uma malha de navegação complexa a cada peça colocada.

Se o jogador construir uma parede na frente da oficina de Augusto, a interface deve impedir a colocação ou oferecer uma regra clara de acesso.

Risco e corte

O maior risco é excesso de vegetação e objetos interativos.

Corte: limitar densidade, reutilizar materiais, ativar interações próximas e separar áreas por carregamento quando necessário.

Critério de pronto

Jogador percorre a região sem atravessar objetos.

Marina alcança a horta.

Augusto alcança a oficina.

Elias alcança sua estação.

Construções não bloqueiam rotas essenciais.

O jogador encontra recursos sem depender de marcador de missão.

Existe uma pista ambiental acessível.

O mapa mantém a meta de FPS durante chuva e com três NPCs ativos.

10. LANÇAMENTO, NEGÓCIO E PREPARAÇÃO COMERCIAL

Prioridade alta — ordem 10

Por que falta?

O lançamento ainda não precisa acontecer, mas decisões comerciais afetam licenças, conteúdo, classificação indicativa, localização e orçamento.

O erro seria começar marketing prometendo quatro jogadores online e doze romances completos quando o primeiro ano só produzirá três NPCs e LAN para dois.


