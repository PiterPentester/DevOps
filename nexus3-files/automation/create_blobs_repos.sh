#!/bin/bash
export NEXUS_USER=
export NEXUS_PASSWORD=

cd nexus3-config-as-code/

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-docker.json

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-files.json

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-go.json






