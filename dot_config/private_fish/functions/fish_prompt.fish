function fish_prompt
	set -l saved_status $status

	# if set -q PIN_PROMPT_NEW_LINE
	# 	echo
	# end
	# if not set -q PIN_PROMPT_DISABLE
	# 	tput cup $LINES
	# 	set --erase --global _pin_prompt_clear_screen
	# else if not set -q _pin_prompt_clear_screen
	# 	set --global _pin_prompt_clear_screen
	# 	clear
	# end

	set -l cwd (pwd)
	set -l friendly_dir (string replace $HOME '~' $cwd)

	echo -ne '\n\n'

	set_color blue
	echo $friendly_dir

	if test "$saved_status" = "0"
		set_color magenta
	else
		set_color red
	end
	echo -n '$ '
	set_color normal
end
