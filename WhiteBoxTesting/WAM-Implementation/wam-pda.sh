#! /bin/bash

source wam/config.sh

APP=$1

APP_DIR=$APP_BASE_DIR/$APP
OPTIONS="-Xmx3000m -Xincgc"

DRIVER=wam.drivers.interfaces.aiDriver

CLASSPATH=$LIB_DIR/rhino.jar:$LIB_DIR/automaton-1.11.jar:$LIB_DIR/jericho-html-3.2.jar:$LIB_DIR/htmlparser.jar:$LIB_DIR/log4j-1.2.16.jar:$LIB_DIR/ast.jar:$LIB_DIR/slf4j-api-1.1.0-RC1.jar:$LIB_DIR/staticanalyses-0.7.2.2.jar:$LIB_DIR/indus-0.7.2.2.jar:$LIB_DIR/slf4j-nop-1.1.0-RC1.jar:$LIB_DIR/commons-collections-3.1.jar:$LIB_DIR/trove.jar:$LIB_DIR/commons-pool-1.3.jar:$LIB_DIR/ProgressBar.jar:$LIB_DIR/StringResolution.jar:$LIB_DIR/soot-all.jar:$LIB_DIR/wage.jar:$LIB_DIR/WAM.jar

#replace below with your ant file's compile task
ant compile

java $OPTIONS -classpath $CLASSPATH $DRIVER $APP_DIR/$APP-config.wam.xml $WAM_PROPERTY_FILE -d
