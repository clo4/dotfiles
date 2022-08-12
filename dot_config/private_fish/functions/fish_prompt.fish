function fish_prompt
	set saved_status $status

	set cwd (pwd)
	set friendly_dir (string replace $HOME '~' $cwd)

  echo -ne '\n'

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
