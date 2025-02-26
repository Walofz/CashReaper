#!/bin/bash

# Honeygain - Installed by dockerfile
# Earnapp
wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh && bash /tmp/earnapp.sh -y
rm /tmp/earnapp.sh
