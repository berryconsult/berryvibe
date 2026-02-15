#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# install-commands.sh — command installer for Claude Code
#
# Copy commands from any GitHub repo into ~/.claude/commands:
#
#   curl -fsSL https://<your-host>/install-commands.sh | bash -s -- owner/repo
#
# Options (passed after --):
#   owner/repo          GitHub repo (required)
#   -b, --branch NAME   Git branch (default: main)
# ─────────────────────────────────────────────────────────────────────────────
set -euo pipefail

VERSION="1.0.0"

# ── Colors (disabled if not a terminal) ──────────────────────────────────────
if [[ -t 1 ]]; then
    R='\033[0;31m' G='\033[0;32m' Y='\033[1;33m' B='\033[0;34m'
    C='\033[0;36m' BOLD='\033[1m' DIM='\033[2m' NC='\033[0m'
else
    R='' G='' Y='' B='' C='' BOLD='' DIM='' NC=''
fi

info()    { echo -e "${B}│${NC}  $1"; }
ok()      { echo -e "${G}│${NC}  ${G}✔${NC}  $1"; }
err()     { echo -e "${R}│${NC}  ${R}✖${NC}  $1" >&2; }
die()     { err "$1"; echo -e "${R}╵${NC}"; exit 1; }
header()  { echo -e "${C}╷${NC}"; echo -e "${C}│${NC}  ${BOLD}$1${NC}"; }
footer()  { echo -e "${C}╵${NC}"; }

# ── Parse args ───────────────────────────────────────────────────────────────
REPO=""
BRANCH="main"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -b|--branch)      BRANCH="$2"; shift 2 ;;
        -h|--help)
            echo "Usage: curl -fsSL <url>/install-commands.sh | bash -s -- <owner/repo> [options]"
            echo ""
            echo "Options:"
            echo "  -b, --branch NAME   Git branch (default: main)"
            exit 0
            ;;
        -*)               die "Unknown option: $1" ;;
        *)
            if [[ -z "$REPO" ]]; then REPO="$1"; else die "Unexpected argument: $1"; fi
            shift
            ;;
    esac
done

# ── Validate ─────────────────────────────────────────────────────────────────
[[ -z "$REPO" ]] && die "Missing repo. Usage: curl ... | bash -s -- owner/repo"
[[ "$REPO" =~ ^[a-zA-Z0-9._-]+/[a-zA-Z0-9._-]+$ ]] || die "Invalid repo format. Use owner/repo"
command -v git &>/dev/null || die "git is required but not found"

COMMANDS_DIR="$HOME/.claude/commands"

# ── Start ────────────────────────────────────────────────────────────────────
header "install-commands v${VERSION}"
info ""
info "  repo     ${C}${REPO}${NC}  (${DIM}${BRANCH}${NC})"
info "  target   ${DIM}$COMMANDS_DIR${NC}"
info ""

# ── Clone ────────────────────────────────────────────────────────────────────
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

info "Cloning ${DIM}https://github.com/${REPO}${NC} ..."

if ! git clone --depth 1 --branch "$BRANCH" "https://github.com/${REPO}.git" "$TMP/repo" 2>/dev/null; then
    die "Clone failed. Check the repo name and branch."
fi

ok "Cloned"

# ── Copy commands ─────────────────────────────────────────────────────────────
COMMANDS_SRC="$TMP/repo/commands"

if [[ ! -d "$COMMANDS_SRC" ]]; then
    die "No commands folder found in repo"
fi

if [[ -z "$(ls -A "$COMMANDS_SRC"/*.md 2>/dev/null || true)" ]]; then
    die "No .md files found in commands folder"
fi

info ""
info "Copying commands to ${C}$COMMANDS_DIR${NC} ..."

mkdir -p "$COMMANDS_DIR"
copied=0

for cmd in "$COMMANDS_SRC"/*.md; do
    if [[ -f "$cmd" ]]; then
        cmd_name=$(basename "$cmd")
        cp -f "$cmd" "$COMMANDS_DIR/$cmd_name"
        ok "  ${C}›${NC} $cmd_name"
        ((copied++))
    fi
done

info ""
ok "${G}${BOLD}$copied${NC}${G} command(s) copied${NC}"
info ""
info "Restart Claude Code to pick them up."
footer
