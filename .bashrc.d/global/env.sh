# Base Paths
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Own dotfile scripts and binaries (dynamic architecture)
ARCH=$(uname -m)
export PATH="$HOME/dotfiles/bin/scripts:$HOME/dotfiles/bin/$ARCH:$PATH"

# Python (pyenv)
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv >/dev/null 2>&1; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Rust (Cargo)
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Golang
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# Node.js (pnpm)
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Node.js (bun)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Julia (juliaup)
case ":$PATH:" in
    *:$HOME/.juliaup/bin:*) ;;
    *) export PATH=$HOME/.juliaup/bin${PATH:+:${PATH}} ;;
esac
