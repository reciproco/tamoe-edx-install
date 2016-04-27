#!/bin/sh
##
## Set environment and executes openedX manual isntall
##
export OPENEDX_RELEASE="named-release/dogwood.3"
read -p "Customize /tmp/server-vars and press any key to start installation"
cp ./server-vars.yml /tmp/server-vars.yml
wget https://raw.githubusercontent.com/edx/configuration/master/util/install/ansible-bootstrap.sh -O - | sudo bash
export EXTRA_VARS="-e@/tmp/server-vars.yml"
bash ./sandbox.sh
