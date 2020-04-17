# Bluetooth connect/disconnect script

# It turns bluetooth on/off as well. If you don't like that, comment out the
# `rfkill` command.

# $1 optional BT device MAC address. If not given, MAC address configured in
# this script will be used
#!/usr/bin/env bash

# Find the device MAC address with `bt-device --list`
DEVICE_MAC=${1-"ENTER DEVICE MAC HERE"}

connected() {
    bt-device -i ${DEVICE_MAC} | grep -q "Connected: 1"
    return $?
}

# $1: message
notify () {
    notify-send -t 5000 "$1"
}

if connected; then
    notify "Disconnecting 🎧"
    bt-device -d ${DEVICE_MAC}
    echo "Turning off bluetooth"
    notify "Bluetooth OFF"
    rfkill block bluetooth
else
    echo "Turning on bluetooth"
    notify "Bluetooth ON"
    rfkill unblock bluetooth
    echo -n "Trying to connect "
    notify "Connecting 🎧"
    for i in $(seq 1 60); do
        <<<"connect ${DEVICE_MAC}
            quit" bluetoothctl >/dev/null 2>&1
        sleep 1
        echo -n "."
        if connected; then
            echo " connected."
            notify "🎧 connected"
            exit 0
        fi
    done
    echo " not connected."
    notify "not connected"
fi
