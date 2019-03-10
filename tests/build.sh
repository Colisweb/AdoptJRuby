#!/usr/bin/env bash

set -e

cp -r script adoptopenjdk
cp -r script openjdk
cp -r script corretto
cp -r script oracle

docker build oracle/. -t main-oracle
docker build adoptopenjdk/. -t main-adoptopenjdk
docker build openjdk/. -t main-openjdk
docker build corretto/. -t main-corretto

rm -rf adoptopenjdk/script
rm -rf openjdk/script
rm -rf corretto/script
rm -rf oracle/script