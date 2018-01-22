#!bin/bash
bashDir=$( dirname "${BASH_SOURCE[0]}")"/"
confDir="${HOME}/.config/nvim/" # ~ tilde expansion does not work as variable use ${HOME} instead

echo "src dir:    ${bashDir}"

# install vim-plug from repo
#echo "(Re?)-installing vim-plug from junegunn/vim-plug/"
#curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



# check if file does not exist
if [ ! -f "${confDir}init.vim" ]; then
	# if file not found check if directory does not exists	
	if [ ! -d "${confDir}" ]; then
		# if no file and no directories create directories
		echo "[ Warning ] ${confDir} directory does not exist... Generating."
		mkdir -p "${confDir}"
	fi
	# if no config file copy source config over
	cp "${bashDir}config/init.vim" "${confDir}init.vim"
else
	echo -e "Replacing:  ${confDir}init.vim\nBacking up: ${confDir}init.vim.back"
	mv "${confDir}init.vim" "${confDir}init.vim.back"
	cp "${bashDir}config/init.vim" "${confDir}init.vim"
fi
