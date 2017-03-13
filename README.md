# make .profile work in xterm

put into .bashrc:

	. ~/.profile

# find keysym
*usable for xmonad*

	/usr/include/X11/keysymdef.h
	/usr/include/X11/XF86keysym.h 

# video and audio output with HDMI (or other external)

For video control install xrandr

	$ sudo apt-get install xrandr

For audio control install pulseaudio

	$ sudo apt-get install pulseaudio


In /etc/pulse/default.pa, replace 
`load-module module-stream-restore` 
with 
`load-module module-stream-restore restore_device=false`
  
Then to toggle between output use the `toggle_video` or `toggle_audio` scripts respectively.

Or install gui tools as an easy alternative or if the scripts fail:

	$ sudo apt-get install arandr
	$ sudo apt-get install pavucontrol


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


# install newest mesa from source (opengl)

http://x.debian.net/howto/build-mesa.html

configure may have to be run with --with-gallium-drivers=""
