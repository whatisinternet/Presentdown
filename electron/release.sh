#! /bin/sh

npm install
electron-packager . PresentdownViewer --platform=all --arch=all --version=0.36.0 --out=dist --ignore='^dist$' --ignore='^node_modules$' --prune
