#!/bin/bash

set -e

bundle check || bundle install --binstubs="$BUNDLE_BIN"

rake integrations:refresh_integration_devices

exec "$@"