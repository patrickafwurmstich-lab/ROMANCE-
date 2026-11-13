# Benchmark de Néria (Godot 4), semana 1

Uma cena de teste que mede se o seu notebook (Ryzen 5 3500U, 8 GB) aguenta a clareira do MVP.

## Como rodar
1. Abra o **Godot 4.3 ou mais novo** → Importar → selecione o `project.godot` desta pasta.
2. Aperte **F5**. A câmera gira sozinha pela clareira (128 × 128 m, com rio, 100 árvores e 6 "NPCs" andando).
3. Espere **30 segundos**. Aparece o **FPS médio** e o **1% low** (os piores momentos), que também ficam salvos em `user://benchmark.txt`.

## Teclas
- **1 / 2 / 3:** 50, 100 ou 200 árvores
- **N:** +1 NPC
- **S:** liga e desliga as sombras
- **R:** recomeça a medição

## Testar com VRM de verdade
1. No Godot: **AssetLib → procure "VRM" → instale o addon godot-vrm (V-Sekai)** e ative em Projeto → Configurações → Plugins.
2. Arraste um personagem `.vrm` (do VRoid) para a pasta do projeto.
3. Selecione o nó **Main** e, no campo **Npc Scene**, coloque a cena do VRM.
4. Rode de novo. Agora os NPCs são VRMs (sem animação, o que é suficiente para medir o peso).

## O que anotar (mande os números pro Claude)
| Teste | FPS médio | 1% low |
|---|---|---|
| 100 árvores, 6 cápsulas, sem sombra | | |
| 200 árvores, 6 cápsulas, sem sombra | | |
| 100 árvores, 6 cápsulas, **com sombra** | | |
| 100 árvores, **6 VRM**, sem sombra | | |
| 100 árvores, **10 VRM**, sem sombra | | |

**Meta:** **30 FPS médio** e **1% low acima de 24**. Se o teste com 6 VRM ficar abaixo disso, a gente reduz polígonos, materiais e ossos dos VRM antes de qualquer outra coisa.

> Se o Godot reclamar de memória ou ficar lento, troque em Projeto → Configurações → Renderização o método para **Mobile** ou **Compatibilidade** e teste de novo. Anote qual ficou melhor.
