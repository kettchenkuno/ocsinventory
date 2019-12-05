#! / bin / bash
# Author: Robson Vaamonde
# Site: www.procedimentosemti.com.br
# Facebook: facebook.com/ProcedimentosEmTI
# Facebook: facebook.com/BoraParaPratica
# YouTube: youtube.com/BoraParaPratica
# Date created: 05/31/2016
# Updated Date: 01/04/2018
# Version: 0.12
# Tested and approved for Ubuntu Server 16.04 LTS x64 version
# Kernel> = 4.4.x
#
# OCS Inventory Agent Installation
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
					 
					 
					 echo -e " Download Github OCS Inventory Agent, press <Enter> to continue "
					 read
					 sleep 2
					 
					 # Downloading OCS Inventory Agent Source Code
					 wget https://github.com/OCSInventory-NG/UnixAgent/releases/download/ $ OCSAGENTVERSION  & >>  $ LOG
					 echo -e " Downloaded successfully !!! "
					 sleep 2
					 
					 # Unzipping the OCS Inventory Agent Files
					 tar -zxvf $ OCSAGENTTAR  & >>  $ LOG
					 echo -e " Unzipping successfully !!! "
					 sleep 2
					 
					 # Accessing the OCS Inventory Agent Folder
					 cd  $ OCSAGENTINSTALL
					 echo -e " Accessing the OCS Inventory Agent Folder "
					 sleep 2
					 
					 # Creating the OCS Inventory Agent Log Directory
					 mkdir -v / var / log / ocsinventory-agent / & >>  $ LOG
					 echo -e " Log directory creation succeeded !!! "
					 sleep 2
					 
					 # Creating the OCS Inventory Agent Log File
					 touch /var/log/ocsinventory-agent/activity.log
					 echo -e " Creating the log file successfully !!! "
					 sleep 2
					 
					 echo -e " Downloading OCS Inventory Agent Successfully !!!, press <Enter> to continue. "
					 echo
					 echo -e " CAUTION !!! with the options that will be requested during the installation. "
					 read
					 clear
					 
					 # Configuring the OCS Inventory Agent Makefile.PL File
					 perl Makefile.PL & >>  $ LOG
					 
					 # Compiling OCS Inventory Agent
					 make & >>  $ LOG
					 
					 # Installing OCS Inventory Agent
					 make install
					 
					 # MESSAGES TO BE REQUESTED AT OCS INVENTORY AGENT INSTALLATION:
					 #
					 # 01: Please enter 'y' or 'n'?> [Y] <- press <Enter>
					 # 02: Where do you want to write the configuration file? <- type 2 press <Enter>
					 # 03: Do you want to create the directory / etc / ocsinventory-agent? <- press <Enter>
					 # 04: Should the ond linux_agent settings be imported? <- press <Enter>
					 # 05: What is the address of your ocs server? type: http: // localhost / ocsinventory, press <Enter>
					 # 06: Do you need credential for the server? (You probably don't) <- press <Enter>
					 # 07: Do you want to apply an administrative tag on this machine? <- press <Enter>
					 # 08: tag?> Type: server, press <Enter>
					 # 09: Do you want to install the cron task in /etc/cron.d? <- press <Enter>
					 # 10: Where do you want the agent to store its files? <- press <Enter>
					 # 11: Do you want to create the? <- press <Enter>
					 # 11: Should I remove the old linux_agent? <- press <Enter>
					 # 12: Do you want to activate debug configuration option? <- press <Enter>
					 # 13: Do you want to use OCS Inventory NG Unix Unified agent log file? <- press <Enter>
					 # 14: Specify log file path you want to use?> Type: /var/log/ocsinventory-agent/activity.log, press <Enter>
					 # 15: Do you want to disable SSL CA verification configuration option (not recommended)? type: y, press <Enter>
					 # 16: Do you want to set CA certificate chain file path? type: n, press <Enter>
					 # 17: Do you want to use OCS-Inventory software deployment feature? <- press <Enter>
					 # 18: Do you want to use OCS-Inventory SNMP scans features? <- press <Enter>
					 # 19: Do you want to send an inventory of this machine? <- press <Enter>
					 
					 # Leaving the OCS Inventory Agent Directory
					 cd ..
					 
					 echo
					 echo -e " Successful OCS Inventory Agent installation, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Editing OCS Inventory Agent file, press <Enter> to continue "
					 read
					 
					 # OCS Inventory Agent Configuration File (Client)
					 # Backing up the original configuration file
					 mv -v /etc/ocsinventory-agent/ocsinventory-agent.cfg /etc/ocsinventory-agent/ocsinventory-agent.cfg.bkp & >>  $ LOG
					 echo -e " Backup made successfully !!! "
					 sleep 2
					 
					 # Upgrading to new configuration file
					 cp -v conf / ocsinventory-agent.cfg / etc / ocsinventory-agent / & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/ocsinventory-agent/ocsinventory-agent.cfg
					 
					 # Forcing ocsinventory-agent to update
					 ocsinventory-agent
					 echo -e " Agent updated successfully !!! "
					 sleep 2
					 
					 echo -e " File successfully edited !!!, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " Editing OCS Inventory Agent Schedule file, press <Enter> to continue "
					 read
					 
					 # Upgrading to new configuration file
					 cp -v conf / ocsinventory-agent-cron /etc/cron.d/ocsinventory-agent & >>  $ LOG
					 echo -e " Update was successful !!! "
					 sleep 2
					 
					 # Editing the configuration file
					 vim /etc/cron.d/ocsinventory-agent
					 
					 echo -e " File successfully edited, press <Enter> to continue "
					 read
					 sleep 2
					 clear
					 
					 echo -e " End of $ LOGSCRIPT on: ` date ` "  >>  $ LOG
					 echo -e " Successful OCS Inventory Agent Installation !!!!! "
					 echo
					 # Script to calculate the time it takes to execute ocs_agent.sh
						 FinalDate = ` date +% s '
						 SOMA = ` expr $ FinalDate - $ DATAINICIAL '
						 RESULT = ` expr 10800 + $ SOMA `
						 TIME = ` date -d @ $ RESULT +% H:% M:% S`
					 echo -e " Time taken to execute ocs_agent.sh: $ TIME "
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
