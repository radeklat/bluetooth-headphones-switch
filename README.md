# Bluetooth headphones connect/disconnect switch

This script connects/disconnect Bluetooth headphones (or any other BT device). It also turns Bluetooth on/off. This can be disabled in the script if needed.

The motivation for this script was frequent switching of Bluetooth headphones between phone for music and laptop for video conference calls. In Cinnamon of Linux Mint that I use, this process takes several clicks and several retries. This script can be mapped to a keyboard shortcut, allowing much quicker switching.

## How to install

1. Copy this script to your computer
1. Find the MAC address of the BT device you want to connect/disconnect with `bt-device --list` (assuming you paired the device previously)
1. Either hard-code it into the script or use it as a parameter of the script
1. In system settings / Keyboard / Shortcuts / Custom, add a custom shortcut
1. In 'Command', put full path to the script + optionally the MAC address of the device (useful if you want to handle multiple devices)
1. Assign a keyboard shortcut. For example, I chose unused multimedia key for opening email.

## How to use

Just press the selected keyboard shortcut. It will automatically either connect or disconnect, depending if the device is already connected or not.

You will be informed about the progress with a notification.