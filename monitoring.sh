#!/bin/sh
##
## Installs and configure monitoring
export OPENEDX_RELEASE="named-release/dogwood.3"
export EXTRA_VARS="-e@/edx/app/edx_ansible/server-vars.yml"
## Did we specify an openedx release?
if [ -n "$OPENEDX_RELEASE" ]; then
  EXTRA_VARS="$EXTRA_VARS -e edx_platform_version=$OPENEDX_RELEASE \
    -e certs_version=$OPENEDX_RELEASE \
    -e forum_version=$OPENEDX_RELEASE \
    -e xqueue_version=$OPENEDX_RELEASE \
    -e configuration_version=$OPENEDX_RELEASE \
  $EXTRA_VARS"
  CONFIG_VER=$OPENEDX_RELEASE
else
  CONFIG_VER="master"
fi

cp $PWD/monitoring.yml /edx/app/edx_ansible/edx_ansible/playbooks
##
## Run the monitoring.yml playbook in the configuration/playbooks directory
##
cd /edx/app/edx_ansible/edx_ansible/playbooks && sudo ansible-playbook -c local $PWD/monitoring.yml -i "localhost," $EXTRA_VARS
