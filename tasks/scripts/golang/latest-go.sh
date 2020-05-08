#! /bin/bash
url="$(wget -qO- https://golang.org/dl/ | grep -oP 'https:\/\/dl\.google\.com\/go\/go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1 )"
echo $url | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2