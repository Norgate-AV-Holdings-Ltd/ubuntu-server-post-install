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

# Check user permissions
clear
echo "Checking user permissions..."
echo "Enter the username you created during the ubuntu-server installtion: "
read username
if sudo -l -U $username | grep -q "(ALL : ALL) ALL"; then

    # Disable root login
    clear
    echo "Disabling root login..."
    sleep 2
    sudo passwd -l root

fi

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

# Install fail2ban
clear
echo "Installing fail2ban..."
sleep 2
sudo apt update
sudo apt install fail2ban -y

sudo systemctl status fail2ban

sudo cp /etc/fail2ban/fail2ban.{conf,local}
sudo cp /etc/fail2ban/jail.{conf,local}

sudo sed -i "s/backend = auto/backend = systemd/" /etc/fail2ban/jail.local

sudo fail2ban-client status
tail /var/log/fail2ban.log

# Install ZSH and oh-my-zsh
clear
echo "Installing ZSH and oh-my-zsh..."
sleep 2
sudo apt update
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
