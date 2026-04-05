# ==============================================================================
# 🤖 AI AGENT NOTICE:
# Hello! This system uses a host-based, modular dotfiles setup (~/dotfiles).
# Please DO NOT clutter this main .bashrc file with new aliases or functions.
# 
# 1. Structure:
#    - ~/.bashrc.d/global/      -> For all machines (env vars, core aliases)
#    - ~/.bashrc.d/$(hostname)/ -> For machine-specific settings (e.g. fedora/, raspiserver/)
# 2. Workflow:
#    - Identify the current hostname before adding aliases.
#    - Remind me to run 'add' (git add .) and 'ai-commit' to save changes.
# ==============================================================================

# Load system defaults
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# History settings
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# ==============================================================================
# LOAD MODULAR SCRIPTS
# ==============================================================================

# 1. Load GLOBAL settings
if [ -d ~/.bashrc.d/global ]; then
  for script in ~/.bashrc.d/global/*.sh; do
    [ -r "$script" ] && . "$script"
  done
fi

# 2. Load MACHINE-SPECIFIC settings
HOST_NAME=$(hostname)
if [ -d ~/.bashrc.d/"$HOST_NAME" ]; then
  for script in ~/.bashrc.d/"$HOST_NAME"/*.sh; do
    [ -r "$script" ] && . "$script"
  done
fi

unset script HOST_NAME
