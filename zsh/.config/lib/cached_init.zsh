# Cache slow `eval "$(cmd ...)"` shell-init output on disk.
# Regenerates only when the source binary is newer than the cache.
#
# Usage: cached_eval <cache_name> <cmd> [args...]
cached_eval() {
	local name="$1"; shift
	local cache_dir="${ZSH_INIT_CACHE_DIR:-$HOME/.cache/zsh-init}"
	local cache_file="$cache_dir/$name.zsh"
	local bin_path
	bin_path="$(command -v "$1" 2>/dev/null)"

	if [[ -z "$bin_path" ]]; then
		return 1
	fi

	mkdir -p "$cache_dir"

	if [[ ! -f "$cache_file" || "$bin_path" -nt "$cache_file" ]]; then
		"$@" > "$cache_file" 2>/dev/null
	fi

	source "$cache_file"
}
