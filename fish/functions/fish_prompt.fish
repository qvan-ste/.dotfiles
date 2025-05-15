function fish_prompt --description 'Write out the prompt'
	set exit_code $status

	set -q fish_prompt_pwd_dir_length
	or set -lx fish_prompt_pwd_dir_length 0

	set status_color $mauve
	if test $exit_code -ne 0
		set status_color $red
	end

	function git_prompt
		set git_status (string sub -s 3 -e -1 (fish_git_prompt))
		if test (string length $git_status)
			echo $dark_grey " $git_status"
		end
	end

	echo -s $blue  (prompt_pwd) (git_prompt)
	echo -n -s $status_color ❯ ' '
end
