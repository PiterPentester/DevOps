#!/bin/bash
export NEXUS_USER=
export NEXUS_PASSWORD=

cd nexus3-config-as-code/ && ./scripts/upload_function.py -rf ./functions/deleteAllRepositoryConfiguration.groovy -S delete

