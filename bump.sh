#!/bin/bash

function bump_version() {
  # Get current version from file
  current_version=$(sed -n "s/__version__ = \"\([^']*\)\"/\1/p" macprefs/__init__.py | tr -d '\n')

  # Split the version into an array
  IFS='.' read -ra version_parts <<<"$current_version"

  # Increment version based on the provided argument
  if [[ $1 == "major" ]]; then
    ((version_parts[0]++))
    version_parts[1]=0
    version_parts[2]=0
  elif [[ $1 == "minor" ]]; then
    ((version_parts[1]++))
    version_parts[2]=0
  elif [[ $1 == "patch" ]]; then
    ((version_parts[2]++))
  else
    echo "Invalid argument. Please use 'major', 'minor', or 'patch'."
    return 1
  fi

  # Join the version parts back together
  new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"

  # Update the version in the file
  sed -i "" "s/${current_version}/${new_version}/" macprefs/__init__.py

  git add macprefs/__init__.py
  git commit -m "${1^^} Bump version to ${new_version}"
  git push origin master

  echo -n "$new_version"
}

# Usage:
#   bump_version major
#   bump_version minor
#   bump_version patch
bump_version "$@"
