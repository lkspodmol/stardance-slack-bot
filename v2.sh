#!/bin/bash

set -e

curl -LO "$(curl -s https://api.github.com/repos/ethmarks/deci/releases/latest | grep '"browser_download_url":' | grep 'Linux_x8>

mkdir deci

tar -xzf deci_Linux_x86_64.tar.gz -C deci

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
