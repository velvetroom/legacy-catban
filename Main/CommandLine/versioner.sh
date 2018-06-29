#!/bin/bash

sourceFiles=$(ls *.swift)
for sourceFile in $sourceFiles
do
    sourceList=$sourceList$sourceFile" "
done

swiftc $sourceList -o Updater
./Updater $commits
