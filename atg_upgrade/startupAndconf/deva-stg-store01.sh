#!/bin/bash
export JBOSSCONF=deva-stg-store01
rm -rf $JBOSS_HOME/standalone/$JBOSSCONF-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/stg-store.conf
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c $JBOSSCONF-config.xml -Djboss.server.temp.dir=$JBOSS_HOME/standalone/$JBOSSCONF-tmp
