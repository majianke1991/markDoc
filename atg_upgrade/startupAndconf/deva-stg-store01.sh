#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-stg-store01-store21-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/stg-store.conf
export JBOSSCONF=deva-stg-store01
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c deva-stg-store01-config.xml 