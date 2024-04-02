if status is-interactive
    # Commands to run in interactive sessions can go here

    alias k kubectl
    alias z "zellij attach --create"
    alias tailscale /Applications/Tailscale.app/Contents/MacOS/Tailscale
    alias ls lsd
    alias x "lsd --long --classify --blocks size,date,git,name"
    alias vi nvim

    fish_vi_key_bindings
    set fish_vi_force_cursor 1

    atuin init fish | source

    set -g fish_cursor_default block blink
    set -g fish_cursor_insert line blink
    set -g fish_cursor_replace_one underscore blink
    set -g fish_cursor_visual block blink

    starship init fish | source
    bind -M insert -k nul c-space
    zoxide init --cmd cd fish | source

end
