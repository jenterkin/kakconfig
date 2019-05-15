plug "ul/kak-lsp" do %{
    cargo build --release --locked
    cargo install --force --path .
}

# Enable the language server client
lsp-enable

# Show language server info on hover
lsp-auto-hover-enable

# Go to definition
map global user d ':lsp-definition<ret>'

# Find next reference
map global user f ':lsp-find-next-reference<ret>'

# Open language server details in new window
define-command lsp-diagnostics-buffer %{
    tmux-terminal-vertical kak -c %val{session} -e "lsp-diagnostics"
}
