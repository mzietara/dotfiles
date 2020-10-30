cd ()
  {
    if [ -n "$1"  ]; then
      builtin cd "$@" && ls -a
    else
      builtin cd ~ && ls -a
    fi
  }

# Aliases
# alias alias_name="command_to_run"

# Long format list
alias ll="ls -la"

# Print my public IP
alias myip='curl ipinfo.io/ip'

# easier to go back
alias .="cd . & ls"
alias ..="cd .. & ls"

# current coding workspace
alias ws='~/integreatly/apps/igy/src/integreat.ly'
