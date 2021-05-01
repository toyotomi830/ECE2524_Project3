#!/bin/bash
function mainMenu() {
  echo "---------------------------"
  echo -e "\tMain Menu"
  echo "---------------------------"
  echo -e "1. Operating system info\n2. Hostname and DNS info\n3. Network info\n4. Who is online\n5. Last logged in users\n6. My IP address\n7. My disk usage\n8. My home file-tree\n9. File operations\n10. Exit"
  echo -e "Enter your choice [ 1 - 10] \c"
}

function osInfo() {
  echo "---------------------------"
  echo -e "\tSystem information"
  echo "---------------------------"
  echo -e "Operating system : \c"
  uname
  /usr/bin/lsb_release -a
}

function hostDns() {
  echo "---------------------------"
  echo -e "\tHostname and DNS information"
  echo "---------------------------"
  #todo: show hostname and DNS info
  echo -e "Hostname : \c"
  hostname -s
  echo -e "DNS domain : \c"
  dnsdomainname
  echo -e "Fully qualified domain name : \c"
  hostname -f
  echo -e "Network address : \c"
  hostname -i
  echo -e "DNS name servers (DNS IP) : \c"
  dnsdomainname -i
}

function networkInfo(){
  echo "---------------------------"
  echo -e "\tNetwork information"
  echo "---------------------------"
  echo -e "Total network interface found : \c"
  ip link show|grep BROADCAST |wc -l
  echo "*** IP Addresses Information ***"
  ip link show
  echo "***********************"
  echo "*** Network routing ***"
  echo "***********************"
  route
  echo "*************************************"
  echo "*** Interface traffic information ***"
  echo "*************************************"
  netstat -rn
}

function whoOnline() {
  echo "---------------------------"
  echo -e "\tWho is online"
  echo "---------------------------"
  who
}

function lastlogin() {
  echo "---------------------------"
  echo -e "\tList of last logged in users"
  echo "---------------------------"
  last
}

function ipAddr() {
  echo "---------------------------"
  echo -e "\tPublic IP information"
  echo "---------------------------"
  curl ifconfig.me
}

function diskusage() {
  echo "---------------------------"
  echo -e "\tDisk Usage Info"
  echo "---------------------------"
  df -h --output=pcent --output=target
}

function homeFileTree() {
  ./proj1.sh '/home' 'filetree.html'
}


mainMenu
read keyinput
while true; do
  case $keyinput in
    1 ) osInfo
      ;;
    2 ) hostDns
      ;;
    3 ) networkInfo
      ;;
    4 ) whoOnline
      ;;
    5 ) lastlogin
      ;;
    6 ) ipAddr
      ;;
    7 ) diskusage
      ;;
    8 ) homeFileTree
      ;;
    9 ) ./proc.sh
      ;;
    10 ) break
      ;;
  esac
  echo -e "Press [Enter] key to continue ... \c"
  read temp
  mainMenu
  read keyinput
done
