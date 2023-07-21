



# Checking whether script is being run as root

shuttingdown_after = false

if [[ ${UID} != 0 ]]; then
    echo "
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi

while getopts ":sh" opt; do
  case ${opt} in
    h )
      echo "
      This script will update and upgrade your system.

      options:
      -s  shutdown after update and upgrade
      "
      exit 0
      ;;
    s )
      shuttingdown_after = true
      ;;
    \? )
      echo "
      Invalid Option: -$OPTARG
      "
      exit 1
      ;;
  esac
done

echo "
##################################################
#                updating  files                #
##################################################
"

apt-get update | tee /tmp/update-shutdown.txt


echo "
##################################################
#               upgrading  programs              #
##################################################
"

apt-get upgrade -y | tee -a /tmp/update-shutdown.txt


echo "
##################################################
#             full-upgrading programs            #
##################################################
"
apt-get full-upgrade -y | tee -a /tmp/update-shutdown.txt

echo "
##################################################
#               autoremove programs              #
##################################################
"

apt autoremove -y

echo "
##################################################
#                    apt clean                   #
##################################################
"

apt-get clean | tee -a /tmp/update-shutdown.txt

echo "
##################################################
#               apt clean complete               #
##################################################
"

if [ -f "/tmp/update-shutdown.txt"  ]

then


  echo "
##################################################
#  Checking for actionable messages from install #
##################################################
"
  egrep -wi --color 'warning|error|critical|reboot|restart|autoclean|autoremove' /tmp/update-shutdown.txt | uniq
echo"
##################################################    
#               Cleaning temp files              #
##################################################
"

  rm /tmp/update-shutdown.txt
  echo "
##################################################
#                Done with upgrade               #
##################################################
"
fi
if [ $shuttingdown_after = true ]
 echo "
##################################################
#                   shutingDown                  #
##################################################
"
shutdown
fi
exit 0