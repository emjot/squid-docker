#!/bin/sh

# This script can be called inside the built container to get the latest available squid version.
# (See Dockerfile print_latest_squid_version target.)

set -eu
versions=$(apk list squid | grep '^squid-' | sed 's/^squid-//' | cut -d' ' -f1 2>/dev/null)
echo "$versions"
