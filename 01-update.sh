#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 05/31/2016
# Updated Date: 06/11/2019
# Version: 0.14
# Tested and approved for Ubuntu Server 16.04.x ​​LTS x64 version
# Kernel> = 4.4.x
#
# Installation of core packages for the first step, suitable for GNU / Linux distribution Ubuntu Server 16.04.x ​​LTS x64
#
# Update Apt-Get Lists
# Update Installed Applications
# Ubuntu Server Distribution (Kernel) Update
# Apt-Get Self Cleaning
# Apt-Get Local repository cleanup
# Server Reboot
#
# Using the command: sudo -i to run the script
#

# Parameter Configuration File
source 00-parametros.sh
#

# File path to Script log
LOG = $ VARLOGPATH / $ LOGSCRIPT
#

# Verify log directory creation, used only in update script
if [ -e  " $ VARLOGPATH " ] ;  then
	echo -e " Directory: $ VARLOGPATH already exists, continuing with script "
	sleep 3
else
	echo -e " Directory: $ VARLOGPATH does not exist, creating directory ... "
	mkdir $ VARLOGPATH
	echo -e " Directory successfully created !!!, continuing with script "
	sleep 3
fi


if [ " $ USER "  ==  " 0 " ]
then
	if [ " $ UBUNTU "  ==  " 16.04 " ]
		then
			if [ " $ KERNEL "  ==  " 4.4 " ]
				then
					 clear
					 echo -e " User is ` whoami ` continuing to run the $ LOGSCRIPT "
					 echo
					 echo -e " Apt-Get List Update "
					 echo -e " Installed Applications Update "
					 echo -e " Ubuntu Server (Kernel) Distribution Update "
					 echo -e " Removing unnecessary applications "
					 echo -e " Cleaning up the local Apt-Get (Cache) repository "
					 echo
					 echo -e " Upon termination the Server will reboot "
					 echo
					 echo   ================================================= =========== >>  $ LOG
					 
					 echo -e " Updating Apt-Get lists, please wait ... "
					 
					 # Exporting the Debian Frontend Noninteractive Variable to Not Request User Interaction
					 export DEBIAN_FRONTEND = noninteractive
					 
					 # Updating apt-get lists
					 apt-get update & >>  $ LOG
					 
					 echo -e " Lists updated successfully !!!, continuing the script "
					 echo
					 echo   ================================================= =========== >>  $ LOG

					 echo -e " Updating installed packages, please wait ... "
					 
					 # Upgrading All Packages Installed on the Server
					 apt-get -o Dpkg :: Options :: = " --force-confold " upgrade -q -y --force-yes & >>  $ LOG
					 
					 echo -e " Packages updated successfully !!!, continuing the script "
					 echo
					 echo   ================================================= =========== >>  $ LOG

					 echo -e " Updating distribution is Kernel, please wait ... "
					 echo -e " Current kernel: ` uname -r ` "
					 
					 # Upgrading Distribution and Kernel
					 apt-get -o Dpkg :: Options :: = " --force-confold " dist-upgrade -q -y --force-yes & >>  $ LOG
					 
					 echo
					 echo -e " Updated distribution and kernel, installed versions. "
					 # Listing installed packages, filtering by words, cutting by columns.
					 dpkg --list | grep linux-image-4.4 | cut -d '  ' -f 3
					 
					 echo -e " Distribution and Kernel updated successfully !!!, continuing with script "
					 echo
					 echo ================================================= =========== >>  $ LOG

					 echo -e " Removing unnecessary applications, please wait ... "
					 
					 # Auto-removing installed apps
					 apt-get -y autoremove & >>  $ LOG
					 apt-get -y autoclean & >>  $ LOG
					 
					 echo -e " Application removal completed successfully !!!, continuing with script "
					 echo
					 echo ================================================= =========== >>  $ LOG
					 echo  >>  $ LOG
					 
					 echo -e " Clearing Apt-Get cache, please wait ... "
					 
					 # Clearing apt-get cache directory
					 apt-get clean & >>  $ LOG
					 
					 echo -e " Cache successfully cleared !!! continuing script "
					 echo
					 echo ================================================= =========== >>  $ LOG
					 echo  >>  $ LOG
					 echo -e " End of $ LOGSCRIPT on: ` date ` "  >>  $ LOG

					 echo
					 echo -e " List Update, Application Update and Kernel Update Succeeded !!!!! "
					 echo
					 # Script to calculate the time taken to execute
						 FinalDate = ` date +% s '
						 SOMA = ` expr $ FinalDate - $ DATAINICIAL '
						 RESULT = ` expr 10800 + $ SOMA `
						 TIME = ` date -d @ $ RESULT +% H:% M:% S`
					 echo -e " Time taken to execute 01-update.sh: $ TIME "
					 echo -e " Press <Enter> to reboot the server: ` hostname ` "
					 read
					 sleep 2
					 reboot
					 else
						 echo -e " Kernel Version: $ KERNEL not approved for this script, version:> = 4.4 "
						 echo -e " Press <Enter> to end script "
						 read
			fi
	 	 else
			 echo -e " GNU / Linux Distribution: ` lsb_release -is ` not approved for this script, version: $ UBUNTU "
			 echo -e " Press <Enter> to end script "
			 read
	fi
else
	 echo -e " User is not ROOT, run the command with the option: sudo -i <Enter> then enter the user's password ` whoami ` "
	 echo -e " Press <Enter> to end script "
	read
fi
