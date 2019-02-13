#!/usr/bin/env bash
apt-get update
apt-cache search linux-image
apt-get install --no-install-recommends linux-image-amd64 live-boot systemd-sysv
