#!/usr/bin/env bash

# Change into the provided directory
cd "$1" || exit 1

# Look through all files in var/log/ for the lines that indicate a failed login attempt and captures the information we need: date, hour, username, and IP
# It outputs a line for each to failed_login_data.txt in the provided directory
awk 'match($0, /^([A-Za-z]+)[ ]+([0-9]+ [0-9][0-9]):[0-9:]+ [A-Za-z]+ sshd\[[0-9]+\]: Failed password for[A-Za-z0-9 ]* ([A-Za-z0-9_-]+) from ([0-9]+.[0-9]+.[0-9]+.[0-9]+)/, groups) {print groups[1], groups[2], groups[3], groups[4]}' var/log/* > failed_login_data.txt