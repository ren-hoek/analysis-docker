#!/bin/bash
docker network create \
	--attachable \
	--driver overlay jupyterhub
