#!/bin/bash
set -x

#
# update Ubuntu's repository
#
sudo apt-get -y update

#
# setup nmap
#
sudo apt-get -y install nmap

#
# setup Anaconda
#
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo bash -c "bash Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda3"
sudo bash -c "echo 'ANACONDA_HOME=/opt/anaconda3/' >> /etc/profile"
sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /etc/profile"

#setup anaconda for seed
sudo bash -c "echo 'PATH=/opt/anaconda3/bin:$PATH' >> /home/seed/.bashrc"
sudo bash -c "echo 'unset XDG_RUNTIME_DIR' >> /home/seed/.bashrc"

# create a user named seed with password dees. 
sudo useradd -m -p WchOyJRR.1Qrc -s /bin/bash seed

# create a user named root with password seedubuntu
sudo usermod root -p xXfH.x2WItKlA

# add seed to sudo and root
sudo usermod -a -G sudo seed
sudo usermod -a -G root seed

#setup gdb peda
sudo git clone https://github.com/longld/peda.git /home/seed/peda
sudo chown -R seed:seed /home/seed/peda
sudo su seed -c "touch /home/seed/.gdbinit"
sudo echo "source /home/seed/peda/peda.py" >> /home/seed/.gdbinit
