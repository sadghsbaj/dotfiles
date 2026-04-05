_check_apt_last_update() {
    local marker_file="$HOME/.apt_last_checked"
    local days_threshold=14

    if [ ! -f "$marker_file" ]; then
        touch "$marker_file"
    fi

    local last_update=$(stat -c %Y "$marker_file")
    local now=$(date +%s)
    local days_diff=$(( (now - last_update) / 86400 ))

    if [ $days_diff -gt $days_threshold ]; then
        echo ""
        echo -e "\033[1;41;97m ⚠️  WARNING: ${days_diff} DAYS WITHOUT UPDATE! ⚠️ \033[0m"
        echo -e "\033[0;31m Please run 'update-sys'.\033[0m"
        echo ""
    fi
}
_check_apt_last_update
