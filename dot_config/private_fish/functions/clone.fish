function clone
	git clone git@github.com:$argv[1].git ~/Workspaces/github.com/$argv[1]
	set -g _clone_dir ~/Workspaces/github.com/$argv[1]
	function warp
		cd $_clone_dir
		ls -lA1F
		functions --erase warp
		set --erase $_clone_dir
	end
	echo "Run `warp` to cd to the newly cloned repository"
end
