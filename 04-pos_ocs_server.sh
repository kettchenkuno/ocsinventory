#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 18/06/2017
# Updated Date: 06/13/2019
# Version: 0.4
# Tested and approved for Ubuntu Server 16.04 LTS x64 version
# Kernel> = 4.4.x
#
# OCS Inventory Server Post-Installation
#
# Using the command: sudo -i to run the script
#

# Parameter Configuration File
source 00-parametros.sh
#

# Path to script log
LOG = $ VARLOGPATH / $ LOGSCRIPT
#

if [ " $ USER "  ==  " 0 " ]
then
	if [ " $ UBUNTU "  ==  " 16.04 " ]
		then
			if [ " $ KERNEL "  ==  " 4.4 " ]
				then
					 clear
					 
					 echo -e " User is ` whoami ` continuing to run the $ LOGSCRIPT "
					 # Exporting the Debian Frontend Noninteractive Variable to Not Request User Interaction
					 export DEBIAN_FRONTEND = noninteractive
					 echo
					 echo   ================================================= =========== >>  $ LOG

 					 echo -e " Changing the MySQL ocs user password, press <Enter> to continue "
					 read
					 
					 # Changing the ocs user password using mysql command line
					 mysql -u $ USER -p $ PASSWORD -e " $ SETOCSPWD " mysql & >>  $ LOG
					 echo -e " Password changed with success !!! "
					 sleep 2
					 
					 mysql -u $ USER -p $ PASSWORD -e " $ FLUSH " mysql & >>  $ LOG
					 echo -e " Permission changed successfully !!! "
					 sleep 2
					 
					 echo
					 
					 echo -e " Password changed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

 					 echo -e " Removing the install.php file from OCS Reports, press <Enter> to continue "
					 read
					 
					 # Backing up the install.php file
					 mv -v /usr/share/ocsinventory-reports/ocsreports/install.php /usr/share/ocsinventory-reports/ocsreports/install.php.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!!! "
					 sleep 2
					 
					 echo
					 
					 echo -e " File successfully removed !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo -e " Updating OCS Inventory Server Configuration Files "
					 echo
					 echo -e " Editing OCS Inventory Server file z-ocsinventory-server.conf, press <Enter> to continue "
					 read
					 
					 # OCS Inventory Server Configuration File to Receive Client Updates
					 # Backing up the original configuration file
					 mv -v /etc/apache2/conf-available/z-ocsinventory-server.conf /etc/apache2/conf-available/z-ocsinventory-server.conf.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / z-ocsinventory-server.conf / etc / apache2 / conf-available / & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/apache2/conf-available/z-ocsinventory-server.conf
					 
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo -e " Editing OCS Inventory RestApi zz-ocsinventory-restapi.conf file, press <Enter> to continue "
					 read
					 
					 # New OCS Inventory Server Configuration File to Receive Client Updates
					 # Backing up the original configuration file
					 mv -v /etc/apache2/conf-available/zz-ocsinventory-restapi.conf /etc/apache2/conf-available/zz-ocsinventory-restapi.conf.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / zz-ocsinventory-restapi.conf / etc / apache2 / conf-available / & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/apache2/conf-available/zz-ocsinventory-restapi.conf
					 
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Updating OCS Inventory Reports Configuration Files "
					 echo
					 echo -e " Editing OCS Inventory Reports file ocsinventory-reports.conf, press <Enter> to continue "
					 read
					 
					 # OCS Inventory Reports Server Configuration File Responsible for Software Distribution and Reporting
					 # Backing up the original configuration file
					 mv -v /etc/apache2/conf-available/ocsinventory-reports.conf /etc/apache2/conf-available/ocsinventory-reports.conf.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / ocsinventory-reports.conf / etc / apache2 / conf-available / & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/apache2/conf-available/ocsinventory-reports.conf
					 
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Editing OCS Inventory Server DBConfig dbconfig.inc.php file, press <Enter> to continue "
					 read
					 
					 # Configuration File for MySQL Database Connection
					 # Configuration of database user and password variables: database name (ocsweb) and user (ocs)
					 # This file will be recreated again after browser installation
					 # Backing up the original configuration file
					 mv -v /usr/share/ocsinventory-reports/ocsreports/dbconfig.inc.php /usr/share/ocsinventory-reports/ocsreports/dbconfig.inc.php.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / dbconfig.inc.php / usr / share / ocsinventory-reports / ocsreports / & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /usr/share/ocsinventory-reports/ocsreports/dbconfig.inc.php
					 
					 # Rebooting Apache2
					 sudo service apache2 restart
					 echo -e " Apache2 successfully rebooted !!! "
					 sleep 2
					 
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo ================================================= =========== >>  $ LOG

					 echo -e " End of $ LOGSCRIPT on: ` date ` "  >>  $ LOG
					 echo -e " OCS Inventory Server Post-Installation Finish Successfully Done !!!!! "
					 echo
					 # Script to calculate the time it takes to execute ocs_server.sh
						 FinalDate = ` date +% s '
						 SOMA = ` expr $ FinalDate - $ DATAINICIAL '
						 RESULT = ` expr 10800 + $ SOMA `
						 TIME = ` date -d @ $ RESULT +% H:% M:% S`
					 echo -e " Time taken to execute ocs_server.sh: $ TIME "
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
