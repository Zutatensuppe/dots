# make .profile work in xterm

put into .bashrc:

	. ~/.profile

# find keysym
*usable for xmonad*

	/usr/include/X11/keysymdef.h
	/usr/include/X11/XF86keysym.h 

# setup hdmi

## video

install xrandr

	$ sudo apt-get install xrandr

install graphical user interface for xrandr

	$ sudo apt-get install arandr

## audio

install pulseaudio

	$ sudo apt-get install pulseaudio

install gui for pulseaudio

	$ sudo apt-get install pavucontrol



## auto switch audio to hdmi:

add the following to /etc/pulse/default.pa
before the if... udev-detect - block in your /etc/default.pa
  
	load-module module-switch-on-connect

# remove swappiness of system

@see http://askubuntu.com/a/149427

To permanently set swappiness to X (1-10 should be good, while default is 60):

	sudoedit /etc/sysctl.conf
	Add this line vm.swappiness = X
	sudo shutdown -r now # restart system

