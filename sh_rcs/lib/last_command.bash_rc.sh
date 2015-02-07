# Simple solution based on http://stackoverflow.com/a/1862762 
trap __timer_start DEBUG
function __timer_start() {
	__timer=${__timer:-$SECONDS}
}
function __timer_stop() {
	__last_command_time=$(($SECONDS-$__timer))
	unset __timer
}

