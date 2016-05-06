#!/bin/sh



chmod 0755 *.sh
chmod 0755 *.perl
chmod 0755 es/*.perl
chmod 0755 pt/*.perl
chmod 0755 en/*.perl
chmod 0755 gl/*.perl

cd CitiusTool
sh install-citiustool.sh

echo "Permissions of execution, done!"
