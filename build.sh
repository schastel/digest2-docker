#!/bin/bash

set -e

docker build --tag=schastel/digest2-phase1:latest -f Dockerfile-phase1 .

docker build --tag=schastel/digest2-phase2:latest -f Dockerfile-phase2 .

docker tag schastel/digest2-phase2:latest docker.io/schastel/digest2:0.19.1
docker tag docker.io/schastel/digest2:0.19.1 docker.io/schastel/digest2:latest

echo "If happy:"
echo "docker push docker.io/schastel/digest2:0.19.1"
echo "docker push docker.io/schastel/digest2:latest"
