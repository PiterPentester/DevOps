#!/bin/bash
#set -x

# Use this script as a starting point to create your own deployment.yml

# Make sure the cluster is running and get the ip_address
ip_addr=$(ibmcloud cs workers $PIPELINE_KUBERNETES_CLUSTER_NAME | grep normal | awk '{ print $2 }')
if [ -z $ip_addr ]; then
  echo "$PIPELINE_KUBERNETES_CLUSTER_NAME not created or workers not ready"
  exit 1
fi

input="properties"
N=0
while IFS= read -r line
do
  if [ $N == 0 ];then
    echo "IDS_PROJECT_NAME=$line"
    export "IDS_PROJECT_NAME=$line"
    N=1
  elif [ $N == 1 ]
  then
    echo "PIPELINE_IMAGE_URL=$line"
    export "PIPELINE_IMAGE_URL=$line"
    export "PORT=9876"
  fi
done < "$input"

# Initialize script variables
NAME="$IDS_PROJECT_NAME"
IMAGE="$PIPELINE_IMAGE_URL"
if [ -z IMAGE ]; then
  echo "$IMAGE not set. If using $PIPELINE_IMAGE_URL this variable is only configured when a "Container Registry" build job is used as the stage input."
  exit 1
fi

echo ""
echo "Deploy environment variables:"
echo "NAME=$NAME"
echo "IMAGE=$IMAGE"
echo "PORT=$PORT"
echo ""

DEPLOYMENT_FILE="godo-depl.yaml"

# Substitute the variables
sed -i 's/$NAME/'"$NAME"'/g' $DEPLOYMENT_FILE
sed -i 's=$IMAGE='"$IMAGE"'=g' $DEPLOYMENT_FILE
sed -i 's/$PORT/'"$PORT"'/g' $DEPLOYMENT_FILE

# Show the file that is about to be executed
echo ""
echo "DEPLOYING USING MANIFEST:"
echo "cat $DEPLOYMENT_FILE"
cat $DEPLOYMENT_FILE
echo ""

# Execute the file
echo "KUBERNETES COMMAND:"
echo "kubectl apply -f $DEPLOYMENT_FILE"
kubectl apply -f $DEPLOYMENT_FILE
echo ""

echo ""
echo "DEPLOYED SERVICE:"
kubectl describe services $NAME
echo ""
echo "DEPLOYED PODS:"
kubectl describe pods --selector app=$NAME
echo ""

# Show the IP address and the PORT of the running app
port=$(kubectl get services | grep "$NAME " | sed 's/.*:\([0-9]*\).*/\1/g')
echo "RUNNING APPLICATION:"
echo "URL=http://$ip_addr"
echo "PORT=$port"
echo ""
echo "$NAME running at: http://$ip_addr:$port/tasks"


