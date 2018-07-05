#!/bin/bash

cd /vagrant &&
./gradlew build && 
./gradlew installDist
