#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-store21-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/store.conf
export JBOSSCONF=deva-store21
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c deva-store21-config.xml 