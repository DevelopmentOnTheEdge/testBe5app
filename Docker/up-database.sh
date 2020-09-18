#!/bin/bash
CONTAINER_USER=$(id -u) CONTAINER_GROUP=$(id -g) docker-compose -f docker-compose-database.yaml up -d
