alias wg_start="sudo systemctl start wg-quick@wg0.service"
alias wg_stop="sudo systemctl stop wg-quick@wg0.service"
alias wg_restart="sudo systemctl restart wg-quick@wg0"

alias ls="lsd"
alias lsblk="lsblk -f"

alias py="python3"
alias pip="python3 -m pip"
alias venv="source venv/bin/activate"

alias install="sudo apt install"
alias update="sudo apt update && time sudo apt dist-upgrade"

search() {
    echo "-- Flatpak --"
    flatpak search $1
    echo "-- Apt --"
    apt search $1
}

alias ipa="ip -c a | sed -e 's/\// \//g'"
alias free="free -h --kilo"
alias df="df -H"
alias neofetch="fastfetch"

chroot_mount() {
	for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i $1$i; done
}
