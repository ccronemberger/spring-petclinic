#!/bin/bash
. ./scripts/jar-config.sh

echo JAVA_DEBUG = $JAVA_DEBUG
echo JAVA_OPTS  = $JAVA_OPTS

if [ -a "app-cds.jsa" ]; then
  echo starting application using CDS
  java $JAVA_DEBUG $JAVA_OPTS -cp $CLASSPATH_VAR -XX:SharedArchiveFile=app-cds.jsa $MAIN_CLASS $*
else
  if [ "$CLASSPATH_VAR" == "$APP_JAR" ]; then
    echo starting application with single jar
    java $JAVA_DEBUG $JAVA_OPTS -jar $APP_JAR $*
  else 
    echo starting application with class path
    java $JAVA_DEBUG $JAVA_OPTS -cp $CLASSPATH_VAR $MAIN_CLASS $*
  fi
fi
