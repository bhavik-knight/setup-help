# Sheldon plugin installation steps


## 0. Create folder structure
This is the folder structure to add the files / configuration for zsh plugin sheldon
```
~ (Home)
├── .zshenv
├── .zshrc
└── .config/
    └── zsh/
        ├── aliases.zsh     <- Eza aliases and shortcuts
        ├── options.zsh     <- Tab completion styling & history limits
        └── tools.zsh       <- Zoxide initialization & custom functions
```

## 1. Install cargo
`curl https://sh.rustup.rs -sSf | sh`

## 2. Set cargo env variable (put it on path) by restarting zsh
`exec zsh -l`

## 3. Install necessary dependencies for `sheldon`
For debian/ubuntu based linux: `sudo apt install pkg-config libssl-dev` 
For RHEL/fedora based linux: `sudo dnf install pkgconf-pkg-config openssl-devel`
For Arch based linux: `sudo pacman -Syu pkgconf openssl`

## 4. Install sheldon using cargo with lock flag
`cargo install sheldon --locked`

## 5. Install rigrep (modern grep) using cargo
`cargo install rigrep`

## 6. Install eza - (modern alternative of ls) using cargo
`cargo install eza`

## 7. Install zoxide - (modern alternative of cd that remembers your directories)
`curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`

## 8. Install fzf - (fzs installation)
Installation: `sudo dnf install fzf -y`
Source it: `source <(fzf --zsh)`

## 9. Install starship prompt (oh-my-zsh alternative theme) using cargo
`cargo install starship --locked`

## 10. Install gnome-tweaks to change appearance (add minimize, maximize button) using UI
`sudo dnf install gnome-tweaks -y` 

## 11. Install `kitty` terminal 
`curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`


---

Here is the complete, high-performance Markdown blueprint for your modular Zsh runtime environment managed by **Sheldon**.

This document acts as a complete snapshot of your shell configuration, reflecting the optimized Fish-style navigation, `fzf` fuzzy-matching logic, modern CLI alternative tools, and the streamlined Catppuccin/Night-Owl Starship handling we just perfected.

---

# 🌌 Bhavik's Modular Zsh & Sheldon Environment Blueprint

## 📁 Configuration Tree Layout

Your user-space profile is split into decoupled, functional scripts tucked inside your config directory. This ensures maximum modularity and clean error tracking.

```text
~ /
├── .zshenv
├── .zshrc
└── .config/
    └── zsh/
        ├── aliases.zsh     # Modern CLI replacements & shorthand syntax
        ├── option.zsh      # Interactive completions, fuzzy options, & layout rules
        └── tools.zsh       # Core engine initializations & lazy-loaded prompt scripts

```

---

## ⚙️ Core Environment Files

### 1. `~/.zshenv`

This file executes first for all shell invocations (including non-interactive scripts). It maps system paths and establishes default variable states.

```zsh
# Ensure Cargo and local user binaries are discoverable by the shell
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Set your default text editor for things like git and sheldon configuration
export EDITOR="nvim"

```

### 2. `~/.zshrc`

The main entry point for interactive shell sessions. It instantly boots Sheldon into memory to activate plugin dependencies, then dynamically iterates through your modular folder workspace.

```zsh
# ==============================================================================
# 1. INITIALIZE SHELDON FIRST (Moves plugins into memory)
# ==============================================================================
eval "$(sheldon source)"

# ==============================================================================
# 2. LOAD CUSTOM BLUEPRINT MODULES
# ==============================================================================
ZSH_MODULES="$HOME/.config/zsh"

if [[ -d "$ZSH_MODULES" ]]; then
    for config_file in "$ZSH_MODULES"/*.zsh; do
        source "$config_file"
    done
fi

```

---

## 🛠️ User Module Configurations

### 3. `~/.config/zsh/option.zsh`

Manages terminal interactive mechanics, text cursors, typo-tolerant fuzzy search matching rules, and the classic Fish-style rapid navigation bindings.

```zsh
# ==========================================================================
# ZSH INTERACTIVE FUZZY TAB COMPLETIONS
# ==========================================================================

# Initialize fzf's core Zsh hooks (Ctrl+R history search, Alt+C path discovery)
source <(fzf --zsh)

# Re-enable Zsh's completion system to work seamlessly with fzf data
autoload -Uz compinit && compinit

# Configure the completion menu styles
zstyle ':completion:*' menu select
zstyle ':completion:*' fzf-search-display true

# Fallback pure-Zsh fuzzy matching algorithm
# If a command doesn't use fzf, this allows case-insensitivity and fuzzy typo fixing
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# ==========================================================================
# VIM MODE & CURSOR RENDERING DEFINITIONS
# ==========================================================================

# Configure cursors for different states (Fixed Kitty line-shifting escapes)
function zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]]; then
        echo -ne "\e[2 q" # Stable Block cursor for Normal mode
    else
        echo -ne "\e[5 q" # Blinking Beam/Line cursor for Insert mode
    fi
}
zle -N zle-keymap-select

# Ensure the prompt always resets to an insert line cursor on line breaks
function zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# ==========================================================================
# FISH-STYLE DIRECTORY NAVIGATION
# ==========================================================================

# Automatically change directory if a path is typed directly
setopt auto_cd

# Global navigation shorthand definitions
alias -g ..='cd ..'
alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'

```

### 4. `~/.config/zsh/aliases.zsh`

Binds legacy POSIX core utilities smoothly to modern, performant, and visual alternatives written in Rust and C.

```zsh
# Modern alternatives to classic utilities
command -v batcat >/dev/null && alias cat="batcat"
command -v bat >/dev/null && alias cat="bat"
command -v rg >/dev/null && alias grep="rg"
command -v fdfind >/dev/null && alias find="fdfind"
command -v fd >/dev/null && alias find="fd"
command -v fastfetch >/dev/null && alias ff="fastfetch"

# --- EZA (Modern ls Replacement) ---
if command -v eza >/dev/null; then
     alias ls="eza --icons --group-directories-first --grid --git"
     alias l="ls -lh"
     alias ll="ls -lghF"
     alias la="ls -ah"
     alias lla="ls -laghF"
     alias lt="ls --tree"
     alias lz="ls -l --sort=size"
     alias lm="ls -l --sort=modified"
 fi

 # --- FILE DELETION & TRASH ---
 if command -v trash-put >/dev/null; then
     alias rm="trash-put"
     alias list-trash="trash-list"
     alias restore-trash="trash-restore"
     alias empty-trash="trash-empty"
     alias clean-trash="trash-empty 30"
 fi

```

### 5. `~/.config/zsh/tools.zsh`

Manages system initializations on startup. Note that legacy manual `RPS1` time string functions have been dropped here to prevent rendering collisions with your unified **Catppuccin/Night-Owl Starship right status tray**.

```zsh
# 1. Start fastfetch immediately upon opening the shell workspace
if command -v fastfetch >/dev/null; then
     fastfetch
fi

# 2. Initialize Starship Prompt
if command -v starship >/dev/null; then
     eval "$(starship init zsh)"
fi

# 3. Initialize Zoxide (Smarter automated directory jumping)
if command -v zoxide >/dev/null; then
     zsh-defer eval "$(zoxide init zsh)"
     alias cd="z"
fi

# 4. Custom 'rm' Function (Provides clean user feedback using safe trash-cli rules)
if command -v trash-put >/dev/null; then
     function rm() {
         if [ $# -eq 0 ]; then
             command rm
         else
             trash-put "$@"
             echo -e "\e[32mMoved to trash: "$@"\e[0m"
         fi
     }
fi

```

---

## 📦 Suggested Sheldon Plugin Engine Configuration (`plugins.toml`)

To feed community features securely into your `eval "$(sheldon source)"` handshake, keep your `~/.config/sheldon/plugins.toml` structure aligned like this:

```toml
# ~/.config/sheldon/plugins.toml

shell = "zsh"

[plugins.zsh-defer]
github = "romkatv/zsh-defer"

[plugins.zsh-syntax-highlighting]
github = "zsh-users/zsh-syntax-highlighting"
apply = ["defer"]

[plugins.zsh-completions]
github = "zsh-users/zsh-completions"

[plugins.zsh-autosuggestions]
github = "zsh-users/zsh-autosuggestions"
apply = ["defer"]

```

