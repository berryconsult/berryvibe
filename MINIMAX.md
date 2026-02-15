# Minimax

Default coding model: MiniMax-M2.5

Edit this file to use the model with Claude Code:

`~/.claude/settings.json`

```json
{
  "env": {
    "API_TIMEOUT_MS": "3000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": 1,
    "ANTHROPIC_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_SMALL_FAST_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "MiniMax-M2.5",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "MiniMax-M2.5"
  }
}
```

`~/.zshrc` or `~/.bashrc`

```sh
export ANTHROPIC_AUTH_TOKEN="<MINIMAX_API_KEY>"
export ANTHROPIC_BASE_URL="https://api.minimax.io/anthropic"
```