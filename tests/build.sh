#!/usr/bin/env bash

set -e

cp -r script adoptopenjdk
cp -r script openjdk
cp -r script corretto

docker build corretto/. -t main-corretto
docker build adoptopenjdk/. -t main-adoptopenjdk
docker build openjdk/. -t main-openjdk

rm -rf adoptopenjdk/script
rm -rf openjdk/script
rm -rf corretto/script