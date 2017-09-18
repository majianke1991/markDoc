#!/bin/bash
rm -rf $JBOSS_HOME/standalone/deva-fulfillment01-tmp/*
export RUN_CONF=$JBOSS_HOME/standalone/configuration/fulfillment.conf
export JBOSSCONF=deva-fulfillment01
$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0  -c deva-fulfillment01-config.xml 