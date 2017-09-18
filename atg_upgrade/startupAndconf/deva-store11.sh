#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-store11-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/store.conf
export JBOSSCONF=deva-store11
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c deva-store11-config.xml 