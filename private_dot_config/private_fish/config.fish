set fish_cursor_insert block
set -U fish_prompt_pwd_dir_length 0

function fish_greeting
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)" ($last_status)" (set_color normal)
    end

    string join '' -- (set_color --bold green) (prompt_pwd) (set_color normal) (fish_git_prompt) $stat ' > '
end

# starship prompt
# starship init fish | source

