#!/bin/bash

# Growing partition
growpart /dev/nvme0n1 4
lvextend -L +5G /dev/mapper/RootVG-rootVol 
lvextend -L +10G /dev/mapper/RootVG-varVol
lvextend -L +5G /dev/mapper/RootVG-homeVol

xfs_growfs /
xfs_growfs /var
xfs_growfs /home


#installing Docker 

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo systemctl start docker

sudo systemctl enable docker

usermod -aG docker ec2-user


