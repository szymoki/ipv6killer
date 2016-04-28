#!/bin/bash
#"---------------------------"
#"-   IPv6 Killer for Linux  -"
#"-    created by szymoki   -"
#"-       2016-04-24        -"
#"-  szymoki@icloud.com     -" 
#"---------------------------"


#sprawdzanie czy jestes rootem
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo "---------------------------"
echo "-   IPv6 Killer for Linux  -"
echo "-    created by szymoki   -"
echo "-       2016-04-24        -"
echo "-   szymoki@icloud.com    -"
echo "---------------------------"
echo ""
echo "Short descripton:"
echo "IPv6 Killer for Linux is a program,"
echo "which turns off IPv6 for better network connetion."
echo "This program adds command to grub startup file"
echo "and turns off IPv6 defenitely"
echo ""
#pytanie czy wykonywac dalej skrypt
read -r -p "Do you want to turn off IPv6? You do it for your own risk. [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
        echo "I'm starting to execute script..."
	sleep 1
	echo "Inserting command to grub file..."
	sleep 1
	#Komenda dodajaca linijke do gruba 
	echo "">>/etc/default/grub
	echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1"' >> /etc/default/grub 	
	echo "[OK] Inserted..."
	sleep 1
	echo "Updating grub..."
	sleep 1
	grub2-mkconfig -o /boot/grub2/grub.cfg
	echo "[OK] Updated"
	sleep 1
	echo "Computer must be rebooted to apply changes."
	read -r -p "Do you want to reboot system now? [Y/n] " response
		case $response in
    			[yY][eE][sS]|[yY]) 
        	#reboot systemy
		echo "Restarting system..."
		sleep 1
		echo "Bye Bye. Thanks for use my script"
		sleep 1
		reboot
        	;;
    	*)	
		echo "Bye Bye. Thanks for use my script"
		sleep 1
		echo "exiting..."
        	;;
	esac
	#koniec if2
        ;;
    *)
	echo "exiting..."
        exit
        ;;
esac

