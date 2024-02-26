#!/bin/bash

# Determine Architecture
ARCH=$(uname -m)

## Honeygain
mkdir -p /opt/honeygain 
if [[ "$ARCH" == "x86_64" ]]
then 
    curl -L https://github.com/Walofz/CashReaper/releases/download/0.0.1/0.8.1x64.tar.gz | tar -C /opt/honeygain -zxf -
else
    curl -L https://github.com/Walofz/CashReaper/releases/download/0.0.1/0.8.1_arm64.tar.gz | tar -C /opt/honeygain -zxf -
fi


# Pawns.app (IPRoyal)
curl -L https://cdn.pawns.app/download/cli/latest/linux_`uname -m`/pawns-cli > /usr/bin/pawns-cli
chmod +x /usr/bin/pawns-cli

# Earnapp - Installed by service itself on first run