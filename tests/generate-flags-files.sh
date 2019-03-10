#!/usr/bin/env bash

./build.sh

docker run main-adoptopenjdk > adoptopenjdk11.txt

docker run main-openjdk > openjdk11.txt