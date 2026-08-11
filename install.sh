#!/bin/bash

set -e

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    curl -LO "$(curl -s https://api.github.com/repos/ethmarks/deci/releases/latest | grep '"browser_download_url":' | grep 'Linux_x86_64.tar.gz' | grep -o 'https://[^"]*')"
elif [ "$ARCH" = "aarch64" ]; then
    curl -LO "$(curl -s https://api.github.com/repos/ethmarks/deci/releases/latest | grep '"browser_download_url":' | grep 'arm64.tar.gz' | grep -o 'https://[^"]*')"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo $ARCH

mkdir deci

if [ "$ARCH" = "x86_64" ]; then
    tar -xzf deci_Linux_x86_64.tar.gz -C deci
elif [ "$ARCH" = "aarch64" ]; then
    tar -xzf deci_Linux_arm64.tar.gz -C deci
else
    echo "Didn't find deci installation file."
    exit 1
fi

rm deci_Linux_x86_64.tar.gz

if [ "$(id -u)" -eq 0 ]; then
    mv deci/deci /usr/local/bin/deci
    chmod +x /usr/local/bin/deci
else
    sudo mv deci/deci /usr/local/bin/deci
    sudo chmod +x /usr/local/bin/deci
fi


cd deci
rm LICENSE
rm README.md
cd ../
rmdir deci

echo "Deci has been installed successfully!"
