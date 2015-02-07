# Bash specific options

# Set variables for the external system
PROMPT_THEME=prompt

# Array of paths to add to $PATH.
PATHS=(
	"/usr/lib64/openmpi/bin"
	"~/software/NuSMV-2.5.4/bin"
	"~/software/netbeans-7.3/bin"
	"~/projects/bash_search_dir"
	"~/projects/bash_search_dir/bbbin"
	"~/projects/bash_search_dir/reddwarfbin"
)

# Array of paths to add to $PYTHONPATH.
PYTHONPATHS=(
	"~/software/google_appengine/lib/django-1.5"
	"~/projects/python"
)

HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob

export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.60-2.4.5.0.fc19.x86_64/jre/bin/java"
[[ -f "~/.local/share/Steam/setup_debian_environment.sh" ]] && source "~/.local/share/Steam/setup_debian_environment.sh"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib

export MANWIDTH=120
export EDITOR=vim
export LC_MESSAGES='en_GB'

set editing-mode vi
