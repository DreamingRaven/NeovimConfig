#!bin/bash

bashDir=$( dirname "${BASH_SOURCE[0]}")"/"
confDir="${HOME}/.config/nvim/" # ~ tilde expansion does not work as variable use ${HOME} instead

cp "${confDir}init.vim" "${bashDir}config/init.vim" 
