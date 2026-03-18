#!/bin/bash
# backup.sh
#  ____   __  ____  __
# (  _ \ /. |(  _ \/  )
#  )___/(_  _))___/ )(
# (__)    (_)(__)  (__)
#
# Description:
#  Backup script made to save my config to a tar ball for
#  later unpacking

BDIR=$(mktemp -d)
CONF_FILES=(.tigrc .newsboat/urls .config/qutebrowser/quickmarks .todo)
CONF_DIRS=(.xvwm/)

HOST=$(cat $HOME/.p3ng0s.json | jq -r .host)
UNAME=$(cat $HOME/.p3ng0s.json | jq -r .user)

function move_to_folder() {
	for item in $@; do
		IN_FILE="$HOME/$item"
		TO_FILE="$BDIR/$item"
		DIR="$(dirname "$item")"

		[[ "$DIR" != "." ]] && mkdir -p $BDIR/$DIR
		echo -ne "Copying \e[1;31m$IN_FILE\e[m to: \e[1;34m$TO_FILE\e[m -> "
		cp -r $IN_FILE $TO_FILE &> /dev/null
		check_if_moved $IN_FILE $TO_FILE
	done
}

function check_if_moved() {
	if [ -f $1 ]; then
		if [ -f $2 ]; then
			echo -e "\e[1;34m:)\e[m"
		else
			echo -e "\e[1;31m:(\e[m"
			echo "File was not created"
		fi
		return
	fi
	if [ -d $1 ]; then
		if [ -d $2 ]; then
			echo -e "\e[1;34m:)\e[m"
		else
			echo -e "\e[1;31m:(\e[m"
			echo "Folder was not created"
		fi
		return
	fi
	echo -e "\e[1;31m:(\e[m"
	echo "Error: $1 Does not exist"
}

function remove() {
	for item in $@; do
		FILE=$BDIR/$item
		rm -rf $FILE &> /dev/null
	done
}

echo "Saving config files to backup.tar.xz :)"

echo -n "Checking for $BDIR -> "
if [ ! -d "$BDIR" ]; then
	echo -e "\e[1;31m:(\e[m"
	mkdir $BDIR
else
	echo -e "\e[1;34m:)\e[m"
	echo "Clearing dir..."
	remove ${CONF_FILES[*]}
	remove ${CONF_DIRS[*]}
fi


move_to_folder ${CONF_FILES[*]}
move_to_folder ${CONF_DIRS[*]}

echo -n "Creating tar ball -> "
CURRENT_PWD=$PWD
cd $BDIR/
tar -cf $CURRENT_PWD/backup.tar.xz $(find . -type f) &>/dev/null && echo -e "\e[1;34m:)\e[m" ||
	echo -e "\e[1;31m:(\e[m"
cd $CURRENT_PWD

let size=$(du ./backup.tar.xz | cut -f1 -d'	')
echo -n "checking size -> "
(($size < 500000)) && echo -e "\e[1;34m:)\e[m" ||
	echo -e "\e[1;31m:(\nError:\e[m Please consider having a smaller backup file"

scp ./backup.tar.xz $UNAME@$HOST:/var/www/html/rice/backup.tar.xz

echo "All done :)"

exit
