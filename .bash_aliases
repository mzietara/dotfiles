cd ()
  {
    if [ -n "$1"  ]; then
      builtin cd "$@" && ls -a
    else
      builtin cd ~ && ls -a
    fi
  }
