plug "andreyorst/smarttab.kak" %{
    # when `backspace` is pressed, four spaces are deleted at once
    set-option global softtabstop 4
    set-option global tabstop 4
    set-option global indentwidth 4

    hook global WinSetOption .* expandtab
}
