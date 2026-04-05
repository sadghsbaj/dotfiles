# System Update (Fedora)
alias update-sys='sudo dnf upgrade --refresh && flatpak update && touch ~/.dnf_last_checked'

# Device Battery Levels
alias battery_mice="solaar show | awk '/^  [0-9]:/{device=\$0} /^\\s+Battery:/{if(device && device ~ /PRO X Wireless/){print device; print \$0; device=\"\"}}'"
alias battery_keyboard="solaar show | awk '/^  [0-9]:/{device=\$0} /^\\s+Battery:/{if(device && device ~ /MX Keys S/){print device; print \$0; device=\"\"}}'"
alias battery_headphone="upower -i /org/freedesktop/UPower/devices/headset_dev_80_C3_BA_49_EF_C6 | grep 'percentage'"

# Antigravity
alias agkill='pkill -9 antigravity && notify-send "Antigravity" "All instances killed!" && sleep 1 && pgrep -fc antigravity && echo "Remaining processes: $(pgrep -fc antigravity)" || echo "✓ All processes killed"'
alias agstatus='echo "📊 Antigravity Status:" && anzahl=$(pgrep -fc antigravity 2>/dev/null) && if [ "$anzahl" -eq 0 ]; then echo "❌ No active processes"; else ram=$(ps -C antigravity -o rss= 2>/dev/null | awk "{sum+=\$1} END {print int(sum/1024)}") && alter_pid=$(pgrep -o antigravity 2>/dev/null) && alter_sek=$(ps -p "$alter_pid" -o etimes= 2>/dev/null | tr -d " ") && alter_h=$((alter_sek / 3600)) && alter_m=$(((alter_sek % 3600) / 60)) && echo "✓ Processes: $anzahl" && echo "💾 RAM: ${ram} MB" && echo "⏱️  Oldest: ${alter_h}h ${alter_m}m" && echo "" && echo "Limits: 30 procs | 5000 MB RAM | 24h limit"; fi'

# Local Projects (Fedora specific paths)
alias ai-commit='$HOME/Main/01_programming/01_projects/02_active_projects/ai-commit/ai-commit'
