#!/bin/bash
set -x
set -e

CM_EXT_BRANCH=cm5-5.15.0

function build_cm_ext {

  #Checkout if dir does not exist
  if [ ! -d cm_ext ]; then
    git clone https://github.com/cloudera/cm_ext.git
  fi
  if [ ! -f cm_ext/validator/target/validator.jar ]; then
    cd cm_ext
    git checkout "$CM_EXT_BRANCH"
    mvn package -DskipTests
    cd ..
  fi
}

function build_jupyter_csd {
  JARNAME=JUPYTER-1.0.jar
  if [ -f "$JARNAME" ]; then
      rm ./${JARNAME}
  fi
  java -jar cm_ext/validator/target/validator.jar -s jupyter-csd/descriptor/service.sdl -l "SPARK_ON_YARN SPARK2_ON_YARN"

  jar -cvf ./$JARNAME -C jupyter-csd .
}


build_cm_ext
build_jupyter_csd
