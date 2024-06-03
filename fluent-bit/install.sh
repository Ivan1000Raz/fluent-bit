#!/bin/bash


#copy flunt-bit keyrings
sudo curl -s https://packages.fluentbit.io/fluentbit.key | sudo gpg --dearmor | sudo tee /usr/share/keyrings/fluentbit-keyring.gpg >/dev/null

#add fluent-bit distro to source_list
echo 'deb [signed-by=/usr/share/keyrings/fluentbit-keyring.gpg] https://packages.fluentbit.io/ubuntu/jammy jammy main' | sudo tee -a /etc/apt/sources.list

sudo apt-get update
#install fluetn-bit with specific version
sudo apt-get install fluent-bit=2.2.3 -y

#enable fluent-bit process 
sudo systemctl enable fluent-bit

#check fluent-bit version 
#sudo find / -name fluent-bit -type f -print0 | xargs -0 -I {} sh -c '{} --version'
#check the status
sudo systemctl enable fluent-bit
sudo systemctl start fluent-bit
sudo systemctl --no-pager status fluent-bit

sudo cp fluent-bit.conf /etc/fluent-bit/
sudo cp fluent-bit.service /usr/lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl restart fluent-bit
sudo systemctl status fluent-bit

