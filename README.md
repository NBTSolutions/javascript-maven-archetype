javascript-maven-archetype -- tag: enyo
==========================

Maven Archetype for Enyo Applications. Requires Maven 3.0.4+

Installation:

1. mvn archetype:generate -DarchetypeGroupId=nbt.tools -DarchetypeArtifactId=enyo-app-archetype -DarchetypeVersion=0.1 -DgroupId=nbt.app -Dversion=0.1
2. sh init.sh

Invoke `mvn clean test` to confirm that installation was successful. Then invoke `mvn clean` before beginning development. Default "Hello World" app can be viewed at src/main/webapp/

