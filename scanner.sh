#!/bin/bash

# Network Reachability and Port Scanner - Alpha Team
# Authorized lab use only.
# This script discovers alive hosts, scans common ports,
# and checks a safe lab vulnerability on HTTP services.

PORTS=(21 22 23 80 443 8080)

echo "Network Reachability and Port Scanner - Alpha Team"
echo "Authorized lab use only."
echo "--------------------------------------------------"

read -p "Enter network prefix, example 192.168.1 or 127.0.0: " NETWORK

if [[ ! "$NETWORK" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Invalid network prefix."
    echo "Example: 192.168.1"
    exit 1
fi

echo ""
echo "Scanning network: $NETWORK.0/24"
echo "Ports: ${PORTS[*]}"
echo "--------------------------------------------------"
echo ""

check_directory_listing() {
    local ip=$1
    local port=$2

    response=$(curl -s --max-time 2 "http://$ip:$port/")

    if echo "$response" | grep -qi "Directory listing for\|Index of\|<title>Directory listing"; then
        echo "  [!] Lab vulnerability found on $ip:$port"
        echo "      HTTP Directory Listing is enabled."
        echo "      Safe lab demo: files in this folder may be visible through the browser."
    fi
}

echo "[1] Discovering alive hosts..."
echo ""

# For localhost lab demo, scan only 127.0.0.1 to keep output clean.
# For normal local network, scan .1 to .254.
if [[ "$NETWORK" == "127.0.0" ]]; then
    RANGE="1"
else
    RANGE=$(seq 1 254)
fi

for i in $RANGE
do
    ip="$NETWORK.$i"

    if ping -c 1 -W 1 "$ip" > /dev/null 2>&1
    then
        echo "$ip is alive"
        echo "Scanning common ports on $ip..."

        for port in "${PORTS[@]}"
        do
            if nc -z -w 1 "$ip" "$port" > /dev/null 2>&1
            then
                echo "  Port $port is open"

                if [[ "$port" == "80" || "$port" == "8080" ]]; then
                    check_directory_listing "$ip" "$port"
                fi
            fi
        done

        echo ""
    fi
done

echo "Scan finished."
