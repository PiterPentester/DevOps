#!/bin/bash

# Creating nexus3 deployment
echo "Creating nexus3 deployment:"

echo "1)Creating PV"
kubectl apply -f nexus3-stage/nexus3-stage-pv.yaml
echo "2)Creating Deployment"
kubectl apply -f nexus3-stage/nexus3-stage-depl.yaml

# Creating MySQL deployment
echo "Creating MySQL deployment:"

echo "1)Creating PV"
kubectl apply -f mysql-stage/mysql-stage-pv.yaml
echo "2)Creating Deployment"
kubectl apply -f mysql-stage/mysql-stage-depl.yaml

# Creating GOGS deployment
echo "Creating Gogs deployment:"

echo "1)Creating PV"
kubectl apply -f gogs-stage/gogs-stage-pv.yaml
echo "2)Creating Deployment"
kubectl apply -f gogs-stage/gogs-stage-depl.yaml


