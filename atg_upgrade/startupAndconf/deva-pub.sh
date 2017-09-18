#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-pub-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/pub.conf
export JBOSSCONF=deva-pub
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c pub-config.xml 