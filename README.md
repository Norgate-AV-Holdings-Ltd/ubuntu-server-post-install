# ubuntu-server-post-install

A simple bash script to configure Ubuntu Server after install.

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
3. Install the QEMU guest agent
4. Configure the firewall to allow all outgoing and deny all incoming except SSH
5. Install fail2ban
6. Install cifs-utils
7. Install autofs
