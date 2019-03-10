#!/usr/bin/env bash

./build.sh

docker run main-adoptopenjdk > adoptopenjdk.txt

docker run main-openjdk > openjdk.txt