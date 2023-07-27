#!/bin/bash
# banner.sh
# Created on: Fri 22 Jan 2021 03:52:55 AM CET
#
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:

NO=$(( $RANDOM % 7 + 1 ))

case $NO in
	1)
		bullshit | cowsay -f /usr/share/cows/$(/bin/ls /usr/share/cows/ | shuf -n 1) | lolcat
		;;
	2)
		sh ghosts.sh
		;;
	3)
		sh pacman.sh
		;;
	4)
		sh darthvader.sh
		;;
	5)
		doge
		;;
	6)
		fortune | cowsay -f /usr/share/cows/$(/bin/ls /usr/share/cows/ | shuf -n 1) | lolcat
		;;
	7)
		date "+%D %T" | figlet | lolcat
		;;
esac
