#!/bin/sh

if [ -z "$1" ]
then
  echo "Please specify namespace prefix {1}"
  exit 0
fi

echo "Namespace prefix: $1"
echo ""

echo "" > repos.yaml

for i in $(seq 1 50); do
  echo "---
apiVersion: fleet.cattle.io/v1alpha1
kind: GitRepo
metadata:
  name: bm-50-gitrepo-50-bundle-part-$i
  labels:
    fleet.cattle.io/group: bm-50-gitrepo-50-bundle
spec:
  repo: https://github.com/rancher/fleet-examples
  branch: master
  paths:
  - simple
  targetNamespace: $1-$i
  targets:
    - clusterSelector:
        matchLabels:
          fleet-bm: \"true\"" >> repos.yaml
done