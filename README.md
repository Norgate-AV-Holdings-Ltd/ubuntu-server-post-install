# ubuntu-server-post-install

A simple opinionated bash script to configure Ubuntu Server after install.

This scripts assumes that you opted to install OpenSSH Server during the Ubuntu Server installation.

---

## How to use

Run the following command in the terminal of the newly installed Ubuntu Server.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Norgate-AV-Holdings-Ltd/ubuntu-server-post-install/master/ubuntu-server-post-install.sh)"
```

---

## What does it do?

1. Update and upgrade packages
2. Set up unattended-upgrades
3. Disable root login
4. Install the QEMU guest agent
5. Configure the firewall to allow all outgoing and deny all incoming except SSH
6. Install fail2ban
7. Install ZSH and oh-my-zsh
