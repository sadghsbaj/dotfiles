_check_dnf_last_update() {
    local marker_file="$HOME/.dnf_last_checked"
    local days_threshold=7

    if [ ! -f "$marker_file" ]; then
        touch "$marker_file"
    fi

    local last_update=$(stat -c %Y "$marker_file")
    local now=$(date +%s)
    local days_diff=$(( (now - last_update) / 86400 ))

    if [ $days_diff -gt $days_threshold ]; then
        echo ""
        echo -e "\033[1;41;97m ⚠️  WARNING: ${days_diff} DAYS WITHOUT UPDATE CHECK! ⚠️ \033[0m"
        echo -e "\033[0;31m Please run 'update-sys'.\033[0m"
        echo ""
    fi
}
_check_dnf_last_update
