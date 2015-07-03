tmux () {
	case "$1" in
		update-environment|update-env)
			for var in $($(which tmux) show-environment | grep -v "^-"); do
				export $var
			done
			;;
		"")
			$(which tmux)
			;;
		*)
			$(which tmux) "$*"
			;;
	esac
}
