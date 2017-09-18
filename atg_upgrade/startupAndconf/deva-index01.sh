#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-index01-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/index.conf
export JBOSSCONF=deva-index01
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c deva-index01-config.xml 