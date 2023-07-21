#!/bin/bash

# Update package lists
sudo apt update

# Install iptables-persistent package
sudo apt install -y iptables-persistent

# Set up IPv4 rules
cat <<EOF | sudo tee /etc/iptables/rules.v4
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -j ACCEPT
-A OUTPUT -j ACCEPT
-A FORWARD -j ACCEPT
COMMIT
EOF

# Set up IPv6 rules
cat <<EOF | sudo tee /etc/iptables/rules.v6
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -j ACCEPT
-A OUTPUT -j ACCEPT
-A FORWARD -j ACCEPT
COMMIT
EOF

# Load the rules
sudo iptables-restore < /etc/iptables/rules.v4
sudo ip6tables-restore < /etc/iptables/rules.v6

echo "Network rules have been set up and will be automatically loaded during system startup."

rm setup_iptables.sh
