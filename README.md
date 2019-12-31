# dotfiles

Debian

## Preconditions

* Network access

Debian dhcp:

```bash
# cat >> /etc/network/interfaces
allow-hotplug enp3s0 eth0
iface enp3s0 inet dhcp
```

## Install

Get bootstrap script to install sudo and git in new debian install.

```bash
$ su -c - root ./bootstrap.sh
```

### Manual

```bash
$ ~/dotfiles/install.py
```
