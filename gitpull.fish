#!/usr/bin/fish
# Script to run "git pull" in all subdirectories of the current directory
set -l files (find . -maxdepth 1 -type d | tail -n +2)
set -l command git
set -l arguments pull
for i in $files
    echo -e "running \033[1;30m'$command $arguments'\033[0m in \033[0;32m$i\033[0m"
    eval $command -C "$i" $arguments
end
