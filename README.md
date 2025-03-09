# ansible-arch-linux

(Forked and adapred for my needs from [https://github.com/loganmarchione/ansible-arch-linux](https://github.com/loganmarchione/ansible-arch-linux))

[![Lint](https://github.com/kael-k/ansible-arch-linux/actions/workflows/lint.yml/badge.svg)](https://github.com/kael-k/ansible-arch-linux/actions/workflows/lint.yml/badge.svg)

Ansible playbook to setup my Arch Linux machines (i.e., meant to be run against localhost)

## Explanation

* This is meant for _my machine_. You can use it as a guide, but please don't blindly run it on your machine (it will break things).
* This is meant to be run during the installation process, after disks setup, pacstrap and arch-chroot
    * https://wiki.archlinux.org/title/Installation_guide#Chroot

## Requirements

1. Install the necessary packages
   ```
   sudo pacman -S git python
   ```
1. Clone this repo
   ```
   git clone https://github.com/kael-k/ansible-arch-linux.git
   cd ansible-arch-linux
   ```
1. Install Ansible
   ```
   python3 -m venv venv
   source venv/bin/activate
   pip3 install -r requirements.txt
   ```
1. Install the Ansible requirements
   ```
   ansible-galaxy install -r requirements.yml
   ```
1. (Optional) Edit the variables in `group_vars`
1. (Optional) Run the playbook in check mode to view potential changes
   ```
   ansible-playbook main.yml --ask-become-pass --check
   ````
1. Run the playbook (enter your user's password when prompted)
   ```
   ansible-playbook main.yml --ask-become-pass
   ```
