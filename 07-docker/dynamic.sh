#!/bin/bash
docker build -t apache-image .
docker run -d --name dynamic -p 8080:80 apache-image