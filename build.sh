#!/usr/bin/env bash
apt-get update
apt-cache search linux-image
apt-get install --no-install-recommends linux-image-686 live-boot systemd-sysv
