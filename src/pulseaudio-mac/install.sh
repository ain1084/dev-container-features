#!/bin/sh

set -e

apt-get update -y && apt-get install --no-install-recommends -y pulseaudio libasound2-dev
