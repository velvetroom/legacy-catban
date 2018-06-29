#!/bin/bash

commits=$(git rev-list HEAD --count)
swiftc main.swift Updater.swift -o Updater
./Updater $commits
