#!/bin/bash

## Honeygain
mkdir -p /opt/honeygain 
curl -L https://github.com/Walofz/CashReaper/releases/download/0.0.1/0.8.1.tar.gz | tar -C /opt/honeygain -zxf -
if [[ `uname -m` != "x86_64" ]]
then 
    mkdir -p /etc/qemu-binfmt/x86_64/lib64/ 
    curl -L https://github.com/Walofz/CashReaper/releases/download/0.0.1/ld64.tar.gz | tar -C /etc/qemu-binfmt/x86_64/lib64/ -zxf -
fi


# Pawns.app (IPRoyal)
curl -L https://cdn.pawns.app/download/cli/latest/linux_`uname -m`/pawns-cli > /usr/bin/pawns-cli
chmod +x /usr/bin/pawns-cli

# BitPing
mkdir -p /opt/bitping
cd /opt/bitping
update_json=$(curl --silent "https://releases.bitping.com/bitpingd/update.json")
tag=$(echo "$update_json" | grep '"version":' | sed -E 's/.*"([^"]+)".*/\1/')

# Define the base URL
base_url="https://releases.bitping.com/$tag"

# Determine OS
OS=$(uname -s)

# Determine Architecture
ARCH=$(uname -m)
# Construct the filename based on OS and Architecture
if [[ "$OS" == "Linux" ]]; then
    if [[ "$ARCH" == "x86_64" ]]; then
        file="bitpingd-x86_64-unknown-linux-gnu-$tag.tar.gz"
    elif [[ "$ARCH" == "armv7l" ]]; then
        file="bitpingd-armv7-unknown-linux-gnueabihf-$tag.tar.gz"
    elif [[ "$ARCH" == "aarch64" ]]; then
        file="bitpingd-aarch64-unknown-linux-musl-$tag.tar.gz"
    else
        echo "Unsupported architecture"
        exit 1
    fi
fi
# Download the file
curl -L "$base_url/$file" -o $file
# Extract the tar file
tar -xf "$file"

# Remove file
rm -rf "$file"


# Packetstream - Installed by dockerfile
# Earnapp - Installed by service itself on first run