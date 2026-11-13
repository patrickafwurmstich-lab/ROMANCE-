# Loop de produção: registro das voltas

**Regras:** as mesmas do loop da história (`REGRAS.md`), aplicadas à lista do que falta para o jogo.
- **ChatGPT:** escreve.
- **Grok:** faz a crítica de produtor.
- **Gemini:** avalia como jogador de Stardew.
- **Claude:** é o editor.
- **Critério de parada:** os 10 tópicos com nota **9 ou mais** no Grok e no Gemini. A trava de segurança é de 6 voltas.

## Volta 1
- **Notas:** Grok de 6,5 a 8,5, Gemini de 6,0 a 8,5. Produção foi o pior tópico (6,0–6,5).
- **Decisões:**
  - Escopo do 1º ano: 1 bioma + 3 NPCs (Marina, Augusto, Elias).
  - Multiplayer: 2 jogadores locais primeiro, depois até 4 online.
  - Vertical slice em 4–6 meses.
  - Plano de 12 semanas.
  - Entraram todos os itens que faltavam, apontados pelo Grok e pelo Gemini.
- **Autor:** a engine é **Godot 4**.
- **Resultado:** `O-QUE-FALTA.md` (v1).

## Volta 2
- **ChatGPT:** escreveu a lista v2 (`lista-v2-chatgpt.md`, parte 1). Inclui os 10 tópicos específicos de Godot 4 com critério de pronto, o cronograma de 6 meses em 2 cenários, o orçamento, a planilha de economia, o pipeline VRM em 8 passos e os wireframes das telas.
- **Notas:** **Grok 8,84** e **Gemini 8,86**. Engine (9,2), produção (9,1) e multiplayer (9,0) já passaram de 9.
- **Os dois concordam que falta corrigir:**
  - **Economia:** 14 canteiros deixam margem zero. Passar para **22 canteiros + 15% de perda**, com margem mínima de 25%.
  - **Dia de 36 min reais:** uma estação levaria 59 h. Passar para **18–20 min**, com o sono avançando o tempo.
  - **VRM:** testar na semana 3 com 1 jogador + 3 NPCs. Abaixo de 24 FPS, o limite cai para 12 mil triângulos e a física de cabelo desliga no LOD.
  - **Teste de usabilidade** com 3 pessoas externas na semana 10.
  - **25 arquivos de áudio .wav** até o mês 2.
  - **Teste automatizado de navmesh** com 20 construções aleatórias.
  - **Verificar o nome e a Steamworks** na semana 1.
- **Itens novos que faltavam:**
  - inspetor de autoridade de rede (HUD de debug);
  - teste de queda de energia durante o save (kill -9);
  - versionamento de save entre builds;
  - diferença entre "build interna" e "build para tester";
  - checklist de ClassInd.

## Volta 3: LOOP FECHADO ✅
- **ChatGPT:** reescreveu os 7 tópicos que estavam abaixo de 9. Fechou a economia (22 canteiros, margem de +38,1%), o ritmo (20 min por dia), as metas de VRM, os 25 WAV, os 100 cenários de navegação e a verificação legal.
- **Notas finais:** **Grok 9,09** e **Gemini 9,09**, com **os 10 tópicos acima de 9**.
- **Veredito:** "A lista está pronta para começar a produzir. Pode abrir o Godot." (Grok) / "SIM. A LISTA ESTÁ PRONTA." (Gemini)
- **Contas conferidas pelo Grok:** produção, ciclo de 12 dias, energia e horas, sem nenhum erro aritmético.
- **Extras do Gemini:** a primeira machadada precisa ser marcante, e o anoitecer tem o "alívio sonoro" da fogueira.
