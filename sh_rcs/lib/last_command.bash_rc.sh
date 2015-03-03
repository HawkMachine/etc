# Simple solution based on http://stackoverflow.com/a/1862762
# by http://stackoverflow.com/users/7446/ville-laurikari
trap __timer_start DEBUG
function __timer_start() {
	__timer=${__timer:-$SECONDS}
}
function __timer_stop() {
	__last_command_time=$(($SECONDS-$__timer))
	unset __timer
}

