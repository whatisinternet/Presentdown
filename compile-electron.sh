#!/bin/bash

gulp clean
gulp prepare
gulp build
gulp compile-viewer

cd electron
./release.sh
cp -R dist ../electron-packages
cd ..
ls -al electron-packages
