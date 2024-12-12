#!/bin/bash

# Update package list and install required packages
apt update && apt -y install ca-certificates wget net-tools gnupg

# Download and add OpenVPN Access Server repository key
wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc

# Add OpenVPN Access Server repository to the sources list
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian focal main" > /etc/apt/sources.list.d/openvpn-as-repo.list

# Update package list and install OpenVPN Access Server version 2.11.2
apt update && apt -y install openvpn-as=2.11.2-72c0e923-Ubuntu20

# Mark packages to prevent updates
apt-mark hold openvpn-as openvpn-as-bundled-clients
