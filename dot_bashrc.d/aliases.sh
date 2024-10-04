# ~/.bashrc.d/aliases.sh
alias ls='eza --long --oneline --color=always --icons=always --all --sort=name --group-directories-first --no-filesize --no-permissions --no-time --no-user --git-ignore'
alias find='fd'
alias cat='bat '
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias lg='lazygit'
