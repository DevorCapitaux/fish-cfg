function fish_prompt
    set -l last_status $status

    set -l dir          (set_color cyan)    ''
    set -l upper_corn   (set_color white)   '╭'
    set -l lower_corn   (set_color white)   '╰'
    set -l arrow        (set_color cyan)    '󰅂'

    set -l path     (set_color -i white)    (prompt_pwd -D44) (set_color normal)
    set -l git                              (fish_git_prompt)
    set -l username (set_color -o blue)     $USER
    set -l suffix   (set_color -o white)    '$'
    set -l stat

    if functions -q fish_is_root_user; and fish_is_root_user
        set username    (set_color -o red)      $USER
        set suffix      (set_color -o white)    '#'
    end

    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    echo -s $upper_corn $dir " " $path $git " " $stat \n \
            $lower_corn $arrow " " $username " " $suffix " " (set_color normal)
end
