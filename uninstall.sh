#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )
DAEMON_NAME=${SCRIPT_DIR##*/}
rclocalname=/data/rc.local

rm /service/$DAEMON_NAME
kill $(pgrep -f "python $SCRIPT_DIR")
kill $(pgrep -f 'supervise $DAEMON_NAME')
chmod a-x $SCRIPT_DIR/service/run

grep -qxF "$SCRIPT_DIR/install.sh" $rclocalname && sed -i "#/bin/bash $SCRIPT_DIR/install.sh#d" $rclocalname
