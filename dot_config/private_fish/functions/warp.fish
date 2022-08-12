function warp
	set dir (cat ~/.local/share/fish/warp_dir)
	if test "$dir"
		pushd $dir
	end
end
