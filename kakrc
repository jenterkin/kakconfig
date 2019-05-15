# Load plug.kak
source "%val{config}/plugins/plug.kak/rc/plug.kak"

hook global RuntimeError .* %{
    tmux-terminal-vertical kak -c %val{session} -ro -e "edit *debug*"
}

source "%val{config}/language-server-client.kak"
source "%val{config}/fzf.kak"
source "%val{config}/line-numbers.kak"
source "%val{config}/colors.kak"
source "%val{config}/smarttab.kak"
source "%val{config}/line-wrap.kak"
source "%val{config}/splitting.kak"
source "%val{config}/autochdir.kak"

source "%val{config}/languages/python.kak"
