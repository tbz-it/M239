#!/bin/bash
#   
#  Leere VM mit einer Intro Seite
#
# Install apache, php, ftp, powershell, markdown to HTML
sudo apt update
sudo apt install -y php libapache2-mod-php vsftpd markdown
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo snap install powershell --classic
git clone https://github.com/taylonr/postman.git
cd postman
npm install
npm start:dev
# Introseite
bash -x /opt/lernmaas/helper/intro
