#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 05/31/2016
# Updated Date: 06/11/2019
# Version: 0.14
# Tested and approved for Ubuntu Server 16.04 LTS x64 version
# Kernel> = 4.4.x
#
# OCS Inventory Server Installation
# Installing OCS Inventory Reports
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
					 
					 echo -e " After installation, go to url: http: // ` hostname ` / ocsreports and finish the installation "
					 echo -e " Default user after installation: admin | Default password: admin "
					 echo
					 
					 echo -e " Download OCS Inventory Server from Github, press <Enter> to continue "
					 read
					 sleep 2
					 echo -e " Wait, downloading OCS Inventory ... "
					 
					 # Downloading OCS Inventory Server Source Code
					 wget https://github.com/OCSInventory-NG/OCSInventory-ocsreports/releases/download/ $ OCSVERSION  & >>  $ LOG
					 echo -e " Downloaded successfully !!!! "
					 sleep 2
					 
					 # Unzipping the OCS Inventory Server Files
					 tar -zxvf $ OCSTAR  & >>  $ LOG
					 echo -e " File unzipped successfully !!!! "
					 sleep 2
					 
					 # Accessing the OCS Inventory Server Folder
					 cd  $ OCSINSTALL
					 echo -e " Folder successfully accessed !!!! "
					 sleep 2
					 
					 echo
					 echo -e " CAUTION !!! with the options that will be requested during the installation. "
					 echo -e " Successfully download OCS Inventory Server !!!, press <Enter> to install "
					 echo
					 read
					 clear
					 
					 # Performing OCS Inventory Server and Reports Setup
					 ./setup.sh
					 
					 # MESSAGES TO BE REQUESTED IN OCS INVENTORY SERVER INSTALLATION:
					 # 01. Do you wish to continue ([y] / n): y <- type y press <Enter>;
					 # 02. Which host is running database server [localhost] ?: Leave the default press <Enter>;
					 # 03. On which port is running database server [3306] ?: Leave the default press <Enter>;
					 # 04. Where is Apache binary daemon [/ usr / sbin / apache2ctl] ?: Leave the default press <Enter>;
					 # 05.Where is Apache main configuration file [/etc/apache2/apache2.conf] ?: Leave the default press <Enter>;
					 # 06. Which user account is running Apache Web Server [www-data] ?: Leave the default press <Enter>;
					 # 07. Which user group is running Apache web server [www-data] ?: Leave the default press <Enter>;
					 # 08.Where is Apache Include configuration directory [/ etc / apache2 / conf-available] ?: Leave the default press <Enter>;
					 # 09. Where is PERL Intrepreter binary [/ usr / bin / perl] ?: Leave the default press <Enter>;
					 # 10. Do you wish to setup Communication server on this computer ([y] / n) ?: y <- type y press <Enter>;
					 # 11. Where to put Communication server log directory [/ var / log / ocsinventory-server] ?: Leave the default press <Enter>;
					 # 12. Where to put Communication server plugins configuration files [/ etc / ocsinventory-server / plugins] ?: Leave the default press <Enter>;
					 # 13. Where to put Communication server plugins Perl module files [/ etc / ocsinventory-server / perl] ?: Leave the default press <Enter>;
					 # 14. Do you wish to setup Rest API server on this computer ([y] / n) ?: y <- type y press <Enter>;
					 # 15. Where do you want the API code to be store [/usr/local/share/perl/5.22.1] ?: Leave the default press <Enter>;
					 # 16. Do you allow Setup renaming Communication Server Apache configuration file to 'z-ocsinventory-server.conf' ([y] / n) ?: y <- type y press <Enter>;
					 # 17. Do you wish to setup Administration Server (Web Administration Console) on this computer ([y] / n) ?: y <- type y press <Enter>;
					 # 18. Do you wish to continue ([y] / n) ?: y <- type y press <Enter>;
					 # 19. Where to copy Administration Server static files for PHP Web Console [/ usr / share / ocsinventory-reports] ?: Leave the default press <Enter>;
					 # 20. Where to create writable / cache directories for deployment packages administration console logs, IPDiscover and SNMP [/ var / lib / ocsinventory-reports] ?: Leave the default press <Enter>;
					 # AFTER INSTALLATION BY NAVIGATOR, REMOVE FILE install
					 
					 echo
					 # Updating Apache2 information for OCS Inventory Server and Reports support
					 a2disite 000-default & >>  $ LOG
					 echo -e " Apache 2 successfully updated !!! "
					 sleep 2
					 
					 echo
					 # Enabling OCS Inventory Reports conf in Apache2
					 a2enconf ocsinventory-reports & >>  $ LOG
					 echo -e " OCS Inventory Reports Virtual Host Successfully Enabled !!! "
					 sleep 2
					 
					 echo
					 # Enabling OCS Inventory Server conf on Apache2
					 a2enconf z-ocsinventory-server & >>  $ LOG
					 echo -e " OCS Inventory Server Virtual Host Successfully Enabled !!! "
					 sleep 2
					 
					 echo
					 # Changing the permissions of the / var / lib / ocsinventory-reports directory
					 chmod -Rv 775 / var / lib / ocsinventory-reports / & >>  $ LOG
					 echo -e " OCS Inventory Reports permissions changed successfully !!! "
					 sleep 2
					 
					 echo
					 # Changing the Default Owner and Group of the / var / lib / ocsinventory-reports Directory
					 chown -rv www-data.www-data / var / lib / ocsinventory-reports / & >>  $ LOG
					 echo -e " OCS Inventory Reports Owner / Group changed successfully !!! "
					 sleep 2
					 
					 echo
					 # Rebooting Apache2
					 sudo service apache2 restart
					 echo -e " Apache 2 successfully rebooted !!! "
					 sleep 2
					 
					 # Backing up the OCS Inventory Setup Log File
					 cp -v * .log $ VARLOGPATH / & >>  $ LOG
					 echo -e " OCS Inventory Installation Log Backup Successfully Made !!! "
					 
					 # Leaving the OCS Inventory Server Directory
					 cd ..
					 
					 echo
					 echo -e " Installation of OCS Inventory Server and Reports Service was successful !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 				 
					 echo -e " Removing unnecessary applications, please wait ... "
					 
					 # Removing Unused Files
					 apt-get autoremove & >>  $ LOG
					 
					 echo -e " Apps successfully removed !!!, continuing with the script !!! "
					 echo
					 echo ================================================= =========== >>  $ LOG

					 echo -e " Clearing Apt-Get Cache, please wait ... "
					 
					 # Clearing apt-get cache directory
					 apt-get clean & >>  $ LOG
					 
					 echo -e " Cache Cleaned Successfully !!! "
					 echo
					 echo ================================================= =========== >>  $ LOG

					 echo -e " End of $ LOGSCRIPT on: ` date ` "  >>  $ LOG
					 echo -e " Installing OCS Inventory Server Successfully !!!!! "
					 echo -e " After rebooting, go to URL: http: // ` hostname ` / ocsreports to finish the installation "
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
