#!/bin/bash

# Create the files if they don't exist
touch supported/games
touch supported/appids
touch supported/list_version

if [[ $(git diff --name-only $GITHUB_SHA..HEAD supported/games supported/appids) ]]; then
  current_version=$(<supported/list_version)
  new_version=$((current_version + 1))
  echo $new_version > supported/list_version
  git add supported/list_version
  git commit -m "Incremented list version to $new_version"
  git push
fi
