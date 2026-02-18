#Adicionado sons ao Claude Code

Para adicionar um prompt sonoro ao término de cada atividade do Claude Code ou Codex, seguir os passos abaixo:

1. No arquivo ~./.claude/settings.json, abaixo do objeto "env", colar o seguinte código
   
```json
"hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/play-sound.sh"
          }
        ]
      }
    ]
  }
```
2. Dentro da pasta ~./.claude/hooks criar um arquivo chamado "play-sound.sh" com o seguinte código

```
#!/usr/bin/env bash

# macOS: system sound
afplay "$HOME/.claude/hooks/alert.mp3"

```
3. Nesta mesma pasta, adicionar o arquivo .mp3 no arquivo .zip deste repositório.
