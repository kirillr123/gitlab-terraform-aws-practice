#! /bin/bash
sudo su
yum -y update
yum -y install git

#clone git repo
git clone --single-branch --branch develop https://github.com/CsteerDevops1/wiki-framework.git
cd /wiki-framework/

#prepare .envs
touch ./telegramBots/userBot/.env
touch ./telegramBots/initBot/.env
touch ./telegramBots/editBot/.env

#install docker
amazon-linux-extras install docker
systemctl start docker
systemctl enable docker

#install compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

#install and set up runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
sudo yum -y install gitlab-runner

sudo gitlab-runner register -n \
  --url https://gitlab.com/ \
  --registration-token E-Uxw5qFUR7_RDPdLi4Y \
  --executor shell \
  --description "Kirill-runner" \
  --tag-list "Kirill-runner"

sudo usermod -aG docker gitlab-runner
sudo -u gitlab-runner -H docker info
