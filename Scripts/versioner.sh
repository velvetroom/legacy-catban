#!/bin/bash

build=$(git rev-list HEAD --count)
version=$(agvtool what-marketing-version -terse1)

if [[ $version == *"."* ]]; then

    version_major_minor=${version%.*}
    version_major=${version_major_minor%.*}

    if [[ $version_major_minor == *"."* ]]; then

        version_minor=${version_major_minor##*.}

    else

        version_minor="0"
    fi
fi

new_version="$version_major.$version_minor.$build"

if [[ $new_version != $version ]]; then
    sleep 1

    agvtool new-version -all $build
    agvtool new-marketing-version $new_version
fi
