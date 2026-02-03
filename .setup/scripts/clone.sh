#!/bin/bash

git clone git@github.com:jeksterslab/fitVARMxID.git
rm -rf "$PWD.git"
mv fitVARMxID/.git "$PWD"
rm -rf fitVARMxID
