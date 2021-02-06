#!/bin/bash

# Update packages
clear
echo "Updating packages..."
sleep 2
sudo apt update && sudo apt dist-upgrade -y

# Setup unattended upgrades
clear
echo "Setting up unattended upgrades..."
sleep 2
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades
cat /etc/apt/apt.conf.d/20auto-upgrades
sleep 2

# Install QEMU guest agent
clear
echo "Installing QEMU guest agent..."
sleep 2
sudo apt update
sudo apt install qemu-guest-agent -y

# Configure firewall
clear
echo "Configuring firewall defaults..."
sleep 2
sudo ufw default allow outgoing
sudo ufw default deny incoming

sudo ufw allow ssh

sudo ufw enable
sudo ufw status
sleep 2

# Install fail2ban
clear
echo "Installing fail2ban..."
sleep 2
sudo apt update
sudo apt install fail2ban -y

sudo systemctl status fail2ban

sudo fail2ban-client status
tail /var/log/fail2ban.log
