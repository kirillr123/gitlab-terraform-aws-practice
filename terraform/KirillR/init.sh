#! /bin/bash
sudo su
yum -y update
yum -y install git
git clone https://github.com/CsteerDevops1/wiki-framework.git
cd /wiki-framework/
git checkout develop
amazon-linux-extras install docker
systemctl start docker
systemctl enable docker
chmod a+x deploy.sh
./deploy.sh project_dir