#!/bin/sh

rm init.sh
chmod -R +x scripts

ROOT=`pwd`

ENYOVERSION='2.1.1'
UNDERSCOREVERSION='1.4.3'

git init

echo ">> Adding submodule enyo $ENYOVERSION..."
git submodule add git@github.com:NBTSolutions/enyo.git src/main/webapp/enyo --quiet
cd src/main/webapp/enyo
git checkout $ENYOVERSION-jasmine-enabled --quiet

echo ">> Adding submodule onyx $ENYOVERSION..."
cd $ROOT
git submodule add https://github.com/enyojs/onyx.git src/main/webapp/lib/onyx --quiet
cd src/main/webapp/lib/onyx
git checkout $ENYOVERSION --quiet

echo ">> Adding submodule layout $ENYOVERSION..."
cd $ROOT
git submodule add https://github.com/enyojs/layout src/main/webapp/lib/layout --quiet
cd src/main/webapp/lib/layout
git checkout $ENYOVERSION --quiet

echo ">> Adding submodule underscore $UNDERSCOREVERSION"
cd $ROOT
git submodule add git@github.com:documentcloud/underscore.git src/main/webapp/lib/underscore --quiet
cd src/main/webapp/lib/underscore
git checkout $UNDERSCOREVERSION --quiet

cd $ROOT
echo ">> Initial Commit..."
git add *
git add .gitignore
git add .lvimrc
git commit -m "enyo $ENYOVERSION archetype installed." --quiet

echo "Done."
