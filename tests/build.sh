#!/usr/bin/env bash

cp -r script adoptopenjdk
cp -r script openjdk

docker build adoptopenjdk/. -t main-adoptopenjdk
docker build openjdk/. -t main-openjdk

rm -rf adoptopenjdk/script
rm -rf openjdk/script