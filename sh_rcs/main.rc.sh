rcs_dirs=(local shared)
rcs_blacklist=()  # NOT SUPPORTED YER

function __main__source_rc_files() {
	for file in $@; do 
		if [[ -f $file ]]; then
			# echo "Sourcing " $file
			source "$file"
		fi
	done
}

function __main__source_rc_dir() {
	__main__source_rc_files $1/*.rc.sh
	__main__source_rc_files $1/*.${CURRENT_SHELL}_rc.sh
}

# Source main shell rc to get shell specific plugins, prompt and other shell
# specific options.
__main__source_rc_files ~/.sh_rcs/main.${CURRENT_SHELL}_rc.sh

# Source all libs.
__main__source_rc_dir ~/.sh_rcs/lib

# Source shell specific and common plugins.
for DIRNAME in ${rcs_dirs[@]}; do
	for file in ~/.sh_rcs/plugins/$DIRNAME/*; do
		__main__source_rc_dir ~/.sh_rcs/plugins/$DIRNAME
	done
done

# Export all required paths.
function __main__create_search_path() {
	local CONCATENATED_PATHS="$1"
	shift
	for NEXT_PATH in "$@"; do
		CONCATENATED_PATHS="$CONCATENATED_PATHS:$NEXT_PATH"
	done
	echo $CONCATENATED_PATHS
}
export PATH=$(__main__create_search_path $PATH ${PATHS[@]})
export PYTHONPATH=$(__main__create_search_path $PYTHONPATH ${PYTHONPATHS[@]})

# Source prompt last. First check if there is a schell specific file then check
# common prompt then back down to default value.
PROMPT_THEME=${PROMPT_THEME:-prompt}
if [[ -f ~/.sh_rcs/prompts/${PROMPT_THEME}.${CURRENT_SHELL}_rc.sh ]]; then
	source ~/.sh_rcs/prompts/${PROMPT_THEME}.${CURRENT_SHELL}_rc.sh
	PROMPT_COMMAND=prompt_function
elif [[ -f ~/.sh_rcs/prompts/${PROMPT_THEME}.rc.sh ]]; then
	source ~/.sh_rcs/prompts/${PROMPT_THEME}.rc.sh
	PROMPT_COMMAND=prompt_function
else
	export PS1=${PS1:-'$'}
fi
