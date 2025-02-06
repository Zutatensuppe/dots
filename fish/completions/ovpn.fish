# Autocomplete for the ovpn function
complete -c ovpn -f -a "(ls -1 ~/.config/openvpn/*.ovpn 2>/dev/null | xargs -n1 basename)"

