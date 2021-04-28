#!/bin/bash


useradd -d /usr/maotest -m maotest
Path="/home/maozi/Desktop/Devops/Lab1/logfiles"

find $Path -type f -exec chown -R maotest.maotest {} \;

exit 0; 












