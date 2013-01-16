#!/bin/bash

ROOT=`pwd`

source scripts/init.sh

## install nodejs on cloudbees
## http://wiki.cloudbees.com/bin/view/DEV/Node+Builds
export clean=yes
export skipclean=no
a=$(mkdir /scratch 2>&1)
if [[ $a =~ 'denied' ]]; then
    echo "CloudBees environment not detected. Moving right along..."
elif [[ $a =~ 'exists' ]]; then
	echo "We are in CloudBees land, so initializing nodejs..."
    curl -s -o use-node https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/node/use-node
    NODE_VERSION=0.9.3 \
    source ./use-node

    curl https://npmjs.org/install.sh | sh
    npm install less
else 
	echo "PROBLEM: probably want to file this as an issue in the archetype's github issues"
	echo $result
fi

# compile enyo app
cd src/main/webapp
enyo/minify/minify.sh
enyo/tools/minify.sh -output build/app package.js
