#!/bin/bash

if [ -f "/etc/node.cnf" ]; then
    /bin/cp -f "/etc/node.cnf" "/etc/mysql/node.cnf"

    if [ -n "${CLUSTER_ADDRESS}" ]; then
		sed -r "s|^[#]?wsrep_cluster_address=.*$|wsrep_cluster_address=gcomm://${CLUSTER_ADDRESS}|" "/etc/mysql/node.cnf" 1<> "/etc/mysql/node.cnf"
	fi

    if [ -n "${CLUSTER_NAME}" ]; then
		sed -r "s|^[#]?wsrep_cluster_name=.*$|wsrep_cluster_name=${CLUSTER_NAME}|" "/etc/mysql/node.cnf" 1<> "/etc/mysql/node.cnf"
	fi

    NODE_NAME=$(hostname -f)

    sed -r "s|^[#]?wsrep_node_name=.*$|wsrep_node_name=${NODE_NAME}|" "/etc/mysql/node.cnf" 1<> "/etc/mysql/node.cnf"
    sed -r "s|^[#]?wsrep_node_address=.*$|wsrep_node_address=${NODE_NAME}|" "/etc/mysql/node.cnf" 1<> "/etc/mysql/node.cnf"
    sed -r "s|^[#]?wsrep_node_incoming_address=.*$|wsrep_node_incoming_address=${NODE_NAME}:3306|" "/etc/mysql/node.cnf" 1<> "/etc/mysql/node.cnf"
fi

bash /entrypoint.sh mysqld $@