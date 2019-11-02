#!/bin/bash
export NEXUS_USER=admin
export NEXUS_PASSWORD=g6JZ7AMX

#git clone https://github.com/PiterPentester/nexus3-config-as-code.git

cd nexus3-config-as-code/ && ./scripts/upload_function.py -rf ./functions/deleteAllRepositoryConfiguration.groovy -S delete

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-docker.json

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-files.json

./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-go.json

#nexus3-config-as-code/./scripts/upload_function.py -rf ./functions/repositoryConfiguration.groovy -d ./examples/nexus3-repository-yum.json
