#!/bin/sh

bird -c /etc/bird.conf

exec node "build/index.js"