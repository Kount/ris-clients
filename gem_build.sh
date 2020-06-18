#!/usr/bin/env bash

set -x
set -e

gem build rubycicd_complete.gemspec

files=$(ls | grep gem)
for file in $files
do
    if [[ $file == *"gemspec"* ]]
    then
        echo "spec file"
    else
        gem=$file
    fi
done

gem push $gem