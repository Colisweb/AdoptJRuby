#!/usr/bin/env bash

set -e

./build.sh

docker run main-adoptopenjdk > adoptopenjdk.txt

docker run main-openjdk > openjdk.txt

docker run main-corretto > corretto.txt

docker run main-oracle > oracle.txt