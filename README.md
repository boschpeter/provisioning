# theotheu
socialcoin-api.  

https://github.com/theotheu/

Provisioning with Ansibles for local test purposes.
If you want to test local, start with a virtual machine. Then continue with ansible.
It is tested on Ubuntu 18.04.


# Ansible

http://docs.ansible.com/intro_installation.html

Installation steps for Mac OS X

    Install Xcode
    sudo easy_install pip
    sudo pip install ansible --quiet

Security
Copy the content of the local laptop cat ~/.ssh/id_rsa.pub to the remote server file /root/.ssh/authorized_keys

Set privileges

    chmod 0700 /root/.ssh
    chmod 0600 /root/.ssh/authorized_keys

Make sure root user has access. You probably need to change the file /etc/ssh/sshd_config and set PermitRootLogin to yes.
Configure

    Copy file group_vars/all.local to group_vars/all and modify the variables.
    Configure the hosts file.

# Provision machine

Run installation with ansible from this directory 
````ansible-playbook -i hosts site.yml```

This will run the common, users and hardening package.

Hardening

With the hardening, your machine will have a protection against attacks.

The following configuration is applied:

    Check for rootkits with http://rkhunter.sourceforge.net/ and http://rootkit.nl/projects/rootkit_hunter.html
    Protect su by limiting access only to admin group
    Prevent IP spoofing
    Prevent root log in
    Disable Open DNS Recursion and Remove Version Info - BIND DNS Server
    iptables
    fail2ban

Consider this hardening in your local environment. The production server will have hardening.

Configure hardening with ansible from this directory ansible-playbook --user root --ask-pass -i hosts hardening.yml -vvvv Please note that you have to modify the hosts file in this directory.

[vagrant]
localhost              ansible_connection=local

Original

[vagrant]
#localhost              ansible_connection=local
localhost:2222

[proxmox]
#server3.tezzt.nl
#server7.tezzt.nl
#145.74.104.44

[aws]
#server8.tezzt.nl
