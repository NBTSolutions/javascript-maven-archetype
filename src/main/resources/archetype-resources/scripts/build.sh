#!/bin/bash

## install nodejs on cloudbees
## http://wiki.cloudbees.com/bin/view/DEV/Node+Builds

export clean=yes
export skipclean=no
a=$(mkdir /scratch 2>&1)
if [[ $a =~ 'denied' ]]; then
    echo "Skipping CloudBees nodejs Install"
elif [[ $a =~ 'exists' ]]; then
	echo "We are in CloudBees land, so initializing nodejs..."
    curl -s -o use-node https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/use-node
    NODE_VERSION=0.8.8 \
    source ./use-node

    curl https://npmjs.org/install.sh | sh
    npm install less
else 
	echo "PROBLEM"
	echo $result
fi

# compile enyo app

cd src/main/webapp
enyo/minify/minify.sh
enyo/tools/minify.sh -output build/app package.js
