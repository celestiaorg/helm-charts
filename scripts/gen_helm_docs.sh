#!/bin/bash

# Go to the git root directory before listing charts
cd $(git rev-parse --show-toplevel)

# Loop through the charts directory
for i in $(ls charts | grep celestia); do
    cd charts/$i
    echo "Generating docs for chart: [$i]"
    docker run --rm --volume "$(pwd):/helm-docs" -u $(id -u) jnorwood/helm-docs:latest

    # Go back to the git repo root after each chart generation
    cd $(git rev-parse --show-toplevel)
done