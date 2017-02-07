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

# reduce swappiness of system

@see http://askubuntu.com/a/149427

To permanently set swappiness to X (1-10 should be good, while default is 60):

	sudoedit /etc/sysctl.conf

Add this line: 

	vm.swappiness = X

Restart system

	sudo shutdown -r now 


# make SL300 extra mouse buttons work as keyboard keys

note: filenames can be changed

1. create /etc/udev/rules.d/93-mxmouse.conf.rules

	KERNEL=="event[0-9]*", SUBSYSTEM=="input", SUBSYSTEMS=="input", ATTRS{name}=="DualPoint Stick", SYMLINK+="my_mx_mouse", GROUP="mxgrabber", MODE="640"

2. create /etc/udev/rules.d/

	KERNEL=="uinput", GROUP="mxgrabber", MODE="660"

3. activate modprobe uinput

	sudo modprobe uinput

4. add to /etc/modules-load.d/uinput.conf

	uinput


5. create group mxgrabber and assign user to it

	sudo groupadd mxgrabber
	sudo usermod -aG mxgrabber Zutatensuppe

6. use python script (see specialinput.py)
  (adjust the script as needed, see https://github.com/tuomasjjrasanen/python-uinput/blob/master/src/ev.py for key codes)

7. remove default button click from extra mouse buttons by creating /usr/share/X11/xorg.conf.d/80-mymxmouse.conf with content:

Section "InputClass"
        Identifier      "DualPoint Stick"
        MatchProduct    "DualPoint Stick"
        Option          "ButtonMapping"         "0 2 0"
EndSection

7. add `./specialinput.py &` to .xinitrc

8. restart x

