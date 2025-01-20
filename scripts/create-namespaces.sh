#!/bin/sh

if [ -z "$1" ]
then
  echo "Please specify kubeconfig file {1}"
  exit 0
fi

if [ -z "$2" ]
then
  echo "Please specify namespace prefix {2}"
  exit 0
fi

echo "Kubeconfig: $1"
echo "Namespace prefix: $2"
echo ""

echo "" > repos.yaml

for i in $(seq 1 50); do
  kubectl --kubeconfig=$1  create namespace $2-$i
done