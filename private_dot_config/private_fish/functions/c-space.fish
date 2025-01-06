function c-space
  set RG_PREFIX "rg --hidden --iglob '!google-cloud-sdk' --iglob '!flutter' --column --line-number --no-heading --color=always --smart-case "
  set RG_SUFFIX "~/prive ~/code/src/github.com/gnur ~/bin ~/Documents ~/.config"

  set FD_PREFIX "fd --type d --hidden"
  set FD_SUFFIX "$HOME"
  set VIF_CMD "fd --type f --hidden . '$HOME'"

  set f $(echo -n '' | fzf --ansi  \
    --bind "change:reload:sleep 0.1; $RG_PREFIX {q} $RG_SUFFIX || true" \
    --bind "start:reload($FD_PREFIX {q} $FD_SUFFIX)+unbind(ctrl-d,change)" \
    --bind "ctrl-f:unbind(ctrl-f)+change-prompt(2. edit> )+enable-search+reload($VIF_CMD)+transform-query('')+change-preview(exa --long --classify --icons --no-user --no-permissions {})" \
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(3. ripgrep> )+disable-search+reload($RG_PREFIX {q} $RG_SUFFIX || true)+rebind(change,ctrl-f)+transform-query('')+change-preview(bat --color=always {1} --highlight-line {2})" \
    --color "hl:-1:underline,hl+:-1:underline:reverse" \
    --prompt '1. cd > ' \
    --delimiter : \
    --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (edit mode) ╱ CTRL-D (dir mode) /' \
    --preview 'exa --long --classify --icons --no-user --no-permissions {}' \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' )

    set fields $(echo "$f" | grep -o ':' | wc -l)

    if test "$fields" -gt 1
      set filename $(echo "$f" | cut -d ':' -f 1)
      set line $(echo "$f" | cut -d ':' -f 2)
      $EDITOR "$filename" +$line
      return
    end

    if test -z $f
      return
    end

    if test -d $f
      cd "$f"
      commandline -f repaint
      return
    end

    if test -f $f
      $EDITOR "$f"
      return
    end
end
