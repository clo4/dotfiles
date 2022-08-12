function mvcwd
	set dir (pwd)
	cd ../
	mv $dir $argv[1]
	cd $argv[1]; 
end
