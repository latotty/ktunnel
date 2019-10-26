#!/usr/bin/env bash

package_name=ktunnel
platforms=("windows/amd64" "windows/386" "darwin/amd64" "linux/386" "linux/amd64")

for platform in "${platforms[@]}"
do
    platform_split=(${platform//\// })
    GOOS=${platform_split[0]}
    GOARCH=${platform_split[1]}
    output_name=$package_name
    if [ $GOOS = "windows" ]; then
        output_name+='.exe'
    fi

    mkdir -p ./releases/$GOOS-$GOARCH
    echo "Building for $GOOS/$GOARCH"
    env GOOS=$GOOS GOARCH=$GOARCH go build -o ./releases/$GOOS-$GOARCH/$output_name -ldflags="-s -w"
    if [ $? -ne 0 ]; then
        echo 'An error has occurred! Aborting the script execution...'
        exit 1
    fi
done