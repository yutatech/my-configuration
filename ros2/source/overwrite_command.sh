ros2() {
  echo "ros2 configureation is not completed. Would you like to configure it now? (y/n)"
  read answer
  if [ "$answer" = "y" ]; then
    local SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
    $SCRIPT_DIR/../scripts/setup_ros2.sh
    unset -f ros2 2>/dev/null
    source $SCRIPT_DIR/../ros2.sh
  fi
}