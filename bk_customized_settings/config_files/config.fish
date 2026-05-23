# Customize fish shell

if status is-interactive
    # Commands to run in interactive sessions can go here

    # 0. Other aliases  
    alias cat="batcat"
    alias grep="rg"
    alias find="fdfind"
    alias ff="fastfetch"


    # 1. Start fastfetch immediately
    ff

    
    # 2. Initialize "starship" prompt
    starship init fish | source

    
    # 3. Custom Right Prompt 
    function fish_right_prompt
        # This mirrors the starship time on the right side
        set_color FFD700
        date "+[%I:%M:%S %p]"
        set_color normal
        date "+ on "
        set_color FFD700
        date "+[%Y-%m-%d]"
        set_color normal
    end

    
    # 4. EZA (Modern ls)
    # Base alias with icons enabled
    alias ls="eza --icons --group-directories-first --grid --git"

    # Lists: -l (long), -g (group), -h (human-readable), -F (classify)
    alias l="ls -lh"
    alias ll="ls -lghF"
    alias la="ls -ah"
    alias lla="ls -laghF"

    # Specialized Eza views
    alias lt="ls --tree"              # Tree view
    alias lz="ls -l --sort=size"      # Sort by size
    alias lm="ls -l --sort=modified"  # Sort by modified date

    
    # 5. Use zoxide instead of cd
    # This makes "cd" use zoxide logic
    zoxide init fish --cmd cd | source
   

    # 6. History & Navigation tweaks
    set -g fish_history_shared 1
    set -g fish_history_limit 10000

    
    # 7. Pager for man pages
    set -gx PAGER less
    set -gx MANPAGER less
    set -gx MANPATH (manpath -q)

    
    # 8. Vim key bindings - interactive mode
    fish_vi_key_bindings

    # Optional - initial mode to insert mode
    set -g fish_cursor_default block
    set -g fish_cursor_insert line
    set -g fish_cursor_replace_one underscore
    set -g fish_cursor_visual block

    
    # 9. Create a function to override 'rm'
    # This ensures that whenever you type 'rm', it uses 'trash-put' instead.
    function rm
        if test (count $argv) -eq 0
            # If no arguments, just run the real rm to show its error/help
            command rm
        else
            # Redirect to trash-put
            # We use 'command trash-put' to ensure we aren't calling an alias
            trash-put $argv
            echo (set_color green)"Moved to trash: $argv"(set_color normal)
        end
    end


    # 10. Trash Aliases
    ### --- FILE DELETION & TRASH --- ###

    # Default deletion (Safe)
    alias rm="trash-put"

    # Trash Management
    alias list-trash="trash-list"
    alias restore-trash="trash-restore"
    alias empty-trash="trash-empty"

    # Logic for a "30-day auto-clean" alias
    alias clean-trash="trash-empty 30"


    # 11. Colored Man Pages
    set -gx MANROFFOPT "-c"
    set -gx MANPAGER "most"


end

