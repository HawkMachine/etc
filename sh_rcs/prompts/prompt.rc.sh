function EXT_256COLOR () { 
	echo -ne "\[\e[38;5;$1m\]";
}

function EXT_256COLOR_SHOW () {
	for y in `seq 0 15`; do
		for x in `seq 0 15`; do
			v=$((16*y+x));
   			printf "%3s"
			local C=$(EXT_256COLOR $v)
			printf "${C}$v"
   		done;
	  	echo;
	done
}

function EXT_256COLOR_SHOW_BOLD () {
	local BOLD="\e[1m"
	for y in `seq 0 15`; do
		for x in `seq 0 15`; do
			v=$((16*y+x));
   			printf "%3s"
			local C=$(EXT_256COLOR $v)
			printf "${BOLD}${C}$v"
   		done;
	  	echo;
	done
}

function prompt_function() {
	local LAST_EXIT="$?"
	__timer_stop

	local BOLD="\e[1m"

	local NO_COLOR="\[\e[0m\]"
	local BLACK=$(EXT_256COLOR 237)
	local GOLD=$(EXT_256COLOR 178)
	local RED=$(EXT_256COLOR 160)
	local DARK_GOLD=$(EXT_256COLOR 215)
	local GRBL2=$(EXT_256COLOR 30)
	local GRBL=$(EXT_256COLOR 31)
	local GREY20=$(EXT_256COLOR 250)
	local BLUE=$(EXT_256COLOR 126)
	local PURPLE=$(EXT_256COLOR 171)
	local GRAYGREEN=$(EXT_256COLOR 66)
	PS1="$BOLD$BLACK[\t] $GRBL\u@\h:\w ${GOLD}$(__git_ps1) "

	if [[ "$__last_command_time" -ge 1 ]]; then
		local C=$(EXT_256COLOR 106)
		if [[ "$__last_command_time" -ge 60 ]]; then
			C=$(EXT_256COLOR 124)
		elif [[ "$__last_command_time" -ge 30 ]]; then
			C=$(EXT_256COLOR 202)
		elif [[ "$__last_command_time" -ge 5 ]]; then
			C=$(EXT_256COLOR 9)
		fi
		PS1+="${BOLD}${C}[${__last_command_time}s]"
	fi

	if [[ "$LAST_EXIT" -gt 0 ]]; then
		local C=$(EXT_256COLOR 196)
		PS1+="${C}[✗]${NO_COLOR}"
	else
		local C=$(EXT_256COLOR 142)
		local C=$(EXT_256COLOR 106)
		PS1+="${C}[✔]${NO_COLOR}"
	fi

	PS1+="$BLACK $ ${NO_COLOR}"
}
