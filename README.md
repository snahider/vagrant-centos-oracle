vagrant-centos-oracle
-----------------

Vagrant box with oracle xe setup using ansible.

Read the tutorial:
- Part 1: http://blog.codiez.co.za/2013/11/vagrant-centos-64-base-box/
- Part 2: http://blog.codiez.co.za//2013/11/install-oracle-centos-64-vagrant-ansible/

Instructions
-----------------
If you just want to run this, you can do the following:

1. Install Virtualbox 4.3.2 - https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant 1.3.5 - http://downloads.vagrantup.com/
3. Install Git - http://git-scm.com/downloads
4. Clone this repo - `git clone https://github.com/ismaild/vagrant-centos-oracle.git`
5. Grab the 11g zip'ed RPM from
[the Oracle site](http://www.oracle.com/technetwork/products/express-edition/downloads/index.html)
after accepting the license terms.  Copy it into the oracle directory within this project.
6. Run `vagrant up` from within `vagrant-centos-oracle`

Getting started
-----------------

- Create your standard users

    ```
    sqlplus system/manager@vagrant
    
    SQL> create user scott identified by tiger;
    
    User created.
    
    SQL> grant all privileges to scott;
    
    Grant succeeded.
    
    sqitch rebase  db:oracle://scott:tiger@/vagrant
    ```