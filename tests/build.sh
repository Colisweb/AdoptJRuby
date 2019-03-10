#!/usr/bin/env bash

cp -r script adoptopenjdk
cp -r script openjdk
cp -r script oracle

docker build adoptopenjdk/. -t main-adoptopenjdk
docker build openjdk/. -t main-openjdk
docker build oracle/. -t main-oracle

rm -rf adoptopenjdk/script
rm -rf openjdk/script
rm -rf oracle/script