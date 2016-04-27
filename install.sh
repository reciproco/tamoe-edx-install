#!/bin/sh
##
## Set environment and executes openedX manual isntall
##
export OPENEDX_RELEASE="named-release/dogwood.3"
wget https://raw.githubusercontent.com/edx/configuration/master/util/install/ansible-bootstrap.sh -O - | sudo bash
export EXTRA_VARS="-e@$HOME/server-vars.yml"
./sandbox.sh
