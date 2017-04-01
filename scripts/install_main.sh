#!/bin/bash

echo "--------------------------------------------------"
echo "Environment Vars.................................."
echo "INSTALL_APEX: ${INSTALL_APEX}"
echo "INSTALL_SQLCL: ${INSTALL_SQLCL}"
echo "DBCA_TOTAL_MEMORY: ${DBCA_TOTAL_MEMORY}"
echo "ORACLE_SID: ${ORACLE_SID}"
echo "SERVICE_NAME: ${SERVICE_NAME}"
echo "ORACLE_BASE: ${ORACLE_BASE}"
echo "ORACLE_HOME: ${ORACLE_HOME}"
echo "ORACLE_INVENTORY: ${ORACLE_INVENTORY}"
echo "PASS: ${PASS}"
echo "ORDS_HOME: ${ORDS_HOME}"
echo "JAVA_HOME: ${JAVA_HOME}"
echo "TOMCAT_HOME: ${TOMCAT_HOME}"
echo "APEX_PASS: ${APEX_PASS}"
echo "APEX_ADDITIONAL_LANG: ${APEX_ADDITIONAL_LANG}"
echo "APEX_ADDITIONAL_LANG_NLS: ${APEX_ADDITIONAL_LANG_NLS}"
echo "TIME_ZONE: ${TIME_ZONE}"
#
#
echo "--------------------------------------------------"
echo "Image Setup......................................."
./scripts/image_setup.sh
#
#
echo "--------------------------------------------------"
echo "Installing SSH...................................."
./scripts/install_ssh.sh
#
#
echo "--------------------------------------------------"
echo "Installing JAVA..................................."
./scripts/install_java.sh
#
#
echo "--------------------------------------------------"
echo "Installing ORACLE DB12201 EE......................"
./scripts/install_oracle12ee.sh
#
#
if [ ${INSTALL_SQLCL} == "true" ]; then
    echo "--------------------------------------------------"
    echo "Installing SQLCL.................................."
    ./scripts/install_sqlcl.sh
fi
#
#
if [ ${INSTALL_APEX} == "true" ]; then
    #
    #
    echo "--------------------------------------------------"
    echo "Installing ORACLE APEX............................"
    ./scripts/install_apex.sh
    #
    #
    echo "--------------------------------------------------"
    echo "Installing TOMCAT................................."
    ./scripts/install_tomcat.sh
    #
    #
    echo "--------------------------------------------------"
    echo "Installing ORACLE ORDS............................"
    ./scripts/install_ords.sh
fi
#
#
echo "--------------------------------------------------"
echo "Cleanup..........................................."
rm -r -f /tmp/*
rm -r -f /files/*
rm -r -f /var/tmp/*
echo "--------------------------------------------------"
echo "DONE.............................................."
