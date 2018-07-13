#!/bin/bash

#if one of the command fails, other will not execute
cd /vagrant &&
./gradlew build && 
./gradlew installDist
