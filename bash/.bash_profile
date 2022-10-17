#!/bin/bash

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# conda path
__conda_setup="$('/Users/home/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/home/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/home/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/home/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

