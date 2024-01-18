#!/bin/bash
docker build -t apache-image -f dockerfile
docker run -d --name dynamic -p 8080:80 apache-image