# Script Makefile
# Install all of my scripts in the correct directories
# and notifies you for configuring it

all:	install

install:
	cp -r ./blih /usr/local/bin/blih
	cp -r ./backup.sh /usr/bin/backup.sh
	cp -r ./xvwm.sh /usr/bin/xvwm.sh
	cp -r ./extract.sh /usr/bin/extract.sh
	cp -r ./raro.x /usr/bin/raro.x
	cp -r ./dmenu_splain /usr/local/bin/dmenu_splain
	cp -r ./dmenu_finder.sh /usr/local/bin/dmenu_finder.sh
	cp -r ./finder.sh /usr/local/bin/finder.sh
	cp -r ./dmenu_cfg /usr/local/bin/dmenu_cfg
	cp -r ./dmenu_shut /usr/local/bin/dmenu_shut
	cp -r ./dmenu_keyboard /usr/local/bin/dmenu_keyboard
	cp -r ./dmenu_ovpn /usr/local/bin/dmenu_ovpn
	cp -r ./dmenu_qemu /usr/local/bin/dmenu_qemu
	cp -r ./dmenu_rdp_ssh /usr/local/bin/dmenu_rdp_ssh
	cp -r ./wp6.sh /usr/local/bin/wp6.sh
	cp -r ./xurls /usr/local/bin/xurls
	cp -r ./open /usr/local/bin/open
	cp -r ./ghosts.sh /usr/local/bin/ghosts.sh
	cp -r ./pacman.sh /usr/local/bin/pacman.sh
	cp -r ./banner.sh /usr/local/bin/banner.sh
	cp -r ./monitor.sh /usr/local/bin/monitor.sh
	cp -r ./darthvader.sh /usr/local/bin/darthvader.sh

clean:


