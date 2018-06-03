#!/bin/bash

commits=$(git rev-list HEAD --count)
build=$((commits+1))
echo "Next version: $build"
