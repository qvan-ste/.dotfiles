function fish_prompt --description 'Write out the prompt'
	set -l exit_code $status

	# Always show full path
	set -q fish_prompt_pwd_dir_length
	or set -lx fish_prompt_pwd_dir_length 0

	set -l status_color $mauve
	if test $exit_code -ne 0
		set -l status_color $red
	end

	  function git_prompt
        set -l git_status (fish_git_prompt)
        if test -n "$git_status"
            # Remove the '()' around the branch name
            set git_status (string sub -s 3 -e -1 $git_status)
            if test (string length $git_status) -gt 0
                echo $dark_grey " $git_status"
            end
        end
    end

	echo -s $blue (prompt_pwd) (git_prompt)
	echo -n -s $status_color ❯ ' '
end
