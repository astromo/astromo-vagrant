# Astromo Vagrant Setup

This repo will set up a complete Astromo development environment.

## Requirements

1. VirtualBox
2. Vagrant

## Installation
Clone this repo

```
git clone git@github.com:astromo/astromo-vagrant.git
cd astromo-vagrant
```

Clone our Astromo repos

```
git submodule init && git submodule update
```

## Run your Vagrant box

`vagrant up`

## That's it!

Make sure you added your ssh key to the ssh agent using

`ssh-add`

Connect to the Vagrant box using

`vagrant ssh`

The Vagrant is set up to use the following ip: `192.168.33.10`

## Source Files
The `src` folder will contain our repos and source code and are synced back and forth using an NFS share to `/vagrant/src` inside the Vagrant box.
Because of this, you should always make sure that you run `npm install` from inside the Vagrant box to compile node modules binaries that are native to the Vagrant OS and not your host OS.

## Utilities

To reprovision your box in case of changes to the Vagrant process, simply

```
vagrant reload --provision
```

Or in case your development environment is dirty and you'd like to reset it

```
vagrant destroy && vagrant up
```

To update all astromo repos, simply use

```
./scripts/update.sh
```
