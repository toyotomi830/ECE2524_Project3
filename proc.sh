function procMenu() {
  echo "(pleas enter the number of your selection below)"
  echo "1. Show all processes"
  echo "2. Kill a process"
  echo "3. Bring up top"
  echo "4. return to Main Menu"
}

function showProc() {
  ps -f
}

function killProc() {
  echo "Pleas enter the PID of the process you would like to kill:"
  read pidNeedKill
  kill -s 9 $pidNeedKill
}

function bringTop() {
  top
}

procMenu
read keyinput
while true; do
  case $keyinput in
    1 ) showProc
      ;;
    2 ) killProc
      ;;
    3 ) bringTop
      ;;
    4 )  break
      ;;
  esac
  procMenu
  read keyinput
done
