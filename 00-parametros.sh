#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 06/17/2017
# Updated Date: 7/14/2019
# Version: 0.10
# Tested and approved for Ubuntu Server 16.04.x ​​LTS x64 version
# Kernel> = 4.4.x
#
# Parameters (environment variables) used in OCS Inventory, GLPI, FusionInventory, and Netdata installation scripts
#

# Script log path variable used in this course
VARLOGPATH = " / var / log / ocsinstall "
#

# Variable for Script Log File Creation
# echo screen printing | $ 0 file name environment variable | cut -d '/' delimiter -f2 show second column
LOGSCRIPT = ` echo $ 0  | cut -d ' / ' -f2 `
#

# Start Date Variable to calculate Script execution time
# date +% s sets date as seconds
DATAINICIAL = ` date +% s '
#

# Environment Validation Variables, checking user and root, ubuntu version and kernel version
# id -u list user id | lsb_release -rs list distribution version | uname -r list kernel version
# cut -d '.' delimiter -f1,2 show first and second column
USER = ` id -u '
UBUNTU = ` lsb_release -R '
KERNEL = ` uname -r | cut -d ' . ' -f1,2 `
#

# MySQL Server Setup Configuration Variables (USER MySQL root user | PASSWORD Root user password)
USER = " root "
PASSWORD = " 123456 "
#

# PhpMyAdmin Setup Configuration Variables
# ADMINUSER MySQL Admin User | WEBSERVER Web Server for PhpMyAmin Configuration | ADMIN_PASS Password
# MySQL admin user | APP_PASSWORD and APP_PASS PhpMyAdmin Admin Password
ADMINUSER = " root "
WEBSERVER = " apache2 "
ADMIN_PASS = " 123456 "
APP_PASSWORD = " 123456 "
APP_PASS = " 123456 "
#

# OCS Inventory Server and Reports Download Variables
# Site: https://www.ocsinventory-ng.org/en/
# Old version used in video: 2.4 / OCSNG_UNIX_SERVER_2.4.tar.gz
# Version updated to 2.6 on 06/11/2019 - check CHANGELOG file
OCSVERSION = " 2.6 / OCSNG_UNIX_SERVER_2.6.tar.gz "
OCSTAR = " OCSNG_UNIX_SERVER_2.6.tar.gz "
OCSINSTALL = " OCSNG_UNIX_SERVER_2.6 "
#

# OCS Inventory Agent Download Variables
# Site: https://www.ocsinventory-ng.org/en/
# Old version used in video: 2.3 / Ocsinventory-Unix-Agent-2.3.tar.gz
# Version updated to 2.4.2 on 06/13/2019 - check CHANGELOG file
OCSAGENTVERSION = " v2.4.2 / Ocsinventory-Unix-Agent-2.4.2.tar.gz "
OCSAGENTTAR = " Ocsinventory-Unix-Agent-2.4.2.tar.gz "
OCSAGENTINSTALL = " Ocsinventory-Unix-Agent-2.4.2 "
#

# GLPI Help Desk Download Variables
# Site: http://glpi-project.org/spip.php?article41
# Old version used in video: 9.2.1 / glpi-9.2.1.tgz
# Version updated to 9.4.2 on 06/13/2019 - check CHANGELOG file
GLPIVERSION = " 9.4.2 / glpi-9.4.2.tgz "
GLPITAR = " glpi-9.4.2.tgz "
GLPIINSTALL = " glpi "
#

# GLPI OCS Inventory Plugin Download Variables
# Site: https://github.com/pluginsGLPI/ocsinventoryng/releases
# Old version used in video: 1.4.2 / glpi-ocsinventoryng-1.4.2.tar.gz
# Version updated to 1.6.0 on 06/13/2019 - check CHANGELOG file
GLPIOCSVERSION = " 1.6.0 / glpi-ocsinventoryng-1.6.0.tar.gz "
GLPIOCSTAR = " glpi-ocsinventoryng-1.6.0.tar.gz "
GLPIOCSINSTALL = " ocsinventoryng "
#

# FusionInventory Server for GLPI Download Variables
# Site: https://github.com/fusioninventory/fusioninventory-for-glpi/releases
# Old version used in video: glpi9.2% 2B1.0 / glpi-fusioninventory-9.2.1.0.tar.bz2
# Version updated to 9.4 + 1.1 on 06/14/2019 - check CHANGELOG file
GLPIFISVERSION = " glpi9.4% 2B1.1 / fusioninventory-9.4 + 1.1.tar.bz2 "
GLPIFISTAR = " fusioninventory-9.4 + 1.1.tar.bz2 "
GLPIFISINSTALL = " fusioninventory "
#

# FusionInventory Agent Download Variables
# Site: https://github.com/fusioninventory/fusioninventory-agent/releases/
# Old version used in video: 2.4 / FusionInventory-Agent-2.4.tar.gz
# Version updated to 2.5 on 06/14/2019 - check CHANGELOG file
GLPIFIAVERSION = " 2.5 / FusionInventory-Agent-2.5.tar.gz "
GLPIFIATAR = " FusionInventory-Agent-2.5.tar.gz "
GLPIFIAINSTALL = " FusionInventory-Agent-2.5 "
#

# Netdata Download Variables
# Site: https://github.com/firehol/netdata
NETDATAVERSION = " netdata.git "
NETDATAINSTALL = " netdata "
#

# OCS Inventory Reports Password Change Variables in MySQL Database
# 'ocs' @ 'localhost' OCS Inventory Database Administration User | PASSWORD ('123456') new user password ocs
SETOCSPWD = " SET PASSWORD FOR 'ocs' @ 'localhost' = PASSWORD ('123456'); "
FLUSH = " FLUSH PRIVILEGES; "
#

# NVIDIA Graphics Chip Verification Variables
# lshw -class display lists video card information | grep NVIDIA filters lines that have the word NVIDIA
# cut -d ':' delimiter -f2 show second column
NVIDIA = ` lshw -class display | grep NVIDIA | cut -d ' : ' -f2 | cut -d '  ' -f2 `
#

# OCS Inventory Agent Download Variables Microsoft, MacOS, Android, and Deploy Tools
# Site: https://www.ocsinventory-ng.org/en/
# Old versions used in video: Win10-2.3.1.1, WinXP-2.1.1, Mac-2.3.1, Android-2.3.1, Tools-2.3 and Deploy-2.3
# New versions updated on 06/14/2019 - check file CHANGELOG
OCSAGENTWIN10 = " https://github.com/OCSInventory-NG/WindowsAgent/releases/download/2.4.0.0/OCSNG-Windows-Agent-2.4.0.0.zip "
OCSAGENTWINXP = " https://github.com/OCSInventory-NG/WindowsAgent/releases/download/2.1.1.1/OCSNG-Windows-Agent-2.1.1.zip "
OCSAGENTMAC = " https://github.com/OCSInventory-NG/UnixAgent/releases/download/v2.4.2/Ocsinventory_Agent_MacOSX-2.4.2.pkg.zip "
OCSAGENTANDROID = " https://github.com/OCSInventory-NG/AndroidAgent/releases/download/2.3.1/OCSNG-Android-Agent-2.3.1.apk "
OCSAGENTTOOLS = " https://github.com/OCSInventory-NG/Packager-for-Windows/releases/download/2.3/OCSNG-Windows-Packager-2.3.zip "
OCSAGENTDEPLOY = " https://github.com/OCSInventory-NG/Agent-Deployment-Tool/releases/download/2.3/OCSNG-Agent-Deploy-Tool-2.3.zip "
OCSUNIXPACKAGER = " https://github.com/OCSInventory-NG/Packager-for-Unix/releases/download/1.0/OCSNG-Unix-Packager-1.0.zip "

# # OCS Inventory Plugins Download Variables
# Site: https://plugins.ocsinventory-ng.org/
# Plugin01: Installed drivers (Retrieve list of installed drivers - Windows)
DRIVERLIST = " https://github.com/PluginsOCSInventory-NG/driverslist/releases/download/v2.0/driverslist.zip "
# Plugin02: Machine Uptime (Retrieve Machine Uptime - Windows and Linux)
UPTIME = " https://github.com/PluginsOCSInventory-NG/uptime/releases/download/2.0/uptime.zip "
#
