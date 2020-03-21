#!/bin/bash
. ./scripts/jar-config.sh

if [ "$CLASSPATH_VAR" == "$APP_JAR" ]; then
  CLASS_LIST=$BASE_DIR/classes-spring-boot.lst
  java -XX:DumpLoadedClassList=$CLASS_LIST -jar $APP_JAR --spring.profiles.active=cds
else
  CLASS_LIST=$BASE_DIR/classes.lst
  java -cp $CLASSPATH_VAR -XX:DumpLoadedClassList=$CLASS_LIST $MAIN_CLASS --spring.profiles.active=cds
fi

java -cp $CLASSPATH_VAR -Xshare:dump -XX:SharedClassListFile=$CLASS_LIST -XX:SharedArchiveFile=$BASE_DIR/app-cds.jsa
