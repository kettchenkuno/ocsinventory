#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 05/31/2016
# Updated Date: 07/15/2019
# Version: 12:22
# Tested and approved for Ubuntu Server 16.04.x ​​LTS x64 version
# Kernel> = 4.4.x
#
# LAMP Server Installation
# Apache2 Installation
# MySQL Server Installation
# PhpMyAdmin Installation
# PHP installation, Perl, Python
# Perl CPAN Installation
# Installing Netdata Dependencies
#
# This script is installing all OCS Inventory Server, OCS Inventory Agent, Fusion Iventory,
# GLPI and Netdata;
# In apt-get install lines all dependencies are already being installed;
# In the perl -e -MCPAN lines the OCS Server and Agent dependencies are being installed.
#
# Using the command: sudo -i to run the script
#

# Parameter Configuration File
source 00-parametros.sh
#

# Path to script log file
LOG = $ VARLOGPATH / $ LOGSCRIPT
# h

if [ " $ USER "  ==  " 0 " ]
then
	if [ " $ UBUNTU "  ==  " 16.04 " ]
		then
			if [ " $ KERNEL "  ==  " 4.4 " ]
				then
					 clear
					 echo -e " User is ` whoami ` continuing to run the $ LOGSCRIPT "
					 echo
					 echo   ================================================= =========== >>  $ LOG
					 
					 echo -e " Updating Apt-Get lists, please wait ... "
					 
					 # Exporting the Debian Frontend Noninteractive Variable to Not Request User Interaction
					 export DEBIAN_FRONTEND = noninteractive
					 
					 # Updating apt-get lists
					 apt-get update & >>  $ LOG 
					 
					 echo -e " Lists updated successfully !!!, continuing with the script. "
					 echo
					 echo   ================================================= =========== >>  $ LOG

					 echo -e " Installing LAMP Server (Linux, Apache2, MySQL, PHP7, Perl, Python), please wait ... "
					 
					 # Installation of core OCS Inventory and GLPI packages integrated with Apache2 and MySQL
					 # Setting Debconf Variables for Noninteractive MySQL Installation
					 echo  " mysql-server-5.7 mysql-server / root_password password $ PASSWORD "  |   debconf-set-selections
					 echo  " mysql-server-5.7 mysql-server / root_password_again password $ PASSWORD "  |   debconf-set-selections
					 
					 # Installing the full LAMP Server and all of its OCS Inventory Server, Agent, GLPI Help Desk, and Netdata dependencies
					 apt-get -y install lamp-server ^ gcc make autoconf autogen automake pkg-config uuid-dev net-tools pciutils smartmontools \
					 read-edid nmap ipmitool dmidecode samba samba-common samba-testsuite snmp snmp-mibs-downloader unzip hwdata perl \
					 perl-modules python python-dev python3-dev python-pip apache2-dev mysql-client python-pymssql python-mysqldb & >>  $ LOG
					 
					 echo -e " LAMP Server installation was successful !!!, continuing with the script. "
					 echo
					 echo   ================================================= =========== >>  $ LOG
					 
					 echo -e " Installing PHP7 dependencies, wait ... "
					 					 
					 # Installing PHP7 dependencies to support extra features
					 apt-get -y install php7.0-snmp php-mysql php7.0-dev php-mbstring php-soap php-dev php-apcu php-xmlrpc php7.0-zip \
					 php7.0-gd php7.0-mysql php-pclzip php7.0-json php7.0-mbstring php7.0-curl php7.0-imap php7.0-ldap zlib1g-dev \
					 php-mbstring php-gettext php-cas & >>  $ LOG
					 
					 echo -e " PHP7 dependencies installed successfully !!!, continuing with the script. "
					 echo
					 echo   ================================================= =========== >>  $ LOG
					 
					 echo -e " Installing Perl dependencies, please wait ... "
					 					 
					 # Installing Perl and GCC dependencies to support OCS Inventory and GLPI extra features
					 apt-get -y install libc6-dev libcompress-raw-zlib-perl libwww-perl libdigest-md5-file-perl libnet-ssleay-perl \
					 libcrypt-ssleay-perl libnet-snmp-perl libproc-pid-file-perl libproc-daemon-perl libarchive-zip-perl \
					 libnet-cups-perl libphp-pclzip libmysqlclient-dev libapache2-mod-perl2 libapache2-mod-php libnet-netmask-perl \
					 libio-compress-perl libxml-simple-perl libdbi-perl libdbd-mysql-perl libapache-dbi-perl libsoap-lite-perl \
					 libnet-ip-perl libmodule-build-perl libmodule-install-perl libfile-which-perl libfile-copy-recursive-perl \
					 libuniversal-require-perl libtest-http-server-simple-perl libhttp-server-simple-authen-perl libhttp-proxy-perl \
					 libio-capture-perl libipc-run-perl libnet-telnet-cisco-perl libtest-compile-perl libtest-deep-perl \
					 libtest-exception-perl libtest-mockmodule-perl libtest-mockobject-perl libtest-nowarnings-perl \
					 libxml-treepp-perl libparallel-forkmanager-perl libparse-edid-perl libdigest-sha-perl libtext-template-perl \
					 libsocket-getaddrinfo-perl libcrypt-des-perl libnet-nbname-perl libyaml-perl libyaml-shell-perl \
					 libyaml-libyaml-perl libdata-structure-util-perl liblwp-useragent-determined-perl libio-socket-ssl-perl \
					 libdatetime-perl libthread-queue-any-perl libnet-write-perl libarchive-extract-perl libjson-pp-perl \
					 liburi-escape-xs-perl liblwp-protocol-https-perl libnet-ping-external-perl libnmap-parser-perl \
					 libmojolicious-perl libswitch-perl libplack-perl liblwp-useragent-determined-perl libsys-syslog-perl \
					 libdigest-hmac-perl libossp-uuid-perl & >>  $ LOG
					 
					 echo -e " Perl dependencies installed successfully !!!, continuing with the script. "
					 echo
					 echo   ================================================= =========== >>  $ LOG

					 echo -e " Installing PhpMyAdmin, wait ... "
					 
					 # Setting Debconf Variables for Installing PhpMyAdmin in Noninteractive Mode
					 echo  " phpmyadmin phpmyadmin / internal / skip-preseed boolean true "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / dbconfig-install boolean true "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / app-password-confirm password $ APP_PASSWORD "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / reconfigure-webserver multiselect $ WEBSERVER "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / mysql / admin-user string $ ADMINUSER "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / mysql / admin-pass password $ ADMIN_PASS "  |   debconf-set-selections
					 echo  " phpmyadmin phpmyadmin / mysql / app-pass password $ APP_PASS "  |   debconf-set-selections
					 
					 # Installing PhpMyAdmin
					 apt-get -y install phpmyadmin & >>  $ LOG
					 
					 # Updating PhpMyAdmin dependencies by enabling features of PHP modules in Apache2
					 phpenmod mcrypt
					 phpenmod mbstring
					 
					 echo -e " PhpMyAdmin successfully installed !!! "
					 echo
					 
					 echo -e " After rebooting, test the Apache2 server at the URL: http: // ` hostname ` "
					 echo -e " After reboot, test PHP at URL: http: // ` hostname ` /phpinfo.php "
					 echo -e " After rebooting, test PhpMyAdmin at the URL: http: // ` hostname ` / phpmyadmin "
					 echo
					 
					 echo -e " Press <Enter> to continue the script. "
					 read
					 sleep 2
					 clear
					 echo ================================================= =========== >>  $ LOG

					 echo -e " Perl XML :: Entities dependencies installation via CPAN, press <Enter> to continue "
					 read
					 
					 # Installing the XML :: Entities
					 # Message: Would you like to configure as much as possible automatically? [Yes] <- Press <Enter>
					 perl -MCPAN -e ' install XML :: Entities '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Installing Perl SOAP :: Lite Dependencies via CPAN, press <Enter> to continue "
					 read
					 
					 # SOAP :: Lite Installation
					 # Message: WARNING: Please tell me where I can find your apache src: <- type q Press <Enter>
					 # This procedure takes a while, do not worry about the error message at the end, is associated with Source
					 # from Apache
					 perl -MCPAN -e ' install SOAP :: Lite '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo -e " Installing Perl Linux :: Ethtool Dependencies via CPAN, press <Enter> to continue "
					 read
					 
					 # Installing Linux :: Ethtool
					 perl -MCPAN -e ' install Linux :: Ethtool '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo -e " Installing Perl Apache2 :: SOAP Dependencies via CPAN, Press <Enter> to continue "
					 read
					 
					 # Validating the Apache2 Directory Existence
					 if [ -d / usr / include / apache2] ;  then
					 	echo -e " / usr / include / apache2 directory already exists, continuing with script "
					 else
					 	echo -e " / usr / include / apache2 directory does not exist, creating directory "
					 	
							# Creating the SOAP Directory for Apache2
					 		mkdir -v / usr / include / apache2 & >>  $ LOG
					 	
						echo -e " Directory successfully created !!!, continuing script "
						echo
					 fi
					 
					 # Apache2 :: SOAP Installation				 
					 perl -MCPAN -e ' install Apache2 :: SOAP '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear

					 echo -e " Installing Perl dependencies :: ml via CPAN, press <Enter> to continue "
					 read
					 
					 # Validating the NVIDIA Graphics Chip
					 if [ " $ NVIDIA "  ==  " NVIDIA " ] ;  then
					 	echo -e " You have the NVIDIA Graphics Chip, installing the Perl Module, press <Enter> to continue "
							read
					 		
							# Nvidia :: ml installation
					 		perl -MCPAN -e ' install nvidia :: ml '
							
							echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 		read
					 		sleep 2
					 		clear
					 else
					 	echo -e " You do not have the NVIDIA Graphics Chip, press <Enter> to continue "
							read
					 		sleep 2
					 		clear
					 fi

					 echo -e " Installing Perl Net :: Ping Dependencies via CPAN, press <Enter> to continue "
					 read
					 
					 # Net :: Ping Installation					 
					 perl -MCPAN -e ' install Net :: Ping '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 					 
					 echo -e " Installing LWP :: UserAgent :: Cached Dependencies via CPAN, press <Enter> to continue "
					 read
					 
					 # LWP :: UserAgent :: Cached Installation
					 # Message: Append this modules to installaation queue? [y] <- Press <Enter>
					 perl -MCPAN -e ' install LWP :: UserAgent :: Cached '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 					 
					 echo -e " Installing Mac :: SysProfile Dependencies via CPAN, Press <Enter> to continue "
					 read
					 
					 # Mac Installation :: SysProfile
					 perl -MCPAN -e ' install Mac :: SysProfile '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Installing Mojolicious :: Lite Dependencies via CPAN, press <Enter> to continue "
					 read
					 
					 # Mojolicious :: Lite Installation
					 perl -MCPAN -e ' install Mojolicious :: Lite '
					 echo
					 
					 echo -e " Installation completed successfully !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo ================================================= =========== >>  $ LOG

					 echo -e " Editing Apache2 file, press <Enter> to continue "
					 read
					 
					 # Backing up the original file
					 mv -v /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bkp >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Update Apache2 configuration file
					 cp -v conf / apache2.conf /etc/apache2/apache2.conf >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/apache2/apache2.conf
					 
					 # Restarting the Apache2 Server Service
					 sudo service apache2 restart
					 echo -e " Server rebooted successfully !!! "
					 sleep 2
					 
					 echo
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Editing MySQL Server file, press <Enter> to continue "
					 read
					 
					 # MySQL Server Database Configuration File
					 # Allow remote access to MySQL by commenting the line: bind-address
					 # Backing up the original configuration file
					 mv -v /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / mysqld.cnf /etc/mysql/mysql.conf.d/ & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/mysql/mysql.conf.d/mysqld.cnf
					 
					 # Rebooting the MySQL Server Service
					 sudo service mysql restart
					 echo -e " Server rebooted successfully !!! "
					 sleep 2
					 
					 echo
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Editing PHP file, press <Enter> to continue "
					 read
					 
					 # PHP configuration file that will be used by Apache2
					 # Increase variable values: post_max_size and upload_max_filesize to: 250MB
					 # Backing up the original configuration file
					 mv -v /etc/php/7.0/apache2/php.ini /etc/php/7.0/apache2/php.ini.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration files
					 cp -v conf / php.ini /etc/php/7.0/apache2/ & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/php/7.0/apache2/php.ini
					 
					 # Rebooting the Apache2 Service
					 sudo service apache2 restart
					 echo -e " Server rebooted successfully !!! "
					 sleep 2
					 
					 echo
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Creating PHP verification file, please wait ... "
					 cp -v conf / phpinfo.php / var / www / html & >>  $ LOG
					 echo -e " File created successfully !!!, continuing script "
					 echo

					 echo -e " Removing unnecessary applications, please wait ... "
					 
					 # Clearing apt-get cache directory
					 apt-get autoremove & >>  $ LOG
					 apt-get autoclean & >>  $ LOG
					 
					 echo -e " Apps successfully removed !!!, continuing with script "
					 echo
					 echo ================================================= =========== >>  $ LOG

					 echo -e " Clearing Apt-Get Cache, please wait ... "
					 
					 # Clearing apt-get cache directory
					 apt-get clean & >>  $ LOG
					 
					 echo -e " Cache Cleaned Successfully !!! "
					 echo
					 echo ================================================= =========== >>  $ LOG

					 echo -e " End of $ LOGSCRIPT on: ` date ` "  >>  $ LOG
					 echo -e " LAMP Server Installation Succeeded !!!!! "
					 echo
					 # Script to calculate the time it takes to execute lamp.sh
						 FinalDate = ` date +% s '
						 SOMA = ` expr $ FinalDate - $ DATAINICIAL '
						 RESULT = ` expr 10800 + $ SOMA `
						 TIME = ` date -d @ $ RESULT +% H:% M:% S`
					 echo -e " Time taken to execute lamp.sh: $ TIME "
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
