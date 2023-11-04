echo "  $(/usr/bin/ip a | grep wlan0 | tail -n 1 | awk '{print $2}' | awk '{print $1}' FS="/")"
