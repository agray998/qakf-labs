#!/bin/bash

# ensure time is allowed for cluster to provision
echo "Waiting for cluster..."
sleep 60

# generate kubeconfig
echo "Generating kubeconfig for Kind cluster 'qakf-kind'"
sudo kind export kubeconfig --name qakf-kind

# create utility pod (for curling pods etc)
kubectl run alpine --image=alpine -- sleep infinity
kubectl exec alpine -- sh -c "apk update && apk add curl"

echo "pod/alpine created - to curl pods/services run 'kubectl exec alpine -- curl http://<IP or DNS name>'"
