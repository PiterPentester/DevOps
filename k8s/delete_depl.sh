#!/bin/bash

# Deleting nexus3 deployment

echo "Deleting nexus3 deployment:"

echo "1)Deleting Deployment"
kubectl delete -f nexus3-stage/nexus3-stage-depl.yaml
echo "2)Deleting PV"
kubectl delete -f nexus3-stage/nexus3-stage-pv.yaml

# Deleting MySQL deployment
echo "Deleting MySQL deployment:"

echo "1)Deleting Deployment"
kubectl delete -f mysql-stage/mysql-stage-depl.yaml
echo "2)Deleting PV"
kubectl delete -f mysql-stage/mysql-stage-pv.yaml

# Deleting GOGS deployment
echo "Deleting Gogs deployment:"

echo "1)Deleting Deployment"
kubectl delete -f gogs-stage/gogs-stage-depl.yaml
echo "2)Deleting PV"
kubectl delete -f gogs-stage/gogs-stage-pv.yaml

