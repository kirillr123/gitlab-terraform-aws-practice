#! /bin/bash
sudo su
yum -y update
yum -y install git

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
sudo yum install gitlab-runner



git clone https://github.com/CsteerDevops1/wiki-framework.git
cd /wiki-framework/
git checkout develop


amazon-linux-extras install docker
systemctl start docker
systemctl enable docker

sudo gitlab-runner register -n \
  --url https://gitlab.com/ \
  --registration-token E-Uxw5qFUR7_RDPdLi4Y \
  --executor shell \
  --description "My Runner"

sudo usermod -aG docker gitlab-runner
sudo -u gitlab-runner -H docker info
sudo -u gitlab-runner -H docker info

chmod a+x deploy.sh
./deploy.sh project_dir
