##
## autochdir.kak by wheatdog
## Automatically change server's working directory according to the current focus buffer
## To turn on this option, add `set global autochdir true` in your kakrc
##

declare-option bool autochdir
declare-option str working_folder

define-command -file-completion -params ..1 -docstring %{change-directory2 [<directory>] : like change-directory, but also update the buffer's working directory} \
    change-directory2 %{ evaluate-commands %sh{
        printf 'change-directory %s\n' "$@"
    } 
    set-option buffer working_folder %sh{pwd}
}

define-command -hidden \
    autochdir-wrapper %{ evaluate-commands %sh{
        if [ "${kak_opt_autochdir}" = "true" ] && [ -n "${kak_opt_working_folder}" ] && [ -d "${kak_opt_working_folder}" ]; then
            printf 'change-directory2 %s\n' "${kak_opt_working_folder}"
        fi
} }

hook global BufCreate .* %{
    set-option buffer working_folder %sh{ 
        if [ "${kak_buffile##*/}" = "COMMIT_EDITMSG" ]; then
            git rev-parse --show-toplevel
        else
            dirname ${kak_buffile}
        fi 
    }
    autochdir-wrapper
}

hook global WinDisplay .* %{ autochdir-wrapper }
hook global FocusIn .* %{ autochdir-wrapper }

set-option global autochdir true
