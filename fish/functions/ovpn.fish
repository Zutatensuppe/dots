function ovpn
	set password (secret-tool lookup login ubuntu)

	echo $password | sudo -S openvpn --config ~/.config/openvpn/$argv
end

