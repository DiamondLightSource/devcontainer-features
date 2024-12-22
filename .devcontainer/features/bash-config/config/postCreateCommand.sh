#!/bin/bash

# this script is run once inside the developer container after creation time

# Install man so we can do git <command> --help
apt-get update && apt-get install -y --no-install-recommends man
