#!/bin/bash
# your script here

### install go
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

go get github.com/gorilla/mux

go build main.go
