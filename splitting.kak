define-command -file-completion -docstring "Open file in vertical split." \
vsplit -params .. %{
    tmux-terminal-horizontal kak -c %val{session} -e "edit %arg{@}"
}

define-command -file-completion -docstring "Open file in horizontal split." \
split -params .. %{
    tmux-terminal-vertical kak -c %val{session} -e "edit %arg{@}"
}
