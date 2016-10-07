#!/bin/bash

set -o errexit

main () {
  case $1 in
    -build)
      [[ -z $2 ]] && {
        echo "'Error: no location specified. Aborting. "
        echo "' Usage: -build <location>.'"
        exit 1
      }

      build $2
      ;;
  esac

  exec "$@"
}

build () {
  set -o xtrace
  local short_location=$1
  local location="$HOME/aports/$short_location"

  [[ -d "$location" ]] || {
    echo "Error: Location [$short_location] specified not found." 
    echo "Aborting."
    exit 1
  }

  pushd . >/dev/null
  cd $location
  abuild -R

  popd >/dev/null
}

main "$@"
