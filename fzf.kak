plug "andreyorst/fzf.kak" tag "v1.0.0"

map global normal <c-p> ':fzf-mode<ret>'

# Don't store my list of projects in my kak conf dir
declare-option str fzf_project_file "~/.config/fzf/projects"
