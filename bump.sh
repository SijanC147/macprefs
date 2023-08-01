#!/bin/bash

function bump_version() {
  local bump_type=$1
  # Get current version from file
  current_version=$(sed -n "s/__version__ = \"\([^']*\)\"/\1/p" macprefs/__init__.py | tr -d '\n')

  # Split the version into an array
  IFS='.' read -ra version_parts <<<"$current_version"

  # Increment version based on the provided argument
  if [[ $bump_type == "major" ]]; then
    ((version_parts[0]++))
    version_parts[1]=0
    version_parts[2]=0
  elif [[ $bump_type == "minor" ]]; then
    ((version_parts[1]++))
    version_parts[2]=0
  elif [[ $bump_type == "patch" ]]; then
    ((version_parts[2]++))
  else
    echo "Invalid argument. Please use 'major', 'minor', or 'patch'."
    return 1
  fi

  # Join the version parts back together
  new_version="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"

  # Update the version in the file
  sed -i "" "s/${current_version}/${new_version}/" macprefs/__init__.py


  local bump_upper=${bump_type^^}
  git add macprefs/__init__.py
  git commit -m "${bump_upper} Bump version to ${new_version}"
  git push origin master

  echo -n "$new_version"
}

# Usage:
#   bump_version major
#   bump_version minor
#   bump_version patch
bump_version "$@"
