#!/bin/bash
#   
#  Leere VM mit einer Intro Seite
#
# Install apache, php, ftp, powershell, markdown to HTML
sudo apt update
sudo apt install -y php libapache2-mod-php vsftpd markdown
sudo apt install -y nodejs git
sudo snap install powershell --classic
git clone https://github.com/taylonr/postman.git
# Introseite
bash -x /opt/lernmaas/helper/intro
