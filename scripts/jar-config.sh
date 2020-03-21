#!/bin/bash
if [ $(uname) == "CYGWIN_NT-10.0" ]; then
  BASE_DIR=target
  PATH_SEPARATOR=";"
else
  BASE_DIR=.
  PATH_SEPARATOR=":"
fi
APP_JAR=$BASE_DIR/spring-petclinic.jar
CLASSPATH_VAR=$APP_JAR$(for i in $(find $BASE_DIR/dependency -name '*.jar' 2> /dev/null); do echo -n $PATH_SEPARATOR$i; done)
MAIN_CLASS=org.springframework.samples.petclinic.PetClinicApplication
