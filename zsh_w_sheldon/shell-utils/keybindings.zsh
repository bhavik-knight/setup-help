if [[ -n "$ZSH_VERSION" ]]; then
    bindkey -e
    bindkey '^[[H'  beginning-of-line      # Home
    bindkey '^[[F'  end-of-line            # End
    bindkey '^[[3~' delete-char            # Delete
    bindkey '^[[1;5D' backward-word        # Ctrl + Left
    bindkey '^[[1;5C' forward-word         # Ctrl + Right
fi

