#!/bin/bash

git branch -D gh-pages
git checkout --orphan gh-pages

gulp compile-gh-pages
