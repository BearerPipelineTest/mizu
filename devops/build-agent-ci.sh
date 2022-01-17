#!/bin/bash
set -e

GCP_PROJECT=up9-docker-hub
REPOSITORY=gcr.io/$GCP_PROJECT
SERVER_NAME=mizu
GIT_BRANCH=ci

DOCKER_REPO=$REPOSITORY/$SERVER_NAME/$GIT_BRANCH
SEM_VER=${SEM_VER=0.0.0}
ARCH=amd64

DOCKER_TAGGED_BUILD="$DOCKER_REPO:$SEM_VER"

echo "building $DOCKER_TAGGED_BUILD"
docker build -t ${DOCKER_TAGGED_BUILD} --build-arg ARCH=${ARCH} --build-arg SEM_VER=${SEM_VER} --build-arg BUILD_TIMESTAMP=${BUILD_TIMESTAMP} --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg COMMIT_HASH=${COMMIT_HASH} .
